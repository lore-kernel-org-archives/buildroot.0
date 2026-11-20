Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E747606A681
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GqP8TmDf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NpUI7+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C46981948;
	Fri, 20 Nov 2026 22:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9Or0VLLUXId; Fri, 20 Nov 2026 22:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 41EE4818B5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795212470;
	b=XbHC+qiGzCj+uHs5Gz022kUo/iUg2C7A69lajvp+cnCE5ncIo1g2HP72Bq5lhZt/r9p8
	 +GU0SgSmSqprumxkUxbwWUGT9fqev0Ri00dWnDqY+RFaqS693ACtb5NEW9Sx3Y5X+0oCr
	 zbln6bpy/Y6i5SF+hjWoT8lu1K3MQMLLkTYpRGkE014oSIAogeics1f5sV6tohfbEzjRa
	 xQWvrEODmVokYYxK80YlV/k8HNkgfxprFXfWZlZsBsDLoqdE9+gaVh/UkalqmuHPfd1dv
	 6MKU5klxYvEma81M6S2v/8pXmOyMx6a1cWOa5iphtHdIf/OzqTHHMZ6n+zKRc2dxVDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795212470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eWd+5Sjm5fXZjzhCpnINvlfP+2gnKBrPZwvEAnrpavk=;
	b=B+oFFizbRgGX1SpUzxKueMkDvro8MeBQKFwWQchBS7fo7D/kezJQJSG9NRq0NCteQdR3
	 ZXnYdX87PSmPQ+y7vTSJLCZUaMCLjvwek8BIz7WCQknIxdimkImT63NL8IC0MoVAnhXJN
	 FjJytxdka3OIQUbtsO0QuOddDE8L3cEHyPtNLYM9PGg9hfhULql5NiIqc2uNqhdoNHs2j
	 9sYZVHjFzoEaXFBwk1ebBS72/Iqyqgf2ogfF1uvxKmzti8lyAmZjiXaPvUI8vbmXNZdqg
	 nu/Qd2smZkjLbKpEILmlgFIY0M4M8EntWW4fL/ge2SV/Rlr11DTjS9UOtQyqRtdTTfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795212470;
	bh=eWd+5Sjm5fXZjzhCpnINvlfP+2gnKBrPZwvEAnrpavk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqP8TmDfPyE5zlWCTp4pWQ53JAHcS50PuRElY7spw35iypWvxThAiDJHq4YQ0Kr9p
	 JZNTAcGfrtRwmBRyp5dcmyi4Wv2TjZm37XH/Fd9GRyAbAKIweD0nbCkYLhNlNBizEm
	 0HRy9qJQFkzMwru1ggBDD++zxu6zff4WEPsQFmhaHTW5f30pbP6edkGMpo7M2p2Yit
	 CQ7ZnwlEkzfqK3EMrljnpw9Y0eBxt9O84U2a9iArNd357i/RgHZfUyKP+9MdSGSS77
	 Q2ZXtVoqBzK1FKvSYW9B3waCHMELftS4bvYNLkSixUb9DmRfq1crvY0AlLtu4DfGzt
	 dYZ/5Q0v5KmvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41EE4818B5;
	Fri, 20 Nov 2026 22:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B6015D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B0740208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYnF_wny-Rgp for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 22:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C62AA40176
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=F5NpUI7+
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C62AA40176
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso13475605e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795212464; x=1795817264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vNleJywiCdv9p46kNOj4K/CbsVnt5vYa6BFVO50nL9U=;
 b=F5NpUI7+6G9bE3LFfMpLjgAy+R01zBhJ6D01edoXVnz9CaaejX1nffg+SA3Yn70UY+
 gY9/9Z/q3edeEN2YT0HLcP1E1S8iqbssyfVzrnSKo6OV7cT/dYceSKPvP7/sL/KwlxRP
 BV9kt/zi2gnWF6Iqb4hgMnNob/WLQ2R64dtUuzYCj2voFnfTA+KTCgyUrNzP9vTRJVEM
 oV/zAWCJZD9OYzikjIYOgG8S/PCCrCD8HgWIF3rMAR701NhUBAlxbOuPDrF4GHl/uySB
 w6bMSr5Iz4wOhnTeB6fMZzYY97vFoWa30ubQUwp7krnZQ1svWZbZMTmIQrZ7a9S98zjx
 RwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795212464; x=1795817264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vNleJywiCdv9p46kNOj4K/CbsVnt5vYa6BFVO50nL9U=;
 b=2aQIKz0APBoqLTVDy77zU9xp6NGoP/jHZzNI4wfzokWbvCyqoy96CEER8+Y9zgWhAM
 OXKY64Mj0PbTYHpjZETjzDnaYXyqYaFvsYQWSeQgaa0JxtBarMLbBDrqiTMDjqx0f7Cs
 GznII+p8lD+IWC2yqVyLpXTYcusp1mC69AgJMHa/VsAdGQwbbRdIBbsULY6FFnoUt9Pr
 gYHZkl2zG5HBdthia3SzNSpcVn3FEiwHsAfOhylRnzoCQnSlWj8HuHx9+36SRNbp7EY/
 4f9/8npgGaspGYruOWtknr67grXtjgxz6tjiFq0GDzuGnp+sUdVXWAxBo8Qe0ow+M2Zk
 YE+A==
