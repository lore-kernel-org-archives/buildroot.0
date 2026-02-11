Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB646ECD6E9
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D110840D0;
	Wed, 11 Feb 2026 20:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB0stzYhhnhT; Wed, 11 Feb 2026 20:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 100D28408B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770842009;
	bh=O8ifRB+dlEXQIpL6K/Jd51qG7fJsul84NErrqoMgWkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TFia/CdjBGnW8Ak/QQ/yNbEc/3Mq0M6/7iAP/3MLgy+P7milX67qftKLjfS7Ej0VP
	 gWgAKqL6y+rWF7zXlOKt+vt2JmCzMuv7VyBh0oEYt95ICbDFsmEwf5BUo08WDR7NBM
	 swTHl5CB/6oKg2uIIYxEwNZh0oHL/pA+bKkAMswoa1UbSOI4QUIUgY/iE23DfbGtVL
	 0zOJ736SwQm9mQ9+YN4sHLytlncuoMVuRZxLLzkZ3pz7oro1vbcFftdVvyUVm/XGnl
	 b/z+4dqzYj1HLYbuD/+zu5VahMUZ0tV3SJahj0psaEOFDeQkBSFOmvutrqIY3+dBjj
	 fPWuVZHbC5axA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 100D28408B;
	Wed, 11 Feb 2026 20:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2903C23D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9D0606C2
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJ2E2734VCtj for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52542606B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52542606B4
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C5B86C03; Wed, 11 Feb 2026 20:33:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 21:24:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 267fac241c80054bd1b96ed1f2b1a569a96f0985
X-Git-Newrev: c637c3dda4a9b8fc1200b32181162dc48a940b1a
X-Patchwork-Hint: ignore
Message-Id: <20260211203327.40C5B86C03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.59.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c637c3dda4a9b8fc1200b32181162dc48a940b1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Requirement for Boost.DateTime was removed in 2.54.0 [0]
- Requirement for Boost.System was removed in 2.59.0 [1]
- drop "WITH_GUI" conf_opt as it was dropped in 2.32.0 [2]
- LICENSE hash changed due to year bump.

Release notes:
https://github.com/PurpleI2P/i2pd/releases/tag/2.59.0

[0] https://github.com/PurpleI2P/i2pd/commit/0992a5124fc9d214624fccdf4386a50f53d6f8ef
[1] https://github.com/PurpleI2P/i2pd/commit/06a86f31a12815fbd16615cc9fa17199bac1ac17
[2] https://github.com/PurpleI2P/i2pd/commit/db6a0e6ad9124ef9b6217af487b3c844234ba5e1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/i2pd/Config.in | 2 --
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index c1ba08ef75..cb6f7894ea 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -9,10 +9,8 @@ config BR2_PACKAGE_I2PD
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index a539a4dd1a..0d7755b585 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.58.0/SHA512SUMS
-sha512  d5d87a04ff5f8481516c00b07dd46726dfb3f0de67f4932874a0655b4adfa448a434056a131d727dd79a2f3ee1f6cc9aef5dc176a0b5ab546d8e94b6c0b38ee5  i2pd-2.58.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.59.0/SHA512SUMS
+sha512  5fa4365eaa6fbc0e448732d3c96b867e27db21927727aeb9df8241d56fea08561028a7b6d51ba7fa1141d53c95b848108806edb9f420c2ebbed85f627f045af7  i2pd-2.59.0.tar.gz
 # Locally computed:
-sha256  5ec428c65b0bc8680e08daa75aa060fe72b5b3c3b89082ac02031e0f2d3d0039  LICENSE
+sha256  eb5ac2a5ede8cd6bed9e6d93ad943119a73bfaba378f21bafa307f9b026b2034  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 3681e6006e..ac0348c24a 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.58.0
+I2PD_VERSION = 2.59.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
@@ -15,8 +15,6 @@ I2PD_DEPENDENCIES = \
 	openssl \
 	zlib
 
-I2PD_CONF_OPTS += -DWITH_GUI=OFF
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 I2PD_CONF_OPTS += \
 	-DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
