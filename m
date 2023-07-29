Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F450C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CC581DF7;
	Sat, 29 Jul 2023 08:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07CC581DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CfKngKAEOzu; Sat, 29 Jul 2023 08:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E99081C0A;
	Sat, 29 Jul 2023 08:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E99081C0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56E671BF869
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307626079B
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307626079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7p_3kljwu_de for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3128B6076C
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3128B6076C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E2C283685; Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 10:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8147e27cdac8f998ec6644a09ce4e8d62b6433c
X-Git-Newrev: 9414a7ee3baabfb1c1ac7c5e748ebcaaf46d49be
X-Patchwork-Hint: ignore
Message-Id: <20230729085842.1E2C283685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: bump to version 1.14.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=9414a7ee3baabfb1c1ac7c5e748ebcaaf46d49be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also apply system.conf and session.conf updates to dbus-broker.

License file is changed due to:

-D-Bus is licensed to you under your choice of the Academic Free
+dbus is licensed to you under your choice of the Academic Free

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-broker/session.conf | 15 +++++++++++++++
 package/dbus-broker/system.conf  | 25 ++++++++++++++++++++++---
 package/dbus/dbus.hash           |  6 +++---
 package/dbus/dbus.mk             |  3 ++-
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/package/dbus-broker/session.conf b/package/dbus-broker/session.conf
index e4758fa218..8e9488b1db 100644
--- a/package/dbus-broker/session.conf
+++ b/package/dbus-broker/session.conf
@@ -12,6 +12,18 @@
        the behavior of child processes. -->
   <keep_umask/>
 
+  <listen>unix:tmpdir=/tmp</listen>
+
+  <!-- On Unix systems, the most secure authentication mechanism is
+  EXTERNAL, which uses credential-passing over Unix sockets.
+
+  This authentication mechanism is not available on Windows,
+  is not suitable for use with the tcp: or nonce-tcp: transports,
+  and will not work on obscure flavours of Unix that do not have
+  a supported credentials-passing mechanism. On those platforms/transports,
+  comment out the <auth> element to allow fallback to DBUS_COOKIE_SHA1. -->
+  <auth>EXTERNAL</auth>
+
   <standard_session_servicedirs />
 
   <policy context="default">
@@ -23,6 +35,9 @@
     <allow own="*"/>
   </policy>
 
+  <!-- Include legacy configuration location -->
+  <include ignore_missing="yes">/etc/dbus-1/session.conf</include>
+
   <!-- Config files are placed here that among other things,
        further restrict the above policy for specific services. -->
   <includedir>session.d</includedir>
diff --git a/package/dbus-broker/system.conf b/package/dbus-broker/system.conf
index 4b17fbd90e..272f92361e 100644
--- a/package/dbus-broker/system.conf
+++ b/package/dbus-broker/system.conf
@@ -14,18 +14,33 @@
   <!-- Our well-known bus type, do not change this -->
   <type>system</type>
 
-  <!-- Fork into daemon mode -->
-  <fork/>
-
   <!-- Run as special user -->
   <user>dbus</user>
 
+  <!-- Fork into daemon mode -->
+  <fork/>
+
   <!-- We use system service launching using a helper -->
   <standard_system_servicedirs/>
 
+  <!-- This is a setuid helper that is used to launch system services -->
+  <servicehelper>/usr/libexec/dbus-daemon-launch-helper</servicehelper>
+
+  <!-- Write a pid file -->
+  <pidfile>/run/messagebus.pid</pidfile>
+
   <!-- Enable logging to syslog -->
   <syslog/>
 
+  <!-- Only allow socket-credentials-based authentication -->
+  <auth>EXTERNAL</auth>
+
+  <!-- Only listen on a local socket. (abstract=/path/to/socket
+       means use abstract namespace, don't really create filesystem
+       file; only Linux supports this. Use path=/whatever on other
+       systems.) -->
+  <listen>unix:path=/run/dbus/system_bus_socket</listen>
+
   <policy context="default">
     <!-- All users can connect to system bus -->
     <allow user="*"/>
@@ -54,6 +69,8 @@
            send_interface="org.freedesktop.DBus.Introspectable"/>
     <allow send_destination="org.freedesktop.DBus"
            send_interface="org.freedesktop.DBus.Properties"/>
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Containers1"/>
     <!-- But disallow some specific bus services -->
     <deny send_destination="org.freedesktop.DBus"
           send_interface="org.freedesktop.DBus"
@@ -84,6 +101,8 @@
            send_interface="org.freedesktop.DBus.Debug.Stats"/>
   </policy>
 
+  <!-- Include legacy configuration location -->
+  <include ignore_missing="yes">/etc/dbus-1/system.conf</include>
 
   <!-- The defaults for these limits are hard-coded in dbus-daemon.
        Some clarifications:
diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 0e48d4dafd..638bb4bc6f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.28.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  9da1e3f2b73f75eec0a9e4509d64be43909d1f2853fe809528a0a53984d76420  dbus-1.12.28.tar.gz
+sha256  a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35  dbus-1.14.8.tar.xz
 
 # Locally calculated
-sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
+sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 99d2c4301c..930b1a298b 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,8 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.12.28
+DBUS_VERSION = 1.14.8
+DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
