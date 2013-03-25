From: =?UTF-8?B?VGlsbWFuIEtlc2tpbsO2eg==?= <arved@arved.at>
Date: Mon, 25 Mar 2013 12:09:00 +0100
Subject: [Buildroot] [Bug 6128] [patch] Fix S01logging pidfile handling
In-Reply-To: <20130320142936.6D2CF9B1DD@busybox.osuosl.org>
References: <bug-6128-163@https.bugs.busybox.net/>
 <20130320142936.6D2CF9B1DD@busybox.osuosl.org>
Message-ID: <5150304C.1080708@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* bugzilla [Wed, 20 Mar 2013 14:29:36 +0000 (UTC)]:
> https://bugs.busybox.net/show_bug.cgi?id=6128
> 
> --- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-03-20 14:30:20 UTC ---
> Thanks. Can you send this as two proper separate patches on the Buildroot
> mailing list?
> 




-------------- next part --------------
--- S01logging.orig	2013-03-20 14:42:18.313615967 +0100
+++ S01logging	2013-03-20 14:42:35.373615539 +0100
@@ -6,13 +6,13 @@
 case "$1" in
   start)
 	echo -n "Starting logging: "
-	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
+	start-stop-daemon -S -q -p /var/run/syslogd.pid --exec /sbin/syslogd -- -m 0
 	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
 	echo "OK"
 	;;
   stop)
 	echo -n "Stopping logging: "
-	start-stop-daemon -K -q -p /var/run/syslog.pid
+	start-stop-daemon -K -q -p /var/run/syslogd.pid
 	start-stop-daemon -K -q -p /var/run/klogd.pid
 	echo "OK"
 	;;

-------------- next part --------------
--- busybox-1.20.x.config.orig	2013-03-20 14:42:31.297615642 +0100
+++ busybox-1.20.x.config	2013-03-20 14:42:51.045615146 +0100
@@ -41,7 +41,7 @@
 CONFIG_FEATURE_CLEAN_UP=y
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
-# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_FEATURE_PIDFILE=y
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
 # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/3d5bb88f/attachment-0001.asc>
