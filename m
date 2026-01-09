Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219E7D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAA1E60D9A;
	Tue, 13 Jan 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvsUS1MQ3hVw; Tue, 13 Jan 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8903060D70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333030;
	bh=j5dS7HVczlV2NidD62jWKNDzEOTKbmwi7Hpddgkxk9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hycmGS9yjNDCo6PBcBvFtA2z6hbk9RvFmPXJQIMiv81VpClLfsTdcal/pysTAAZPm
	 jz8mX/6ikgFsZnpECpQNk5YuZpakPYqkerxrNGIB/LT77eCtViYVfPz+dRBY8WUZdJ
	 NvNOcx+hxc4bv3D3v3dCfUef0k0m3wa4V7DfhdVH8PbujgjACGRRmxayiVfBlawHx9
	 N4WVr91mxE7CSfCT8VMvXGT3v9etocxML8CXTgn10i0aJUyBIDMANeNi+5sr3TNMeM
	 JUSlN6+cZFksSYB1r3cP6NAsjInbQ3C2xT/BV1SyFVzReiTe3K9gjzPXGo6+Vto833
	 XAzSlnimiIZrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8903060D70;
	Tue, 13 Jan 2026 19:37:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0737B1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D2682C04
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtXXETz5M3pg for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB35582B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB35582B94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A7A86184; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:27:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: def51e9746000496e0fe44ea157b75b2bd770281
X-Git-Newrev: 6bfb1a51c4fcb7bdf0da082a10c501bdac0dabd3
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.C9A7A86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dbus: remove
 broken "condrestart" action & comment from init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bfb1a51c4fcb7bdf0da082a10c501bdac0dabd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The "servicename" environment variable was never set, so the condition
in the "condrestart" case would always evaluate to false. Nobody seems
to have noticed since it was introduced with commit
ceb285976563f6ba2c87a17ff92f1b1490df698a in 2007, so simply remove it.

Likewise, the comment in the stop function that mentions $servicename
is incorrect, there is no safety check to the "killall" call.

With those, remove the /var/lock/subsys/dbus-daemon file that was
created but never used.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3dd3944097ebf333d7b8c41a0c9eb46d98cdc6d2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore  |  2 +-
 package/dbus/S30dbus | 15 +--------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3fa9fee9a2..0501de75ab 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -324,7 +324,7 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
 package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
 package/dbus-cpp/0002-cross-compile-tools.patch lib_patch.Upstream
 package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch lib_patch.Upstream
-package/dbus/S30dbus Shellcheck lib_sysv.Indent lib_sysv.TrailingSpace lib_sysv.Variables
+package/dbus/S30dbus Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/dc3dd/0001-no_man.patch lib_patch.Upstream
 package/dc3dd/0002-fix-autoreconf.patch lib_patch.Upstream
 package/dc3dd/0003-fix-for-glibc-2.28.patch lib_patch.Upstream
diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index 26772755d7..da02609f2d 100644
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -12,7 +12,6 @@
 
 # Create needed directories.
 [ -d /run/dbus ] || mkdir -p /run/dbus
-[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
 [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
 
 RETVAL=0
@@ -24,20 +23,14 @@ start() {
     dbus-daemon --system
     RETVAL=$?
     echo "done"
-    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
 }
 
 stop() {
     printf "Stopping system message bus: "
-
-    ## we don't want to kill all the per-user $processname, we want
-    ## to use the pid file *only*; because we use the fake nonexistent 
-    ## program name "$servicename" that should be safe-ish
     killall dbus-daemon
     RETVAL=$?
     echo "done"
     if [ $RETVAL -eq 0 ]; then
-        rm -f /var/lock/subsys/dbus-daemon
         rm -f /run/messagebus.pid
     fi
 }
@@ -54,18 +47,12 @@ case "$1" in
         stop
         start
         ;;
-    condrestart)
-        if [ -f /var/lock/subsys/$servicename ]; then
-            stop
-            start
-        fi
-        ;;
     reload)
         echo "Message bus can't reload its configuration, you have to restart it"
         RETVAL=$?
         ;;
     *)
-        echo "Usage: $0 {start|stop|restart|condrestart|reload}"
+        echo "Usage: $0 {start|stop|restart|reload}"
         ;;
 esac
 exit $RETVAL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
