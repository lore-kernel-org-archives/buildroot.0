Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104A6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985F440865;
	Sun, 23 Jan 2022 10:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcwGA2P_bhkO; Sun, 23 Jan 2022 10:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA1C405CE;
	Sun, 23 Jan 2022 10:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B941BF47D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3123D60B0A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn0f7vTclKDg for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:53:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 154CF605E0
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:53:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i2so8267969wrb.12
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qcg7Co9QejlAKf7BZOiWCLcSkZVVBFmCCDSHn6/qi6I=;
 b=SxP59wEZU4bPlZz8TrbCfkYRQoYtaWb5wWOVLaueEMmEcTDt2cEFeRsEQSDJ+L5B8i
 0cPvGmCPL14ikQ4EK8HV9QgBeWrooPLSELkKYKru/KBJs+MqnXsCydNN5hFpx2foLmxD
 bEtR41lnn/ipvJvZj/ZBg3M5zVOUOPuvno8L7mPj7smalFTZ19xs2w1sSEe/4pPXrVaJ
 f4ZYfMYfYFMkICVx8hvg/Zpmk7Xyhfzk1xQZwsyhm4SH0tKmPANteM1iGunsdHVjSMFa
 l4woWbFD4YeJVCxvCODCbLINjgbngfTnEgdY39wdpHdBuSybCmGJYBY5vVeNY/LmG56G
 d/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qcg7Co9QejlAKf7BZOiWCLcSkZVVBFmCCDSHn6/qi6I=;
 b=gbPOjQSKeio0obRTYTV2tBntfmxO+crD5OH5pjgWz5rM7PEflslWkTZBrnXQdp56Fz
 WWvIs+3uc4nnBouX1tbg415wGzgzMP4ewZPree7RgwwjmrwI1bjEunSticuggSnPgPKG
 3dS6PFHmQ5Le5tx0g1Baehs4mJ/zAkoapU9CLDB3A7wo/Kr/Lu1h7IV6jJBtG6zDdIIn
 hK0dRvA2tNDFz0FEJ9nKd6U8XyawQrR/n4mG7rzL0SW3Qy1QQ/S19/Iup3KGAuqFQxkN
 EM6cIRUdoAb4ZjFLKwkgT4mftlr9O4P58Sr5n3G84VrcGJxN89ZdDGWc1xyL4i39RHGP
 H/bw==
X-Gm-Message-State: AOAM530+3Gg1aH3BaKmtKOI+4bc7b9ZF57FMTzXQQCYR8/Y9tKj0OYCm
 SX0xu9F/ENAYeyvSR/+R9a62K6NjNqY=
X-Google-Smtp-Source: ABdhPJw+3akvQ1moP0RhIEoCT6YQKXVfG0PG3Y5MPUanf+UAEK5oWhFy0R+gpju7aq6BK3Uag1olVw==
X-Received: by 2002:adf:f48f:: with SMTP id l15mr10757010wro.229.1642935204036; 
 Sun, 23 Jan 2022 02:53:24 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 1sm567385wry.52.2022.01.23.02.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:53:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 11:51:46 +0100
Message-Id: <20220123105146.568745-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.32.2
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

- Switch site to get latest version
- README has been renamed to README.md
- Update indentation in hash file (two spaces)

https://github.com/notroj/neon/blob/0.32.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/Config.in |  2 +-
 package/neon/neon.hash | 10 +++++-----
 package/neon/neon.mk   |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 8dc78f0f0a..a3515f4052 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_NEON
 	help
 	  HTTP and WebDAV client library, with a C interface.
 
-	  http://www.webdav.org/neon/
+	  https://notroj.github.io/neon/
 
 if BR2_PACKAGE_NEON
 
diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 2ebefbe520..5a5a77a58b 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
-# Locally calculated after checking pgp signature
-sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
 # Locally computed
-sha256 95f77624e96f6728145826fc895142275451f43f41c073766db3dbbcc8b790b0  README
-sha256 d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
+sha256  986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286  neon-0.32.2.tar.gz
+# Hash for license files
+sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
+sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index da53735d0e..3bbd12561f 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.30.2
-NEON_SITE = http://www.webdav.org/neon
+NEON_VERSION = 0.32.2
+NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
-NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
+NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
