Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BA7CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49CA14241D;
	Thu, 11 Sep 2025 18:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iFYhnp0taq1; Thu, 11 Sep 2025 18:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF964241E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF964241E;
	Thu, 11 Sep 2025 18:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0205C443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64FC261C69
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V62UavD34kyp for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45CD86E73A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45CD86E73A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43349840F1; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:41:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a729cbf5c2c392c83636d50bb6a244aafd3eea2
X-Git-Newrev: a3d99db3e0d59fdc8113e4fb87b2dab2aadad735
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.43349840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netstat-nat:
 remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a3d99db3e0d59fdc8113e4fb87b2dab2aadad735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes http://autobuild.buildroot.net/results/bc52c072121286ddde3eee98ac28feb98f33dbbd/

The package has not been updated in 15 years (since commit 60ce1b0842de
"Bump netstat-nat to 1.4.10"), the upstream URL is gone and the package
fails to build on modern gcc versions because of missing prototypes, so drop
it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bbb0164de08f761a3399c961700db44befff5c70)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                     |  9 +++++++++
 package/Config.in                    |  1 -
 package/netstat-nat/Config.in        |  6 ------
 package/netstat-nat/netstat-nat.hash |  3 ---
 package/netstat-nat/netstat-nat.mk   | 12 ------------
 5 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 290a5257a0..2fa98283b5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02.7"
+
+config BR2_PACKAGE_NETSTAT_NAT
+	bool "netstat-nat has been removed"
+	select BR2_LEGACY
+	help
+	  The upstream URL is gone and netstat-nat has been removed
+	  from Buildroot.
+
 comment "Legacy options removed in 2025.02.6"
 
 config BR2_PACKAGE_LIGHTTPD_LIBEV
diff --git a/package/Config.in b/package/Config.in
index 9cbe8b5efd..9b6bef6dd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2561,7 +2561,6 @@ endif
 	source "package/nethogs/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
-	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
 	source "package/networkd-dispatcher/Config.in"
diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
deleted file mode 100644
index 6afcf89e3b..0000000000
--- a/package/netstat-nat/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_NETSTAT_NAT
-	bool "netstat-nat"
-	help
-	  Displays NAT connections
-
-	  http://tweegy.nl/projects/netstat-nat/
diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
deleted file mode 100644
index 7530b8a09f..0000000000
--- a/package/netstat-nat/netstat-nat.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca  netstat-nat-1.4.10.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
deleted file mode 100644
index 0d16579a6a..0000000000
--- a/package/netstat-nat/netstat-nat.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# netstat-nat
-#
-################################################################################
-
-NETSTAT_NAT_VERSION = 1.4.10
-NETSTAT_NAT_SITE = http://tweegy.nl/download
-NETSTAT_NAT_LICENSE = GPL-2.0+
-NETSTAT_NAT_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
