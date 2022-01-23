Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E74C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 21:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B7B405ED;
	Sun, 23 Jan 2022 21:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1jzsSVLzZtN; Sun, 23 Jan 2022 21:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97EE14011B;
	Sun, 23 Jan 2022 21:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72D0D1BF3F6
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB8183F60
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ePxoOVGzj4N for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 21:30:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34D5383F11
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 21:30:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h29so7453332wrb.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+wOsE5WP0agmSpxGuwCpRyyPbvlJFfHa5N9f6FMoMg=;
 b=DLJCLd/Xpid3LLcMW4+2KWwpYJQ4K+x3Be62D7LST9hMZQYg7JzN2n5nP5v/DBcdVO
 beHeJKNaSQhDaXzSvt7M9yNOj00K6gShP/Bo2A0SSeeJ/0ayqbGIwKmTKw86x/Apf5Wm
 jYuP9Hv5r7uBTPaIiMukHVmCC0UxownY2qj+pA6KT8/k1lBxEvcDcWdNUhFm+z87iYBY
 FDKlNfhCmqOdu5zUPCiCpQWqX6Ywacqolo1A17Cu7X3NFxBi9w+csVv7809dIK05zWzL
 Gd3vpIl2otIoV0JwrpIrqakhFJvx7rJxC/tUNxdARZLqcE72nBQT1eGn4TbOkOy2bPWN
 EH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+wOsE5WP0agmSpxGuwCpRyyPbvlJFfHa5N9f6FMoMg=;
 b=s2kwuw+FzZfpusxSskTUapKx44KurkWc/nYxCiDShdkomDfaFWIFV3sXDQxHa7FtOo
 ul4A2DuSOAn3b1e3oGMhy0enkJU8XlZFgO5nVUpMyJvU7MW7Gm+8/7klhQiB5yb4bOTw
 T804+/leXbm5l/Wu7P3E20a6+u7zyIKKZADCEiwrrtTuuMWeSyCqCysb9yhSqbcgCvuq
 FzVcGVyO10UeqPBxjAxnXEN1LHQf8W6+QrkXlAKFi+LxIWrCkRMd5wHpSVQPeWypl7ad
 miwfyJGcToDyH7SRScOddks2tgLa7PoMhCwkRrQYghJtyKeINIqqs+HOLQCMK81Bpr/T
 4Ksw==
X-Gm-Message-State: AOAM531A8Ni/LESp6dPNn3goJPz7szXeiM3UVRjBhl/nmAHBauymzPp2
 OJxxVR5VVBXx2lKSpjLYsF+vBAKFwpY=
X-Google-Smtp-Source: ABdhPJxwtLLeIViWkhCgjiF4iuqqMheqBb0sC5Kx3cAN3KQogU4Tj5mSdyYVT8gOX+BQY3prUlqwbQ==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr4071789wrz.265.1642973453413; 
 Sun, 23 Jan 2022 13:30:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u14sm14456014wrs.17.2022.01.23.13.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 13:30:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 22:29:16 +0100
Message-Id: <20220123212916.782418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libev: bump to version 4.33
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/xorangekiller/libev-git/blob/rel-4_33/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libev/libev.hash | 4 ++--
 package/libev/libev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index 9ab341dedd..a849f3f39a 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e  libev-4.27.tar.gz
-sha256 c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
+sha256  507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea  libev-4.33.tar.gz
+sha256  c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 38b0530f62..9f3c19d46c 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.27
+LIBEV_VERSION = 4.33
 LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
