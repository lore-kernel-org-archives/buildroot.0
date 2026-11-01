Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D3606A327
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i+W4bzi/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41DC8100D;
	Sun,  1 Nov 2026 10:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMOcxzed8SDD; Sun,  1 Nov 2026 10:28:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA0DA80FB9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793528900;
	b=SHb/4oR3xdP550cZgHFXvyfYpWm6wO5LhCTjdxuOi9lERfW/IGFQwVN6qQxSKrsMnqz7
	 Au7nK2ttHGciE+azZygyIpNIUYy2NB80+TAtGxHlccoQX6W41oO1T4pphA0qXgHRhaoUM
	 ZhaJVXYnQ4F1rE0+9FkUra+ZLbJH7oOGzyUMXB1kIYwlI/bypRADu476NxT+zmz7Ii79F
	 xKC1Z59A3FFpK4zX15bUmJWkwKrIixdTCroG9RUazhkCj7qzO4GQOnK6n83xqwuRakGAK
	 uPZyDuMe6NiGuJrvmgAxTgOT01nsqhhog0HI8KSC/fl6MvFOXpxTF92oCthUZeNSYfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793528900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a3ybfI/UYmorxpTvjB1pB7EkN/gSMhmpZIWDRU2riFw=;
	b=RzSfVRySesMhAYFuq73tYyw49Hw4YiAI19tCC/DKFHBXrVWVzcTORiytWXwUYNdGthNZ
	 cfO/WWrRi+WKghY0COARpc0Qyjigj2L+KVwxZSUUa9J/+w7EcaMc3TaoqiTUUszjK1eoN
	 M46Bpg8XPRzdpOtS51IKCK3xNsuTFnMLL9bdvy48JgJ2zus3r4ck4Cv3r7mdShFxGVhxF
	 l8SbgKo9NcKO0ufu3OzIe42TZu6hMwuQf21X/SjC5uXn54NV9AG/c1gXsRiMlrXg5sy5B
	 PZJAD/dqIKHgEDgea7HSeaHdY6Tb0lXCCYEKvYqbIIBfcq23bApA4lra5+02mpQdZsg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793528900;
	bh=a3ybfI/UYmorxpTvjB1pB7EkN/gSMhmpZIWDRU2riFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=i+W4bzi/HphjBpq4tcl/LNbqm8ifLazCBdDg0Vdv3NhFQN9vua2GrKQ8ivWOA18At
	 FVrzZVb5X0q6DQ70QfZdLN7f9E1ABF0Ppg+U7JXnJTuQ9uEBwxxWbdNoeftbsoRSNy
	 8482qQXxoOHWBWpCrTso1DUT9FwnmtX8Z7AAOfyBVNl7qa1AaSacp0n8yZrzW5OB7m
	 5WoAqw7Dr79gwwdsFUBvmsvRAn422RLzTuiJdEksEc2uNRyP7N1CXshvL2uugbV2mS
	 FUmzNcZNT8Noyn4TSXrLUwLz/pN7SSOe0HeWqb20qN1xz2NqGhFkYf47ntkdvewtY7
	 m9xN1luP/LZoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA0DA80FB9;
	Sun,  1 Nov 2026 10:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D38F4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E9A605C9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9T4kbRYMook for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3852605AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793528897;
 b=FnFnVVNG71ONiycmvxGoC10+39g1ySBzFYELZg3izXzbT3guufJUmH5tOy5CV5IFYolU
 LY190QEOPgWCGYxyNl07Q/u/lqLz+2IBbwAiLEizHo/WxFWU94UjQZHFQjO7Qm3X7RYjZ
 3Y7RNRrougZdJ7ohH3dGUQVWzMpjHq5k1gBZ9W9ZgMXvSNfld8jS2z/5VhbVF3IG6lBvg
 uZLBALv0gf/vrw9xt5lHDnbvTlYOSIC5tD0ZcRr/X1VFgIC3GuUgkP6N96Eut1rjYJWCI
 bH2U0UKbwAS9SqZvoOicLB1cl1Huo5mTW3qA52eb81P5To3t6fqV/AKBMG9RWT5cVJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793528897;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3JP2VUyOYNhvFZiOZrBFgJ7H2EYJGTS12YWqr8MUYO4=;
 b=bMu9Y3TkaTP0cR/twx3BCGfyg/VnMGqlxxv8FIc2QjwVNLJsisCvHQ60GiHVjaBUkYQZ
 P/rcb9ggejz52HfDjEacrsVLhYQVvhS31eT5G9HWWxnaNeui4xb+GojS1mPBHmho8L06f
 RFL6JWtJTvkRpuyI3fLEV/z637Iw1D5K4cPmxBrqSOaSR4QZF11+o5aAtY8FpY2uI8RfY
 VYmqZRQdM4fNBFljLL9LxYBAsgVOCpQQ8gId+koLy9DO/VkIxoaHuxZegWRPyvQ8H1LL6
 9APB9YmNJ+SpReHZPxwDaocwuPzp8Cjwro9/RvKLa25LMgyeogcyflWy9zjgQFmD5bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=y5W9m4HD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3852605AD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:28:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b1f31c63ebso5083305a12.0
 for <buildroot@buildroot.org>; Sun, 01 Nov 2026 02:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793528894; x=1794133694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3JP2VUyOYNhvFZiOZrBFgJ7H2EYJGTS12YWqr8MUYO4=;
 b=Qw6g94VSrzQBSExzyJ32ZkPmrDKfBSY29jakW5Nddf420e3uKp1q6JeJn6XJG38My6
 odfqFhfVpEJKr5Ge2drEnClsLspc9JYL7p4ywKAJF7FSjbZWXQ7c/syLlATdkztLxFjX
 kMoINLS06rM/IZpj26aR4Z0HMFYEKvxgGPz/ssfR9FZEw9HXp9wn/IPqnYbNYeNp8JmN
 lub83CivWPOxDSmdDKCT36ZCn4NKWD3X/rAtWWyjpmVJtFmFal7DW0YxntvLgyNLe6oX
 wonkvcVS5cDDIUNRx4lCzVpvrASF8+2ZwVKfPL1JNFHX3FVVsbHeXDtEaBhVVutKewAn
 a1bg==
