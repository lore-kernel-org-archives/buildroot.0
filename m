Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64937606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ENLuDGmk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CB6606FA;
	Mon,  9 Nov 2026 11:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKFl-RAwsa6J; Mon,  9 Nov 2026 11:40:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 385C4606E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794224412;
	b=DqvhB6gc5bOaF8IOFf9JePE1iSpGj52eDzV7w5Du6pg8AFVCzOhp/CERo9EJF8EFFYHC
	 TVUJD7jxO1162SZI3+qoetJTBQRBB6FNAfbmZiCyMefXvBM8QfKsRGKgOl/+/3rbnXjp0
	 exXueg0mX456zpy9nqLGKonS3y/P5F3x8FJMHHf8ow4SV1+GwIBJzdj323i0rCC12ORfS
	 Li01MEpcMUHf3TXhl8ODgy6ydVJSXKxhumUOvPT/uQjbt8Yc6XQ0mj14J+BxEkIv8QZvz
	 nnutM+1rpB1bsiqtLeyKUTFCfp5Skt1mgHDtp+5Y9IyBjcp7vm0Y3CBtCdRLzTrUUaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794224412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uNYYsrXzIW6wQU5Sc51DHvK+65SiGTm1Z4KUgvlDcxM=;
	b=G/D38NV6+vOuQdj4uuV7s3kjRW1S8UPYpHWZ/H6xqcv0FJ5SIvc+S1sURGMGLqn4aznf
	 eqN+7d2D9drHZoulx61e9BLf8YnHp15YnYbmdJLM0MXVddj7MG4wWqOg02228jUiEvunP
	 bVjFdkGtwbfTefqpcjgkDySJUIJIj4pE3UClRSPHzGPUSpmVmQvhFhYm/wxkyQrNLGPgb
	 N3S7ReYcTKgBJbfaveWrZ3HSv7+3G8kTIOkKxv8Xk8l6+ZCw3TYMqnl5kZ38wNORFEelt
	 08sbsmJLKqQRzgrNtAmoFDtM7QecUborfF5gb8BzBjrzAXzoS+6F7wXVh0rBtmb1wsQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794224412;
	bh=uNYYsrXzIW6wQU5Sc51DHvK+65SiGTm1Z4KUgvlDcxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ENLuDGmk3A+dfiB8mTpIWw2tgirQyeyrZMrf5hbIttiUKujo0AJcZBeH7cpb1dJWe
	 3/nyiHtZfVl8WS3vpZwd3AAsrKP+asFaUsklqgjD7bdg8PxTJcoYPorBbmQg6EM3i4
	 NIAspPVISFcGr2AdHRB/pZkQUJT8XT/KgQhrj4Iy10WdM9UMT0HjG3nzpL/c+5I6Wt
	 hJloUnoy/Trslfa7IwQ+wjs3ma7p8tRB3w4tnvBWf9irSCBln3qdDC7phBz6ZO4jzQ
	 NXtxRJAMu0uRQuiG66bFuZrJNuBy7rsM4JGRP7ewcef0LKQ+/4f/Nby0yMmPhyCyKV
	 9oj2HIRFciMxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385C4606E6;
	Mon,  9 Nov 2026 11:40:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E876E2AC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE8D080E31
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdfMdrNEVNuU for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 11:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5B0180E0B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5B0180E0B
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:40:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4d28f75d62so96840166b.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 03:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224407; x=1794829207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QAEllipoNaIkbtNTf6UTVkVm/gVE9qfoNf6V+lNEwXw=;
 b=V30daOAxOWadCk7QjusY8EBHatL3QzjZRdpLhFkFqCyn2UAuK7f7xdXSw9TG8xiVKG
 Dr2iSanaJkTNoDlN7R0djuanY7Gj3cb6aCtUlZJVSlefEHlV+IZeLxl8/C95n73z80ko
 F6XoVEnNqhaVqU68iHNlNrEzpMLzFHkIgEbXUbVtZ05o96xI2Dkc/be8SR4jgomtnCOK
 hcrDAKMTBuxquG0IH7baxe2vS7r5N8mIch8iU2lsY15Iybf9lC6XOOGOM1p7uoC1f25l
 53AIbVMgUg8sE+6Nnqn9YuaIz2aZVi2ZCPtGsrqSAkRr8wYREtWItYJK736ufQwkaB3c
 d5vw==