X-Gm-Message-State: APuU4Z9JnwQc7toyUFyTAhPQMgZsnEun6StS3ptkcLkk06MiMzxtahd5
 jvHpk5FkSXt27NijsKjjM/0guRfmCnMY5cBTfeTMEUa8+HIn71RBQ2ABHgMQ/A==
X-Gm-Gg: AYBFou0aj2gc/6+IH1IYoOhmU1KLRavyF5QRR19ZV0Mdks9/TaKRUJNYjT5Fs5/LH9/
 M6nhZAd0W6R2igdNQyHRuGyGL+WqYyaeuZh00DJNep2Ixn6uAvb9XPY3uQXwzrE+CA0Vki80ETa
 n2INuDYPyI1TEBuUr3tU+tPoOL1BEVfB4uRbtJ3F82bETybEyhEQsS3SYVFBhQX8uaauv7Pn8a1
 wTNI4R/QQDSpct3Gf6Pb+ZR/EsJ6kxgxwt9Xx2HoFERT0/c7aK67wmzW3aGE83Rw/aVzo+4Q00w
 70pW6onXVAyTTF+1wO76wfDYdYe27isUr1rEWJypTda7Oq8XkliTR9pTHoU7Iaz8mpC3U1ANNwN
 KiOaRjFyTV/L2tCc0jN22sHTovnjG2woqgtMEwtqr7lk86bPuPjFJDLX7MunMORU3JiUuw6/fiq
 j9IHwuk83ODaFLKYR9FMoIji53nGT6yj6Ey/l/Su8sraDPcWmfUmYfplZl+UwbBZG59AbLXQ8P6
 QrSD695LWG+Krt6/VN8srmu5LjCZdzo+sTVjiCwRw1I62EYAeJjVjp+8Y868oAYMHFhHXWlIR6u
 9bn7ddx5BdmZHhEHY5ZGx83JGIUppdy2u/AFqY8qJwvsc4Owji4=
X-Received: by 2002:a05:600c:1d2a:b0:4b7:6942:39bf with SMTP id
 5b1f17b1804b1-4bb88814031mr120603995e9.28.1795212463564; 
 Fri, 20 Nov 2026 14:07:43 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm138261525e9.6.2026.11.20.14.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 14:07:43 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 23:07:39 +0100
Message-ID: <20261120220739.629147-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108201347.3052372-2-yegorslists@googlemail.com>
References: <20261108201347.3052372-2-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/glibmm2_66: bump to version
 2.66.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/26 21:13, Yegor Yefremov wrote:
> Since GLib 2.89.2, GEmblem and GDBusActionGroup are final types
> (G_DECLARE_FINAL_TYPE), so glibmm 2.66.8 fails to build with the
> current libglib2 2.90.1:
>
>   ../untracked/gio/giomm/dbusactiongroup.h:32:7: error: conflicting declaration 'using GDBusActionGroupClass = struct _GDBusActionGroupClass'
>   ../untracked/gio/giomm/emblem.h:31:7: error: conflicting declaration 'using GEmblemClass = struct _GEmblemClass'
>
> glibmm 2.66.10 contains the backport of the upstream fix,
> commit d26083c41219 ("Gio: Emblem and DBus::ActionGroup: Don't derive
> gtkmm__Gxxx types").
>
> The license files were reformatted and the FSF address replaced by a
> URL, without any change to the license text.
>
> https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.9.news
> https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.10.news
>
> This issue has been present since commit fabeb8ac213d
> ("package/libglib2: bump to version 2.90.1"), which pulled in the
> final types. It is not part of any release yet.
>
> Fixes: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a ("package/libglib2: bump to version 2.90.1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

> ---
>  package/glibmm2_66/glibmm2_66.hash | 8 ++++----
>  package/glibmm2_66/glibmm2_66.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
> index 20249977e8..7cfffa122a 100644
> --- a/package/glibmm2_66/glibmm2_66.hash
> +++ b/package/glibmm2_66/glibmm2_66.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.8.sha256sum
> -sha256  64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329  glibmm-2.66.8.tar.xz
> +# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.10.sha256sum
> +sha256  2b61780203aed98e701d3ea57c8f353e7c8ada9706a79be782f6c5153dd035c0  glibmm-2.66.10.tar.xz
>  # License files, locally calculated
> -sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
> -sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> +sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
> +sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.tools
> diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
> index bbf1a97f3f..0cd2abf0d1 100644
> --- a/package/glibmm2_66/glibmm2_66.mk
> +++ b/package/glibmm2_66/glibmm2_66.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GLIBMM2_66_VERSION_MAJOR = 2.66
> -GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).8
> +GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).10
>  GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
>  GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