X-Gm-Message-State: AFq9FYJS2dxZ01DLqj+CMLg8KH6YvrZ+qbjRrVAfJQV6ogDp9ELOb3Br
 U3nF10WFA+GmAP1/8aPimyJr0NTFg8NXcvxreMD2TVuSWlRtaQMnN4wYOiY5uA==
X-Gm-Gg: AYBFou1yVY8BrJErjZwabHjOwTSUItmyrM2ODmazLL3gd8FSOwYPIgH6ObkfvLe0XrR
 0Uftf/mv0KT1U1Gb2KM0fSDO0CDzjQxQC1hFh730AH/zdrQwV3cvlUqrNcyi7VjqNd7a68xrl1g
 DYkUqFC1SDNfl/EbXd0BkNtcAP/Hkfw8n7kUmOlgbvpoTqI53uRJYwddzNPBNCfz472P2Ipk2eo
 t0CUycL32T02DZlDVWRZhhfau1DYFw6kvY8OgqVQAuQelWzwRLlreOO8Z9oiBd0da+keP2I8izo
 MPaujbo3H3HzrikUmYyorPeAKIdsa0c92PYdjfZo8/t64+mkZijw9jTq+MzDIo1dwPcZO79LPta
 mJ8SjdGc304CUH7QtbGZD7zRd90+MHuYefrJfwt0y/ZqafgZI22sehUbNQweYqT5bfJV0fNQOQ2
 ovKQzcTtC3D+E1DYyJpxXup17IhO6Ho4MZrza1PA+AauM3ZwjAnBJ/E5b2kLZj+HPa8/7xbeQwV
 ZJoAVmhx5hy8m/TRM6uCDZdXmgAGTrEO45A1yXkZZ8bePJJdxmJt1NAC9D+czEwNZ12OUHNX4Ew
 Vq9+ZIvIPr+sGzrzEJQMGBxz59GwhnNvG+yAlHTA0+Rks1HI5xYgv+jLx4VyXN2vlEI240on33l
 O8GTqGs73
X-Received: by 2002:a17:906:f59c:b0:c46:78af:6150 with SMTP id
 a640c23a62f3a-c49d10fccd8mr866808966b.2.1793528894398; 
 Sun, 01 Nov 2026 02:28:14 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4ec9eeb18sm1915280a12.6.2026.11.01.02.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 02:28:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 11:28:13 +0100
Message-Id: <20261101102813.2047542-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wolfssl: fix build on MIPS r6
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MIPS assembly code in wolfcrypt/src/sp_int.c uses the
multu/dmultu, mflo and mfhi instructions and clobbers the hi/lo
registers. These were removed in MIPS release 6, so the build fails
on MIPS64 r6:

  wolfcrypt/src/sp_int.c:4217:5: error: the register '$hi' cannot be clobbered in 'asm' for the current target

and on MIPS32 r6:

  wolfcrypt/src/sp_int.c:4418:5: error: the register '%hi' cannot be clobbered in 'asm' for the current target

BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS was meant to exclude MIPS64 r6, but
the mips64/mips64el conditions test BR2_MIPS_CPU_MIPS32R6, which can
never be set for a 64-bit CPU, and the mips/mipsel condition has no
r6 exclusion at all. Test BR2_MIPS_CPU_MIPS64R6 for mips64/mips64el
and BR2_MIPS_CPU_MIPS32R6 for mips/mipsel instead, so assembly is
disabled on all r6 CPUs.

Commit d8dc5315eb71 ("package/wolfssl: disable assembly when not
supported") introduced BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS to fix the
MIPS64 r6 build, but used the wrong r6 symbol for mips64 and added no
r6 exclusion for mips, so the issue was never fixed. It therefore
affects 2023.02 and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2

Fixes: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e ("package/wolfssl: disable assembly when not supported")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/wolfssl/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 9d173412fe..8eb789274c 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips || BR2_mipsel
+	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS64R6
+	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS64R6
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if BR2_riscv && BR2_RISCV_ISA_RVM
 	default y if BR2_s390x
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
