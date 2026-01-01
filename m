Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A67EEB599
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC9880EB8;
	Thu,  1 Jan 2026 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9bWhUxzQWbA; Thu,  1 Jan 2026 13:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA1C80EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767273885;
	bh=eGu0uIZcJCT3R5RahGkiejsCluzEOQZRs0p/BS758+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUbf0kjiA3x2iIX1Pz4w7Zs713Tw/3TLM5KOFaQQfnn3QC/jxgryA6i4+H5KyIbcU
	 Ghc1kVtLNG8QsftWEpCM7FNiq3hQeD7x2rDMfaqXSjNfLrvwaXShpBN6ePnBCxbICQ
	 mSz5dv4wMDAirM2TEjFq+r2egQb7DGoARIIL/vAkmNXiHGtlUhsV3a/Br1OiWg1080
	 dQc9vEQMwD0j0CqzEKU3BZxE017OzRJjZDukerwYai3cYrCYN7p3e4p6i7OHlUXPJU
	 PL7DMImqnIKOgFI1QEopDXRAg9BesR6VljbZid/jaBitsrADfQfX8MiCkYEiTTx/kR
	 0xz3GILhsY6oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA1C80EAE;
	Thu,  1 Jan 2026 13:24:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9968351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF46960717
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyj6bP0zmEPp for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00884606CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00884606CF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3F2987D85; Thu,  1 Jan 2026 13:24:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 14:24:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 394e9881a51f0c0b2e86043b49c009ba7706a207
X-Git-Newrev: 3dd3944097ebf333d7b8c41a0c9eb46d98cdc6d2
X-Patchwork-Hint: ignore
Message-Id: <20260101132440.E3F2987D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: remove broken "condrestart"
 action & comment from init script
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3dd3944097ebf333d7b8c41a0c9eb46d98cdc6d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .checkpackageignore  |  2 +-
 package/dbus/S30dbus | 15 +--------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c36e9401ba..9dddc1788e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -301,7 +301,7 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
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
