Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FE5CCA479
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 21:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA7D83E9C;
	Fri, 17 Jun 2022 21:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA7D83E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68thrgoRwSec; Fri, 17 Jun 2022 21:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0455783E93;
	Fri, 17 Jun 2022 21:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0455783E93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 630AA1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E0AA83E7F
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0AA83E7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTGz7BDIlq3p for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 21:16:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 660F483E7C
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 21:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660F483E7C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B88487121; Fri, 17 Jun 2022 21:04:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 17:03:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e571c3ef476a61392777ead56a4324579ecb39d0
X-Git-Newrev: 55b14a596e580ec5092c6c3951e5a91f4ad1f343
X-Patchwork-Hint: ignore
Message-Id: <20220617210441.3B88487121@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/qt5/qt5webengine-chromium-catapult: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55b14a596e580ec5092c6c3951e5a91f4ad1f343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This version of catapult is python3 compatible and will be used to
replace the python2 only version in qt5webengine-chromium.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbaee8e4564392a6ad24807a0f0136a32c80ec9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                                      |  1 +
 package/qt5/qt5webengine-chromium-catapult/Config.in       |  4 ++++
 .../qt5webengine-chromium-catapult.hash                    |  3 +++
 .../qt5webengine-chromium-catapult.mk                      | 14 ++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 5751d6cb70..143926b743 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -68,6 +68,7 @@ source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webengine/Config.in"
+source "package/qt5/qt5webengine-chromium-catapult/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5webview/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5webengine-chromium-catapult/Config.in b/package/qt5/qt5webengine-chromium-catapult/Config.in
new file mode 100644
index 0000000000..471c2a2dbc
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/Config.in
@@ -0,0 +1,4 @@
+# Not user-selectable, it is only needed to be copied
+# into the chromium source tree.
+config BR2_PACKAGE_QT5WEBENGINE_CHROMIUM_CATAPULT
+	bool
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
new file mode 100644
index 0000000000..8190a6dd5d
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
new file mode 100644
index 0000000000..5d0db1e790
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qt5webengine-chromium-catapult
+#
+################################################################################
+
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE_FILES = LICENSE
+QT5WEBENGINE_CHROMIUM_CATAPULT_INSTALL_TARGET = NO
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
