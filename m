Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F3C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C15D481DFB;
	Mon,  3 Jul 2023 19:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C15D481DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e633NqiB0kXe; Mon,  3 Jul 2023 19:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D506D81DF1;
	Mon,  3 Jul 2023 19:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D506D81DF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4F31BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3867F81DF1
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3867F81DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDcA5o8LHnsW for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:23:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 442A481DEC
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442A481DEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 289F3864AF; Mon,  3 Jul 2023 19:23:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:17:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f80063aecbc80f3154271febb60fe797fdeb3b03
X-Git-Newrev: ca4a986c9df314bdcf9786c6fe7d292fa75a198e
X-Patchwork-Hint: ignore
Message-Id: <20230703192310.289F3864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 23.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca4a986c9df314bdcf9786c6fe7d292fa75a198e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://stellarium.org/release/2023/03/26/stellarium-23.1.html
http://stellarium.org/release/2023/07/02/stellarium-23.2.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                               |  1 -
 package/stellarium/0001-add-missing-include.patch | 32 -----------------------
 package/stellarium/stellarium.hash                |  2 +-
 package/stellarium/stellarium.mk                  |  2 +-
 4 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7d544a6e61..0f6bdd92fa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1460,7 +1460,6 @@ package/sslh/S35sslh Indent Shellcheck Variables
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
