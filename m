From: universe II <universeii@gmx.de>
Date: Fri, 21 Aug 2015 13:26:11 +0200
Subject: [Buildroot] Bug in package tftp
Message-ID: <55D70AD3.2030302@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
when adding the tftp server to my target system image I found out that 
the tftp server is not started by the corresponding init script. Reason 
for that is a typo in the init script. The tftp binary is installed with 
the filename "tftpd" but the init script tries to call "in.tftpd". Just 
fixing the name in the script solves the problem. Please find below the 
patch for correcting the bug.

Regards,
Andreas


diff -Naur a/tftpd/S80tftpd-hpa b/tftpd/S80tftpd-hpa
--- a/tftpd/S80tftpd-hpa        2015-08-07 11:38:37.572148556 +0200
+++ b/tftpd/S80tftpd-hpa        2015-08-07 14:44:19.394469103 +0200
@@ -6,7 +6,7 @@

  PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
  DESC="HPA's tftpd"
-NAME=in.tftpd
+NAME=tftpd
  DAEMON=/usr/sbin/$NAME
  PIDFILE=/var/run/$NAME.pid
  SCRIPTNAME=/etc/init.d/S80tftpd-hpa
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150821/e21e33fe/attachment.html>