X-Gm-Message-State: APuU4Z/sfrEhTCYrKh3U8UTkeHj+DEHfNRRzZn+3RU44PBthA5fyRDbG
 dxRuJzt5jck3t8n7EwgvkqMCiS0NTxhGIpN+iykpiJNLex50GWZeybU7tSfEwA==
X-Gm-Gg: AYBFou0cyOx1f3xp56xFQ5/hleIFG7vuJeM2uV0DcvNz+LJKT/Cd+vF+bEv6volYGAy
 gW+iyVb1hVnckv+ZLipfOdr9L+I+oJUWDy0QY1+hQwSDMgKhOuEzFdJcN1YRW14BjOgOWZtOx9a
 c4nUXygBDL5FQYvTfs27PEtHpb40105f0GNRZ2GSNLqVZUJA+ixvRdnTvgumpjM26kVz94eIYSE
 HPQjoADnzsMO7AiRLB7Jl9bAmJO65CiJk5J5X3zCiY+cY3xyGJURBoQO8e18iNpZu59zSfK5TkS
 oetQ0rAMStD4l/T3gfFjzV4QbNpTa4rmtb5lQLRBGUx3mRcE51GQmF0pa1wk/NUQyzhRrd1x9qh
 dBQROJzw2dldZFEl+gWb+V0wmTrCkWSjjOtSDJK+YpMvxhLtXU2zKFXXMxiRJpIw9T0xceMU2hv
 x2ps3fpm073+nEkxzCST/1UW8FRXh51wq2ODGn4rxH4dR3d0c48y9AdHMpYdYScVAxb5IhHFNXv
 IOt0Ldl1UxHARuBV8ceSp6IDQQUjkGsiCzEHpEqw8V+sU6DhjDCi+mUb13uRYJ2P+D6kbb3h1Z8
 Id0suQe/s7ro2TCCtgXj0mBzeSgljaCXE1FCaJkhpYGI+yyWl9D9nv4xm6jYyx110eKmKf10ggu
 MkI7zRQf3LY5KX0Id+SjuuKCgufjJpg==
X-Received: by 2002:a17:907:9303:b0:c41:a5da:1511 with SMTP id
 a640c23a62f3a-c4d6d58b94dmr264978766b.25.1794224406805; 
 Mon, 09 Nov 2026 03:40:06 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a998a5asm153966366b.72.2026.11.09.03.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:40:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 12:40:06 +0100
Message-Id: <20261109114006.3996712-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xfsprogs: fix host build with
 host-systemd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When host-systemd is built before host-xfsprogs, the installation of
host-xfsprogs fails with:

../install-sh -o autobuild -g autobuild -m 755 -d /usr/lib/systemd/system
chmod: changing permissions of '//usr/lib/systemd/system': Operation not permitted
gmake[2]: *** [Makefile:166: install-systemd] Error 1

xfsprogs' configure takes the systemd unit and udev rule directories
from the systemdsystemunitdir and udev_dir variables of systemd.pc and
udev.pc. host-systemd installs those files in
$(HOST_DIR)/share/pkgconfig, where they hold the target paths
/usr/lib/systemd/system and /usr/lib/udev, so xfs_scrub tries to
install its units and rules there, outside of $(HOST_DIR).

Host xfsprogs tools don't need systemd units or udev rules, so pass
--without-systemd-unit-dir and --without-udev-rule-dir to the host
build.

This issue has been present since commit 45a74068df22 ("package/xfsprogs:
enable host package variant"), which added the host variant without
disabling these service files. It therefore affects 2026.05 and later.

Fixes:
https://autobuild.buildroot.org/results/d76e66075a9fae55ae84b7bd3d7a01594ade43aa

Fixes: 45a74068df22bd88db10bf2296cca9e995c4d097 ("package/xfsprogs: enable host package variant")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/xfsprogs/xfsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index d84d479500..43d7c24b02 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -25,7 +25,9 @@ HOST_XFSPROGS_CONF_OPTS = \
 	--enable-gettext=no \
 	--enable-lib64=no \
 	--enable-libicu=no \
-	--enable-static
+	--enable-static \
+	--without-systemd-unit-dir \
+	--without-udev-rule-dir
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 XFSPROGS_DEPENDENCIES += icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
