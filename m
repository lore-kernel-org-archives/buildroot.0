Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D882606A337
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J5Y8Q3Jx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aLQWrtdQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6694084F;
	Thu,  5 Nov 2026 13:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei5dwO00too5; Thu,  5 Nov 2026 13:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C54114088F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884990;
	b=KcXMuYXvWyvz/MWdu16K61Pu19j4gW6K89Evu2e+XlZdUZRt++IUjvkOJy1nosSOVZhp
	 xCinDAnDvLl0sFJGj7fG7PH5KNiIJq+8JhqZk7GR6+qeWnUgqw40sKws4kcK5fEcd9wnw
	 Rx/0CKazm9Hi+HUVDentos10wkP12+KsTbV758M3OjR042JuYWOhXGgtXg0Q8xo+FsX/l
	 ZZbngW2v03LM2bJyQelQjjq/KFLZsvJ1gmTm+pkjNDTduh4yfgnPk+SKNFgzom0ZmZNv/
	 QkpKe+xlKSdwcorQz/IMDXuuyOx5poFFdCyUFtExdUwdge1pbgAEch4mddPp6oD6eIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1gd5Nql/EFkV+op9ToVGbnACmqlqB8ss1rKpSyYRsz0=;
	b=nkS/Vk8Goxe2E8rgx6U6rpEPXnR5Bj7q50ij6ViJNLM0ZwYbEwfuMbnbGTVQp6MX6Rnj
	 WJ2B/SFVYE05lDfFCk6W8DfTAcgNDjdxhkw6GdNima9086Vcv1wizwYhiIYwaL3zpXdpl
	 dbb13xlBq2rMIcnHXlyZIjNw/9ihEMPrhO17dDyfUXjT4nQKuZaJ4vuV3DWn9qE2Hh/MF
	 y6jetwSplvDww5EdivsYg9vnM5SJ1q40OTLJvnGOENpQCgKSNyUBqq9NwEdICjm35mmG5
	 qQGRg74U+/MRYuFRfjXkmmPRupuTYVhaSAiyEHbBLfrEY/Zl77A4T8VAWj6Gyahu/Pw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aLQWrtdQ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884990;
	bh=1gd5Nql/EFkV+op9ToVGbnACmqlqB8ss1rKpSyYRsz0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J5Y8Q3JxW3a8Pa1KzFLGupOwkNjiSbocNvVLYcDtbzSeIbtYUgLqXXF+Jucz0dLEK
	 WRyP52xVs64V9q2QQQPqyLbTdydCI8Sqt3aSpj8+U+hSbDuE2pYgeN51MagGVEyqTy
	 TT670W8jQbz8qvkFtNCXLJB2ykB0WZeA50RTf/xrez6UvGbxA+elC+Wb9FKIaVxR3X
	 zPcXxXPTNInoBS8SKApfTw01nEneb0Yn1Zd0TXhB/3m6jwSxqhtN9KwDMawjF/vXb4
	 ToKcv1ryecm+ydbz90IK/VS+Ni7HRdDoLkCutHa1PRAghs7/jPP7QKkZMTuybRjaO5
	 Rg/syKVPlVePw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54114088F;
	Thu,  5 Nov 2026 13:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 009AE34D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4184084F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC_Z_tzNfy5C for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ACF52407FF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aLQWrtdQ
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACF52407FF
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c4d2b741ed9so76673966b.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884981; x=1794489781; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J5A7mSoiNx/HXxHGUMRXLP0XZAh0hkv6dwEpFXL73LY=;
 b=aLQWrtdQ4P66vODwFSEqfVd0MhF3CujlbJYuPd0ESLaWs1dPKkpwKfDl4gp2Zkr6Vy
 EXBTgSO9K52hXU+OQPTy2RvwtTEa5VHYpPMdw+0mlZk0B3joFCsv20+0KvL4e5aKBhwL
 z7CN2N+KGFn645H3y8e0h3OVZdY77pvmKqV4d9e7++eWvY6V/Lo/5X8vVL7mPq7aJSAu
 +k7wiFTwKFiiXBzlJw0Az+u0TDtVtnfdY0ZaOkg/48ugTJsVIFY6Ng9HJ+5pFU0lBBBe
 APDl4Lksi4dDM4pbxjBCAPzM+touPL+/1/1cLCGkDuepmIPUUaGgz3kC47I0MqpGnGMk
 j1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884981; x=1794489781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J5A7mSoiNx/HXxHGUMRXLP0XZAh0hkv6dwEpFXL73LY=;
 b=EJ7o2Z/VhfcunmMnMSNFBcsE8fKMmYLjfBKESvWQ3V/P81FwhbP+M6YqDUIrsx4qLt
 GUDGgDzIOmjtCBOt+iqT+7q1tvrfF/5zBTNZ/YrNNhCIHiQ/ioNfM/1DigPCyUKOQUIZ
 ik7gSXzA0IWJFHECr4p+2ayN1MEhkZn5m5C9omJAf9n1lek51t4SYIk4VyQ4Phfq8HM+
 Ba9pWpfHgqtn8MqVNL1tU3kIXlP4HrtD64mnNTN1MZEtjCKr7OO9/Jfr4/uvVqdzjJZY
 RwuAldCWzH4AY2lxXEIrMajFH6CskKvchjlW9rCt7+bXg1wFUpozQeCdlNj0BOX5WINc
 H8vw==
