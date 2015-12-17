From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 17 Dec 2015 15:33:56 +0100
Subject: [Buildroot] [PATCH 1/2] netsniff-ng: check for geoip,ncurses,zlib
Message-ID: <1450362837-8087-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/netsniff-ng/netsniff-ng.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 40eecab..5774ccd 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -16,6 +16,18 @@ NETSNIFF_NG_DEPENDENCIES = \
 	libnl libpcap libcli libnetfilter_conntrack \
 	liburcu libnet
 
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+NETSNIFF_NG_DEPENDENCIES += geoip
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+NETSNIFF_NG_DEPENDENCIES += ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+NETSNIFF_NG_DEPENDENCIES += zlib
+endif
+
 # hand-written configure script and makefile
 define NETSNIFF_NG_CONFIGURE_CMDS
 	(cd $(@D); \
-- 
1.8.3.1
