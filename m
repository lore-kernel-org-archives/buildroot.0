Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA37AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBB1402B1;
	Sat,  5 Feb 2022 15:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DD2BcYbNnc3H; Sat,  5 Feb 2022 15:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC3F4052D;
	Sat,  5 Feb 2022 15:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E262F1BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF2B660ADE
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RldfjLWuhtA for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 253E660B72
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6CEC82981; Sat,  5 Feb 2022 15:11:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:14:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 714498eb296ff3615c7a1ce92d999d27da97bfb2
X-Git-Newrev: 79f631000fe6846e72f44810452bb764c228ad44
X-Patchwork-Hint: ignore
Message-Id: <20220205151113.C6CEC82981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/keepalived: bump to version 2.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=79f631000fe6846e72f44810452bb764c228ad44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://www.keepalived.org/release-notes/Release-2.2.7.html
https://www.keepalived.org/release-notes/Release-2.2.4.html
https://www.keepalived.org/release-notes/Release-2.2.3.html
https://www.keepalived.org/release-notes/Release-2.2.2.html
https://www.keepalived.org/release-notes/Release-2.2.0.html
https://www.keepalived.org/release-notes/Release-2.1.5.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-core-Fix-compiling-on-RHEL-9.patch        | 34 ------------------
 ...02-dbus-fix-policy-to-not-be-overly-broad.patch | 42 ----------------------
 package/keepalived/keepalived.hash                 |  2 +-
 package/keepalived/keepalived.mk                   |  5 +--
 4 files changed, 2 insertions(+), 81 deletions(-)

diff --git a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
deleted file mode 100644
index 39134fcc35..0000000000
--- a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Tue, 8 Jun 2021 08:57:45 +0100
-Subject: [PATCH] core: Fix compiling on RHEL 9
-
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
-
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/core/layer4.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
-index d2cc971a3..fdca04913 100644
---- a/keepalived/core/layer4.c
-+++ b/keepalived/core/layer4.c
-@@ -27,13 +27,14 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <netinet/in.h>
-+#include <net/if.h>
- #include <linux/icmp.h>
- #include <linux/icmpv6.h>
- #ifdef ERRQUEUE_NEEDS_SYS_TIME
- #include <sys/time.h>
- #endif
- #include <linux/errqueue.h>
--#include <netinet/in.h>
- 
- #include "layer4.h"
- #include "logger.h"
diff --git a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
deleted file mode 100644
index 6287d6117d..0000000000
--- a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Tue, 23 Nov 2021 06:50:59 +0100
-Subject: [PATCH] dbus: fix policy to not be overly broad
-
-The DBus policy did not restrict the message destination, allowing any
-user to inspect and manipulate any property.
-
-Signed-off-by: Vincent Bernat <vincent@bernat.ch>
-
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
-index 2b78a575c..b5ced6085 100644
---- a/keepalived/dbus/org.keepalived.Vrrp1.conf
-+++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
-@@ -3,12 +3,15 @@
-  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
- <busconfig>
- 	<policy user="root">
--		<allow own="org.keepalived.Vrrp1"/>
--		<allow send_destination="org.keepalived.Vrrp1"/>
-+		<allow own="org.keepalived.Vrrp1" />
-+		<allow send_destination="org.keepalived.Vrrp1" />
- 	</policy>
- 	<policy context="default">
--		<allow send_interface="org.freedesktop.DBus.Introspectable" />
--		<allow send_interface="org.freedesktop.DBus.Peer" />
--		<allow send_interface="org.freedesktop.DBus.Properties" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Introspectable" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Peer" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Properties" />
- 	</policy>
- </busconfig>
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 94af43c3e6..9d8ab949b7 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  245bf399e4320064996ac5507236a8896f545d005f6c4c3b91701bcbc5728c60  keepalived-2.1.4.tar.gz
+sha256  c61940d874154a560a54627ecf7ef47adebdf832164368d10bf242a4d9b7d49d  keepalived-2.2.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index e31c02dec5..7a1123b4dd 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.1.4
+KEEPALIVED_VERSION = 2.2.7
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
@@ -12,9 +12,6 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
-# 0002-dbus-fix-policy-to-not-be-overly-broad.patch
-KEEPALIVED_IGNORE_CVES += CVE-2021-44225
-
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
 KEEPALIVED_CONF_OPTS += --enable-json
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
