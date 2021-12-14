Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21A8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC7460C28;
	Tue, 14 Dec 2021 20:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPTkJ6fU5Cok; Tue, 14 Dec 2021 20:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800E460BF4;
	Tue, 14 Dec 2021 20:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC621BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 164E6813F4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1ykPQR9g5fw for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29C0881453
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 343B981EAD; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54f234c384d23bae73d467a291c625d8a6e324cc
X-Git-Newrev: 2a002466459a17f44f565209a9cfd8512676ca47
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.343B981EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump version to 1.4.63
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a002466459a17f44f565209a9cfd8512676ca47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rebase (and change to git format) 0001-Fix-default-config-file.patch/
  0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch

For details see [1].

[1] https://www.lighttpd.net/2021/12/4/1.4.63/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...efault-lighttpd-configuration-file-to-ha.patch} | 47 ++++++++++++++--------
 package/lighttpd/lighttpd.hash                     |  4 +-
 package/lighttpd/lighttpd.mk                       |  2 +-
 3 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
similarity index 59%
rename from package/lighttpd/0001-Fix-default-config-file.patch
rename to package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
index 47a859770d..1a887655b8 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
@@ -1,4 +1,8 @@
-Modify the default lighttpd configuration file to have one a starting conf
+From d1de409b0aeb8dffd42673444043caf01437804e Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Mon, 13 Dec 2021 22:07:17 +0100
+Subject: [PATCH] Modify the default lighttpd configuration file to have one a
+ starting conf
 
   * Changed the log path to /var/log and logs filenames
   * Disable IPv6
@@ -9,11 +13,16 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
 [Gustavo: update for 1.4.37]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ doc/config/conf.d/access_log.conf |  2 +-
+ doc/config/lighttpd.conf          | 16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
 
-diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.37/doc/config/conf.d/access_log.conf
---- lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf	2015-09-01 14:38:48.684673663 -0300
-+++ lighttpd-1.4.37/doc/config/conf.d/access_log.conf	2015-09-01 14:38:53.975855142 -0300
-@@ -9,7 +9,7 @@
+diff --git a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
+index e685d43..92cff4f 100644
+--- a/doc/config/conf.d/access_log.conf
++++ b/doc/config/conf.d/access_log.conf
+@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
  ##
  ## Default access log.
  ##
@@ -22,12 +31,13 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.3
  
  ##
  ## The default format produces CLF compatible output.
-diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/config/lighttpd.conf
---- lighttpd-1.4.37.orig/doc/config/lighttpd.conf	2015-09-01 14:38:48.684673663 -0300
-+++ lighttpd-1.4.37/doc/config/lighttpd.conf	2015-09-01 14:39:40.256442492 -0300
+diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
+index 495d2a1..c3e1446 100644
+--- a/doc/config/lighttpd.conf
++++ b/doc/config/lighttpd.conf
 @@ -13,8 +13,8 @@
  ## if you add a variable here. Add the corresponding variable in the
- ## chroot example aswell.
+ ## chroot example as well.
  ##
 -var.log_root    = "/var/log/lighttpd"
 -var.server_root = "/srv/www"
@@ -36,7 +46,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -90,7 +90,7 @@
+@@ -90,7 +90,7 @@ server.port = 80
  ##
  ## Use IPv6?
  ##
@@ -45,7 +55,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## bind to a specific IP
-@@ -101,8 +101,8 @@
+@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
  ## Run as a different username/groupname.
  ## This requires root permissions during startup. 
  ##
@@ -56,7 +66,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## Enable lighttpd to serve requests on sockets received from systemd
-@@ -118,7 +118,7 @@
+@@ -118,7 +118,7 @@ server.groupname = "lighttpd"
  ##
  ## Document root
  ##
@@ -65,7 +75,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## The value for the "Server:" response field.
-@@ -144,7 +144,7 @@
+@@ -144,7 +144,7 @@ server.pid-file = state_dir + "/lighttpd.pid"
  ##
  ## Path to the error log file
  ##
@@ -74,12 +84,15 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## If you want to log to syslog you have to unset the 
-@@ -195,7 +195,7 @@
- ## sendfile       - is recommended for small files.
- ## writev         - is recommended for sending many large files
+@@ -192,7 +192,7 @@ include conf_dir + "/conf.d/debug.conf"
+ ## and write(). Every modern OS provides its own syscall to help network
+ ## servers transfer files as fast as possible 
  ##
--server.network-backend = "sendfile"
+-#server.network-backend = "sendfile"
 +server.network-backend = "writev"
  
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
+-- 
+2.34.1
+
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 98c1824783..7601745fd7 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.61.sha256sum
-sha256  43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432  lighttpd-1.4.61.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.63.sha256sum
+sha256  2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9  lighttpd-1.4.63.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 7ca71e356a..98e84e8de8 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).61
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).63
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
