Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB8606A331
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DcReoQ0n
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E93A812DC;
	Fri, 20 Nov 2026 07:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVWMqFDTrUUp; Fri, 20 Nov 2026 07:38:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 962BB80E8D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795160295;
	b=gNPTRucPtFebEzXICAuQY8DFkHqd0mUbrOx98UhLG0CZ91OT7IWaCLqyvhZ0eV/YUoqL
	 cEYS/oy76d8UakGDDr3inCpcMR3pRFDkQ1iTQj3sRRboS9zt6x23B67HRvLtMQYgsY8Ei
	 VdNQqR0OTOwRAKkszuVs0lxctPTpIjPhZx3KPwo7iCsGU4varG78ZPEwEtIgWgpAYx9Kv
	 w0vAOLzjctodSaYsEOsEcKD3UFx7W1s+ojfCEFbsRLeoA/ghg23jidXU0txX2JQqkRCZW
	 rpAJSO4EoEQqTUW7C88kXv1vGScwnSbPxCKjdt+7uhYf5kvQqN3D0xGOBRcyfY0dHIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795160295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T+8tN6KC6+8ugv00uZiYU7zCFgOKvhEXgE51IXdB//8=;
	b=WQSoWirWALnW/Y3FlnUgLs7mKdlMggK0J8eX3rEWa+VfSqd4LDRogB60Ctil9ZCIVol2
	 hCQqr5yGhTpSjjLLyzAwsJiZ/VVYVs4xnwp9GMiX7K6dA20+iINn4ds/rRpYNMfByQ7+7
	 hkyvNvKSTGAJ/h7Kg2NU77fGeub9ztD0j8bgzRKdCYvDu9XeQUok2KiD5tIsS8KvWRcht
	 BS8SHO8gITqTKalCxevJCTj/jojmozc6OpaQDphsrJ9f1g8PSXacBZNaSax+zbYMuLHug
	 mpIKEj5n0JiSNo0iylNnUelvzIydvJKZN7yta1Yd5OPgUt/S56Fp1lxJ9W5DpixADNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795160295;
	bh=T+8tN6KC6+8ugv00uZiYU7zCFgOKvhEXgE51IXdB//8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DcReoQ0nud9OAPRuW7XAigxI99YuJRIp7FO4/Mkuz1JlM0MxgsO4OOExCAFlLoDg6
	 /FqvYDq7GYZUjPdrKzeBzYjYjT5SYts2J/oc/vjrddyxH+dS1TvcH2DrYCRmG/OLku
	 GbUnAxrVE7aWliq+3K1eVjQ5JS2xUgrwFFdF4L/WkW34zfCfZAtAUUp6XK7aiEWmeD
	 G/4yjKoGfozi7GSfrD6VRihNmHvWRTn8nD4vmy61fW+7aYfxgksrVyU3ed0WBnOoVD
	 03NSIX5DqjJsGk7EJSpbkuBgJUfDkUBjq6iwnJ2i5pSlSWqtwZxZWN5EkoGRnZMyGf
	 iO/Zst4EDCOvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962BB80E8D;
	Fri, 20 Nov 2026 07:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49E3222B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300A16072A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K55aZO_n_NP0 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:38:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A7C6606A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A7C6606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:38:12 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c50a2efbe1dso99381366b.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795160291; x=1795765091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HpNL4LjWskAK3bgltpqRv5Fsjm3Mh1VT2OYRVPz5d5U=;
 b=DRCJJe1Xqw+IyNHfBnfr43STmjHhWEBqc3g+H3U4zR5UwWLzfE1OLc4KLdSutwQEjt
 29lGOkQ9KWbRamCegtWHZYPKTN/XSXYjJDQRWIu8aECUQw5Xo1OccmB0VMsKuZFFQ7VK
 9Pq8TWjVELFKBvO4Ncd9AzI0qHXy18DThK1eZEFJK+9mD80gdiEbpLAkkRM2W9+nTcNm
 CF5lnO1+ff0zi14MHS07fy5NJfWItXCdrjKHWBACXYjqls8+fRKuwAu4nZAN4DHI3oVZ
 xvLGBuxvOLl1Hiz4aGB3g3EAcRb53eUibCqVshpYGNhAjzz+l9NZFafjO7rgv+5ynFI2
 E5qw==
