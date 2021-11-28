Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E369AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 01:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F1E80DF3;
	Sun, 28 Nov 2021 01:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j7jVrUg95Go; Sun, 28 Nov 2021 01:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1A180DFA;
	Sun, 28 Nov 2021 01:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3E31BF4E6
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 01:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC41606A5
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 01:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=troodon-software-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qV6vn9oTRG6 for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 01:34:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67861605B0
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 01:34:17 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id q64so18874485qkd.5
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 17:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckV9J5LDa9Csllc4vrlwxMCpMDY3n9uL/TXaG26mIh4=;
 b=FOKVRJYSQ1L4rhFGQrZQdluWpL3hgB5Y3qE48A0MOsuUZUH9kVYly1Lad2Rv/ugcDc
 Bsz0QR1zuteIR5UzxCYtk6H3cHpHwS8zJkLr9uwvHZucMqbyo59dtP1G849jBVW1MLH3
 6O1RXCYmkK02xVmlkMPRf3CHdrWzRAEjZP0XX0dQ1GnYERWfCRFRuk2n+7UIVKS8WUwM
 Y134NeobChsE5iwwGtK6VRJKVCqRMPVTbComsMk6Gd4HlaMriErGTRIVv0cUzTVv6fEN
 nxKNFJzs3FWfPSadgBYC2+soFzS7k4WnyYUmEDIswAvA57WeQRaX09sNkRHwVtKlBmwL
 ksjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckV9J5LDa9Csllc4vrlwxMCpMDY3n9uL/TXaG26mIh4=;
 b=m67bBNYeJlrZyefNZex2Wx31GVASRdvbLWKnA1VEs+V+Sg/qufpruGBK/W5N/3Qcq1
 1zz9cz8N/hUTrkaVuJxMk/xmXoJZYtY87p4y7f+iF3ZxRUD4ZSlOGgWmyaL70mbY6T/p
 AIZ9Wa2q7+iPeFRYw9A1DdWMN1pIrjHrKpLE2fU6pYDP3S0L9n8K7Tlufc8jrIk+eteh
 yN8wFWyOjRPebQg7q48qB8ajcC0UlDqZ6vSvmWofzG3auXuTUADuieqdNgaLwb+4H56j
 8X2keBoysrb2/el/eiR5RHUcAkP6CXJc0xdCiX3xgs+ZDxPyUmtzXBY+C8TcA5d6tFeb
 xrlg==
X-Gm-Message-State: AOAM533hCk0+47kNmaZwcUluz/XIX4JYsYaCHD0Ff1iFnAOXujT5OuOm
 f+dqLmCN9wfYbsjD9geF3SgdJMbnOvww7//oDUk=
X-Google-Smtp-Source: ABdhPJwVBFMvXt2P2wrSQ678I5iBRUpy+PhgoCl4H4Jk6FsvlQBNM6NDzaA/5CqyDVB+5FP+180h0Q==
X-Received: by 2002:a37:91c1:: with SMTP id
 t184mr31513424qkd.129.1638063256059; 
 Sat, 27 Nov 2021 17:34:16 -0800 (PST)
Received: from localhost.localdomain ([50.225.254.130])
 by smtp.gmail.com with ESMTPSA id c22sm6041235qtd.76.2021.11.27.17.34.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 17:34:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 20:33:41 -0500
Message-Id: <20211128013341.84004-1-fhunleth@troodon-software.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fwup: bump to v1.9.0
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also update download site to point to new location.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 87263192e4..2e5b2b1f6c 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9890f0328796f4315e6c1188df5c103855c530fbc14fbc8c12f4b24066c975f1  fwup-1.8.0.tar.gz
+sha256  18ae6753145cef2fd5f5fc83e29c2d883e570668d8aa064ee6c94d4c5e44d73d  fwup-1.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 77eaa528f3..62016d94e3 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FWUP_VERSION = 1.8.0
-FWUP_SITE = $(call github,fhunleth,fwup,v$(FWUP_VERSION))
+FWUP_VERSION = 1.9.0
+FWUP_SITE = $(call github,fwup-home,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
