Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DE9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 19:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A1560ACF;
	Sat, 25 Dec 2021 19:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hRofgSDV-Q7; Sat, 25 Dec 2021 19:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1670460C13;
	Sat, 25 Dec 2021 19:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77A6F1BF32B
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 19:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 667CF60C13
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 19:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFR8uOIIdUom for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 19:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2139060ACF
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 19:49:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r17so23700616wrc.3
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gYuh2qUIN21nJXGus/VaUL3eESrYFcJ7TwFY2/3Ac7Q=;
 b=K8dbu1gjQDr1bsYrEZVCB5r4iRb/sNiDp0rsObpxPvmR7sd7RXS6yMtn2zcSrEW8Uu
 S1xspJISzoZ5p285OcmujY6T+WQjzBb/jGJJeO5Ifowhnr4kCL8hUCT2GpxAVTIlUFP0
 DU6FuwefnUXSOVILWW0UzUeKjJZXB1AIZ8tBZ12F7SjySAgCJipOS736y6kc/eamzlfz
 zKYXFWclEjIaKWG7aU6aGQwq2L3RA5F1jIDYntZFDEXyVS33guUA5NLCM7GEIg36Lpyn
 Y7WQznTHtwcVabk/BaquqQ0H6HAAvuDdWYtVk6ahcF9Lfw2bVq/leWbRKCGhWz8brULL
 vIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gYuh2qUIN21nJXGus/VaUL3eESrYFcJ7TwFY2/3Ac7Q=;
 b=UR0sIa8GtxQ8ZdZiTMoTQIuLOgCg7WSlLC6L1lahr8Vu5HmM4aJD1sLkIP4UDWZFJ8
 v4pYmN+5y0GWZ3kN/fNurBkbzqJIULtUr4a62tCxu6fc2kluAZLAYvUaip8jwI2X37BT
 T9yCrHaiTsuuxv6DswbWdN776Es3zY6yQkoUb7H+ztmm3t4alhg0DW0BOce8YT4XCIcK
 JsFCHV2OvxBgQ71NAvjHNt9ZglNIYUumL0AYn+L1OYMWeziNmhrqVXNkeSzRDZSote9Z
 kHoVa0f2CfGTRzH4z49e+K8E2FZ5zu/L71xkoyvHSf6+sZDeQFJlsSGWam7ErlLFYRFJ
 3o0g==
X-Gm-Message-State: AOAM5318t8NkE3ZxsUBioDvBjrQrCBvls0ptPIrAeu2QTzbVPfKOtSfm
 cIRhEP0xqh6OmIjE60GAzgdN7wxk0ceFSg==
X-Google-Smtp-Source: ABdhPJxeYdmwBzgVgN5OYaYnKlfe+FM3voEIDyDc10wyTmUq4bQteotc3N5VALRQwawC2kwRNTBN6Q==
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr7920539wrg.662.1640461744155; 
 Sat, 25 Dec 2021 11:49:04 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id g18sm9654846wmq.5.2021.12.25.11.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 11:49:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 20:48:25 +0100
Message-Id: <20211225194825.499030-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gzip: bump to version 1.11
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

https://savannah.gnu.org/forum/forum.php?forum_id=10044

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gzip/gzip.hash | 6 +++---
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 5675b3ed50..1cf73ff912 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256 8425ccac99872d544d4310305f915f5ea81e04d0f437ef1a230dc9d1c819d7c0  gzip-1.10.tar.xz
+sha256  9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907  gzip-1.11.tar.xz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index c8fd3ddb7a..92588fcdb8 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.10
+GZIP_VERSION = 1.11
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
