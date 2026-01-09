Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6393D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC37283E3B;
	Tue, 13 Jan 2026 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zijX2X40VviT; Tue, 13 Jan 2026 19:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1779E83E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333269;
	bh=+5yk0nGIZKzcd0Xlbk78GgWBWno5KNOmNXFIr8rgW0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BxJYxitK98MFwUFBuIINeZun5v8M1jQFyygnbLPm1Veji4IbQa5xRT2IN1kCCzK6x
	 9T6YmwJaRFpGCK0ydgoFToA0xI7dLECIBcMXsmnPOHP17TLo7AguFen5IU9tonMKi9
	 VOfUzs/7WnDqx6aJTBUlWB7aXiFVY4AgUwurrJTPgNTZMqXf8h+a/EPHRVCMLRoaRQ
	 JVFIAkwydJ26Z/iAaVMaGPMxPI/VLrd8PMhgu/kDTzshN+oO1IpB6xoaFEF2XRjQRA
	 cRjt46sX1x1acgapFILaaVa/MR8utCR+kpLYhF+16TO36xD2yQQH7ad0pHEBu9KtNc
	 S8FhdjgDC5kQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1779E83E72;
	Tue, 13 Jan 2026 19:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B3F1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE43406EF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKfCezF8zh4B for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C8A406E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94C8A406E7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9307F86E70; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:27:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: bb678171b47dc8bb53f2e63321505c608680abd1
X-Git-Newrev: f6d2f863880793072fc05ded5f1a4425390da7c9
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.9307F86E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dbus: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6d2f863880793072fc05ded5f1a4425390da7c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index 44f4e069ea..dea84e98ec 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -303,7 +303,7 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
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
