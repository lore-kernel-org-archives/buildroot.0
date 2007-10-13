From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:46:31 +0300
Subject: [Buildroot] PATCH: lsof - correct URL
Message-ID: <47113CB7.1030104@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This what I get when trying to get lsof:

ftp lsof.itap.purdue.edu
Connected to lsof.itap.purdue.edu.
530-The name server used by lsof.itap.purdue.edu cannot convert your network
530-address to a host name and back to your network address.  Therefore,
530-lsof.itap.purdue.edu will not accept the connection.  Consult with your
530-DNS provider to determine why DNS lookups do not match correctly for
530-your network address and host name.
530-
530-Even without having proper DNS reverse lookup, you may be able to get
530-lsof from one of these mirror sites:
530-
530- ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof
530- ftp://ftp.tau.ac.il/pub/unix/admin
530- ftp://ftp.cert.dfn.de/pub/tools/admin/lsof
530- ftp://ftp.fu-berlin.de/pub/unix/tools/lsof
530- ftp://ftp.kaizo.org/pub/lsof/
530- ftp://ftp.tu-darmstadt.de/pub/sysadmin/lsof
530- ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof
530- ftp://gd.tuwien.ac.at/utils/admin-tools/lsof
530- ftp://sunsite.ualberta.ca/pub/Mirror/lsof
530- ftp://the.wiretapped.net/pub/security/host-security/lsof/

Patch to use mirror for lsof:

Index: package/lsof/lsof.mk
===================================================================
--- package/lsof/lsof.mk        (revision 20237)
+++ package/lsof/lsof.mk        (working copy)
@@ -5,7 +5,8 @@
 #############################################################
 LSOF_VERSION:=4.78
 LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
-LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+#LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_SITE:=ftp://ftp.fu-berlin.de/pub/unix/tools/lsof/
 LSOF_CAT:=$(BZCAT)
 LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
 LSOF_BINARY:=lsof


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