X-Forwarded-Encrypted: i=1;
 AL+hErFyXF40lUMvZFjPMMp6JpSoiYitU7Gmb4mry0FicrBP1xHrYAkdwUHMhgNUrEbJHuXY64y5xelsrFE=@buildroot.org
X-Gm-Message-State: APuU4Z88OtBsuAUXmA4weVgb5aRd2avOKUB+EnL6zX0JWUtuOMrungw9
 MPfio3EXELnYF4ZT+A+FJZdJ01NqFgNfK0/dyHYe4pG0EqVrGXvVv60a
X-Gm-Gg: AYBFou22YHc1TSmkiLOyTkANJk8+mT3weOXP5+4QIBRvYxzU9l2qfh1ipWFzBNo3zjO
 0dIvOoa7b9p9OkqpDighEur1jbR5TVbSXj8bdMOcAPQ8LDmWWK9hpzAjxP9l6PAa5SJ8jD/AVhD
 lGgB8A0QBQ+gyCLFyXHoPQp0k0jt+lYLaH31++uK5C4c0i3HOP8w8+E1MeFSqQtvQ2u70gT05/z
 JGzwIxYU2J7G6mrCpX7FTFd1mWMqGCLONbAHMPA0mSIaZ+P1B2bpnodZoVJWTEaUt+P7OflM4VO
 Om99U2d2QXAK8CKD7KQc+uiu+6Xcl10Hrxy4bC0cjEb21nYatRaFBYivgx+yKaMTyeha1bPIzX3
 hVou9Pc/mcldI+Bk298dz8JwyOJmfKP3ZLX7mYb2M+Mu6qRPDbFLtyXrM3eGcKL0KkY6tLlOQMq
 TLZs7hZnvXQDICTjiKTXLekSZb1ZtvxeSfwcgrr5DIO5UwvZ9SUYh/u42Em5OfVDK3OBVFR3RB+
 OUfqujKozRHxyRutsYTER5CqdvrmI7IvaqTQk1mreJ1Ac9MxK1R/c1LU4z6NCEitp5iPfM+5k/e
 Qu1/3nsFOAhByRqVIvzos5CMDjyYxmV458U2VjhA88phaqETSj0L35PJyGhEVuvqXVBERFe1VC7
 KKVHkGT+T
X-Received: by 2002:a17:907:3e89:b0:c51:3bfa:8d3b with SMTP id
 a640c23a62f3a-c513bfa8f32mr177999766b.37.1795160290626; 
 Thu, 19 Nov 2026 23:38:10 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513a8678cdsm70779766b.0.2026.11.19.23.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 23:38:09 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 20 Nov 2026 08:38:09 +0100
Message-Id: <20261120073809.3593738-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av_xvqN923r-qYUE@waldemar-brodkorb.de>
References: <av_xvqN923r-qYUE@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: add renameat2 syscall
 wrapper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Waldemar,

On Fri, Nov 20, 2026 at 8:07 AM Waldemar Brodkorb <wbx@openadk.org> wrote:
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...02-renameat2-add-new-syscall-wrapper.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/uclibc/0002-renameat2-add-new-syscall-wrapper.patch

Thanks for the quick fix. I tested it with the configuration of the
optee-client autobuilder failure (arm926t, soft-float, headers 6.6):
optee-client 4.9.0 builds now and tee-supplicant links renameat2() from
libc. I also built riscv64, which has neither rename nor renameat, so
rename.c's local renameat2 stub is used there; it compiles without
warnings next to the new declaration in stdio.h.

At runtime (qemu-user, arm and riscv64), RENAME_NOREPLACE onto an
existing file fails with EEXIST, RENAME_EXCHANGE swaps the files and
RENAME_NOREPLACE to a new name succeeds.

I think this is meant for next (uClibc-ng 1.0.60, where 0002 is the
next free number; on master it clashes with
0002-ppc-fix-e500-fenv-support.patch). If so, could you mark it
[PATCH next] and add a short commit message, e.g. that optee-client
needs renameat2() since 4.8.0, with:

Fixes: https://autobuild.buildroot.org/results/a1776b9fb064aea72e37965e9c04d44ab1743b2c

Master and 2026.11 would keep failing until next is merged. My
optee-client patch [1] could cover them in the meantime and be reverted
on next once your patch is in.

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

[1] https://patchwork.buildroot.org/project/buildroot/patch/20261119080856.2471644-1-yegorslists@googlemail.com/

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