X-Gm-Message-State: APuU4Z8Z4Grw/odATWzwYMZpGcJdKzzjx6sW/SLbL7S3bQZhR2k4KYT5
 FG2eWa0Au5K+YS3WT1yw8yYbeEpP/P/VRfrmsXg9UgQlDOaw2sUJuyGo4upRTg==
X-Gm-Gg: AYBFou3oVDlIbUphtG62+ylViTFSBBdomm2WD3GNCM/WcrSWj0Gveq/f6hN1RBS2zi7
 u72tmZprH+anFnVtOsKA4YmHY/yVAkXvfEzHwkjwfy7sImUo/3miF79XKHw68d16nf+nBFpv+mi
 r8/ZSbF6fl8GrvTJ0eHs+1fk2P2f3sBwfQiV3LZTuGkkfw3WDKlF7oYqj7BTAM6rfK+oRJQxMVM
 U0ygBykc8My1u3KbgqWxxi3Hib1kqTy4o6bjgx8MY42VHVlNsJBY8DY2CPGI4VITYOf0SRILdwD
 dkM72BXQFiHUHfSjWcRTzwwlqLg+pfhTmwxZITtyYdyNSche1DX3NXfwRmgKGow0/Unn/s+kcs/
 HFd+OvSat5Hs5HZbm/LPiqqXLGBBCdoDJjpv+SArqEUuppkI3wZxUERgeWqbIlAcw5KoImCGS6t
 hgIjvMvJm4buoeF2d8OupuDyYombOusKb931IxEYsap4QtFqAKe5wQulr9mHyMFBarfsY36ZYFo
 T8/KioZ1s22Sf1w6+QSEXDjSLLPVRfirGj2dxICGRd5d89rA5I3etoAQKXhfHPBIIoqh8irr4js
 ppp8toLfAKFSaSj3wGx36FAM110aX8+pouwCHhHVdyfpzmZx1eckSf4FKX88TF9xcQN9A3+r3+E
 RtONjk9Xp
X-Received: by 2002:a17:907:c8c8:b0:c2d:ca32:2176 with SMTP id
 a640c23a62f3a-c4ca7a4f188mr1529873766b.8.1793884980882; 
 Thu, 05 Nov 2026 05:23:00 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:23:00 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:55 +0100
Message-Id: <20261105132258.1868556-3-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132258.1868556-1-yegorslists@googlemail.com>
References: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/libdvbcsa: download from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get.videolan.org does not serve files itself but redirects each request
to a random mirror. One of them, mirror2.evolution-host.com, has been
unreachable for months, so downloads fail whenever it is picked and no
backup site is configured, as on the autobuilders:

  Location: https://mirror2.evolution-host.com/vlc/... [following]
  Connecting to mirror2.evolution-host.com (mirror2.evolution-host.com)|167.114.8.249|:443... failed: Connection timed out.

Download from download.videolan.org instead, which serves the files
directly and is already used by most other VideoLAN packages. The
tarball is identical, so the hashes do not change; also update the
URLs in the hash file comments. While at it, switch from http to
https.

Fixes:
https://autobuild.buildroot.org/results/40e2b22dd76f0a1c58bf68b7fdee8e029c3b484d
https://autobuild.buildroot.org/results/2b4f4cc6d8233131b3f9a20ea72b0553c0569bbe
https://autobuild.buildroot.org/results/11e74d5d14fc250f374c6f665408dbc183c25e62

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libdvbcsa/libdvbcsa.hash | 4 ++--
 package/libdvbcsa/libdvbcsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdvbcsa/libdvbcsa.hash b/package/libdvbcsa/libdvbcsa.hash
index 03ac761255..7eee9e3137 100644
--- a/package/libdvbcsa/libdvbcsa.hash
+++ b/package/libdvbcsa/libdvbcsa.hash
@@ -1,6 +1,6 @@
-# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha256
+# From https://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha256
 sha256  4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d  libdvbcsa-1.1.0.tar.gz
-# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
+# From https://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
 sha1  5f4640a7e93ae6494f24a881414e5c343f803365  libdvbcsa-1.1.0.tar.gz
 
 # Hash for license file:
diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
index 8b733e7423..0080086612 100644
--- a/package/libdvbcsa/libdvbcsa.mk
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBDVBCSA_VERSION = 1.1.0
-LIBDVBCSA_SITE = http://get.videolan.org/libdvbcsa/$(LIBDVBCSA_VERSION)
+LIBDVBCSA_SITE = https://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
 LIBDVBCSA_LICENSE = GPL-2.0+
 LIBDVBCSA_LICENSE_FILES = COPYING
 LIBDVBCSA_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
