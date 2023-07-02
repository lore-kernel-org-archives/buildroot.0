Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DCCEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 18:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 464DD405F9;
	Sun,  2 Jul 2023 18:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 464DD405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pX0FFnikh-I; Sun,  2 Jul 2023 18:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72D6140AF7;
	Sun,  2 Jul 2023 18:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D6140AF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 301D81BF30B
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 18:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1717E81B69
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 18:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1717E81B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoO7aYRW582I for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 18:17:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158C381B60
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 158C381B60
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 18:17:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8695BA4C00B2
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 20:17:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43694)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qG1dX-0005Pk-2Z
 for buildroot@buildroot.org; Sun, 02 Jul 2023 20:17:27 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 20:17:27 +0200
Message-Id: <20230702181727.570560-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688321848;
 bh=ZBiGurWcBFQw3LTCFMYpvEOkN1FYAw++7z+boPDCz/o=;
 h=From:To:Subject:Date:From;
 b=YDz1H3jYlPrHfx1Q3PccDPDATRueatwHqdfUOawsice+jwH4dBc4rPolzGDqD7ODi
 YDGO0tHRFa7G079EU8G/nMvmqZ1VauKSZgwQnsqz9WF/rmfjp/adsKnhzofJ3taDS7
 RoHShh8PIuZFm8zr7hy2yOVNrwG147NO7XerLib2nyyTQq/TBVIGz1clJ3ZDCAa1Q7
 kkx8WThVKklnG1xhXQ9zy3zYDFo3jOu0FH0Upd+y8QPGHf1LufqWjMyh3mzj/atRXg
 aTT5BtKACPxWOykNLpGOyZUQM01vlK3EqvKvj3N1+/qO3Pv4PYGyH951bccZzDx4UE
 5DIVIxvffI7DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YDz1H3jY
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 23.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
http://stellarium.org/release/2023/03/26/stellarium-23.1.html
http://stellarium.org/release/2023/07/02/stellarium-23.2.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 .../stellarium/0001-add-missing-include.patch | 32 -------------------
 package/stellarium/stellarium.hash            |  2 +-
 package/stellarium/stellarium.mk              |  2 +-
 4 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/stellarium/0001-add-missing-include.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f7fcea3f30..48e5f26507 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1457,7 +1457,6 @@ package/sslh/S35sslh Indent Shellcheck Variables
 package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch Upstream
 package/start-stop-daemon/0002-just-warn-on-missing-arch.patch Upstream
 package/statserial/0001-ncurses-link.patch Upstream
-package/stellarium/0001-add-missing-include.patch Upstream
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 package/supervisor/S99supervisord Variables
diff --git a/package/stellarium/0001-add-missing-include.patch b/package/stellarium/0001-add-missing-include.patch
deleted file mode 100644
index 822fc50367..0000000000
--- a/package/stellarium/0001-add-missing-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f36ce55e7a0fbba11fb7e1d4107ef61a79dc95d3 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 25 Dec 2022 20:38:17 +0100
-Subject: [PATCH] add missing include
-
-Fixes build error:
-
-stellarium-1.2/plugins/MeteorShowers/src/MeteorShowersMgr.hpp:331:12:
- error: field 'm_lastUpdate' has incomplete type 'QDateTime'
-
-Patch sent upstream: https://github.com/Stellarium/stellarium/pull/2933
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- plugins/MeteorShowers/src/MeteorShowersMgr.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plugins/MeteorShowers/src/MeteorShowersMgr.hpp b/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
-index 8096856b6d..17716a68b0 100644
---- a/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
-+++ b/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
-@@ -20,6 +20,7 @@
- #ifndef METEORSHOWERSMGR_HPP
- #define METEORSHOWERSMGR_HPP
- 
-+#include <QDateTime>
- #include <QNetworkReply>
- #include <QNetworkAccessManager>
- 
--- 
-2.34.1
-
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 2488b611a4..e0ee61d2b6 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  802a0e8231cae41ec04f697f70105c291d9719aa6e7fd8cbe1f15068c3324e09  stellarium-1.2.tar.xz
+sha256  3aee154d0de3ed484e3e6fee027cf73e6dd0a677b3ea1af348b225ac02339008  stellarium-23.2.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index a62488907f..4dc5692d79 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 1.2
+STELLARIUM_VERSION = 23.2
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
