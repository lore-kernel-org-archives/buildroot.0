From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:26:38 +0100
Subject: [Buildroot] [git commit] netsniff-ng: add optional dependencies on
	geoip, ncurses and zlib
Message-ID: <20151217163457.8419181EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2efeb839611525f8eef5c6bb20fc00ea4043eeab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rework commit title.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
