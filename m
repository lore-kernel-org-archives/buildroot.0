From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 May 2012 21:10:42 +0200
Subject: [Buildroot] [git commit] netsnmp: fix build with high BR2_JLEVEL
	settings
Message-ID: <20120527191251.8B2B896DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7643670052a7adc1c2a5f275664774c6d50e6a3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The netsnmp build system is not robust against parallel builds.

Fixes http://autobuild.buildroot.net/results/5bb827425ed07617a47a0c0d942a3c6c423fc02f

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 448e3fd..6d67dc5 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -21,6 +21,7 @@ NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-mib-modules="host ucd-snmp/dlmod" \
 		--with-out-mib-modules="disman/event disman/schedule utilities" \
 		--with-out-transports="Unix"
+NETSNMP_MAKE = $(MAKE1)
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
