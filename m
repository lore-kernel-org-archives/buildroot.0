Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E011C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA27681D4D;
	Mon,  3 Jan 2022 21:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWmrP1PTNA4h; Mon,  3 Jan 2022 21:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F15081D18;
	Mon,  3 Jan 2022 21:00:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E58361BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D475C60B3A
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvGMY5MJgoJ8 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CB0D60615
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:00:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so72076358wra.6
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ee+3zJosXjcDQxg7X6/f5D9H3AFFgFV5UVyUDowF0A0=;
 b=J+jsdrr8EjfSHFyUtV2NPP/EcLyDXKk3NkRhfjCOwH2EzP2iC0tE11IVS8PuIzO8Xa
 oW/qq8/pfBH6CnbazK7YL3U4/fniCDICZYX1A8rfq7M6+o0N62+2Eqoq9zGQ1nUfNPSb
 DuX4ikvqVatpXBkaf7U9gumHFBZfZ/Y3Mvuy7v333dYgOFPGcIiWuddECrxkKoScJZsj
 FSGlvTDr/ANK/+odMCmtVKMHyY3Ekx8A3nguzVHVoPHYtF4XyAEkSqD7Y0q2Fjnk2+3W
 /YpVEiQVasI+IJi36TpgR9qji679gDpiwyWDO5Vs4VRc9KP10fIONmR6yhOp1tGJ0j4K
 xhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ee+3zJosXjcDQxg7X6/f5D9H3AFFgFV5UVyUDowF0A0=;
 b=7jXiYV8ujGJTcruOTr0aOg7WbVCup0xwdlg2jYaW0D8KxOR7zH3UcsUCq7ZbEn4fhH
 yzhJ+Mn55+1cvbLvdxWsJfClRbjgEN/kbA6qY+JXgRAcSSY7ZaUBJKsVZDDi/6KBVKkt
 mJer8yE76Zy8npBn+QIoGZoN9+qi5lgRSPLgieHwUYDHbtHM7BnWkFz1WjlF7t693S3s
 H6jxjvds12yzwksTGeimrl34BDmhPMOD+6Sbluw8/US5KFuK7Z3HgwdxVWCPYeeHNMHR
 tCLzUCdrxYUsEaR6X9k0run9phHnKQSsukGyhNJILap4PJMQQqQwOPgWFGj5wCi+qF9j
 TMbw==
X-Gm-Message-State: AOAM5304Zeyi+isQCWnhBB3kIysZ/ffjYhkrQ1VV2CmCGwcQL6o8BPlR
 8ojPPzg2pUAHGs5dSD1pxPy2kwp6Y/Q=
X-Google-Smtp-Source: ABdhPJwlKHjF2JEVUpAR1sM1MfZDd6zpDaJcEXLedvGnzQDmIaj6niptlKUEv0aJzAKoZGik3gZ5yA==
X-Received: by 2002:a5d:5108:: with SMTP id s8mr40622252wrt.477.1641243651940; 
 Mon, 03 Jan 2022 13:00:51 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a204sm38219140wmd.39.2022.01.03.13.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 13:00:51 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:00:46 +0100
Message-Id: <20220103210048.7879-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/qemu: reorder enable/disable
 options alphabetically
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/qemu.mk | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f9f885a1..43450a6649 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -187,39 +187,39 @@ define QEMU_CONFIGURE_CMDS
 			--audio-drv-list= \
 			--meson=$(HOST_DIR)/bin/meson \
 			--ninja=$(HOST_DIR)/bin/ninja \
-			--enable-kvm \
-			--enable-attr \
-			--enable-vhost-net \
 			--disable-bpf \
+			--disable-brlapi \
 			--disable-bsd-user \
+			--disable-cap-ng \
+			--disable-capstone \
 			--disable-containers \
-			--disable-xen \
-			--disable-virtfs \
-			--disable-brlapi \
-			--disable-curses \
 			--disable-curl \
-			--disable-vde \
-			--disable-linux-aio \
-			--disable-linux-io-uring \
-			--disable-cap-ng \
+			--disable-curses \
 			--disable-docs \
-			--disable-rbd \
-			--disable-libiscsi \
-			--disable-strip \
-			--disable-sparse \
-			--disable-mpath \
-			--disable-sanitizers \
 			--disable-hvf \
-			--disable-whpx \
+			--disable-libiscsi \
+			--disable-libxml2 \
+			--disable-linux-aio \
+			--disable-linux-io-uring \
 			--disable-malloc-trim \
 			--disable-membarrier \
-			--disable-vhost-crypto \
-			--disable-libxml2 \
-			--disable-capstone \
-			--with-git-submodules=ignore \
+			--disable-mpath \
 			--disable-opengl \
+			--disable-rbd \
+			--disable-sanitizers \
+			--disable-sparse \
+			--disable-strip \
+			--disable-vde \
+			--disable-vhost-crypto \
 			--disable-vhost-user-blk-server \
+			--disable-virtfs \
 			--disable-virtiofsd \
+			--disable-whpx \
+			--disable-xen \
+			--enable-attr \
+			--enable-kvm \
+			--enable-vhost-net \
+			--with-git-submodules=ignore \
 			$(QEMU_OPTS)
 endef
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
