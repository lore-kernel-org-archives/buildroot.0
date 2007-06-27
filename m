From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 27 Jun 2007 02:19:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20070627091900.69F52A461E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-27 02:18:58 -0700 (Wed, 27 Jun 2007)
New Revision: 18949

Log:
- the actual current version of NTP is 4.2p2 (Julien Letessier)
- fixed the configure flag (Julien Letessier)


Modified:
   trunk/buildroot/package/ntp/ntp.mk


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.mk
===================================================================
--- trunk/buildroot/package/ntp/ntp.mk	2007-06-27 00:20:38 UTC (rev 18948)
+++ trunk/buildroot/package/ntp/ntp.mk	2007-06-27 09:18:58 UTC (rev 18949)
@@ -3,7 +3,7 @@
 # ntp
 #
 #############################################################
-NTP_VERSION:=4.2.4
+NTP_VERSION:=4.2.4p2
 NTP_SOURCE:=ntp-$(NTP_VERSION).tar.gz
 NTP_SITE:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 NTP_DIR:=$(BUILD_DIR)/ntp-$(NTP_VERSION)
@@ -50,7 +50,7 @@
 		--with-shared \
 		--program-transform-name=s,,, \
 		--without-crypto \
-		--enable-tickadj=no \
+		--disable-tickadj \
 	);
 	touch $@
 
