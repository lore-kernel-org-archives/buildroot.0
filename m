From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:31:30 +0100
Subject: [Buildroot] [git commit] package/spice-protocol: new package
Message-ID: <20121216204048.608F29A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31d41cdefa4869fdd544dd9812c6f1902b72caab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/spice-protocol/Config.in         |   12 ++++++++++++
 package/spice-protocol/spice-protocol.mk |   14 ++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eaf42e3..3de0140 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
+source "package/spice-protocol/Config.in"
 source "package/squid/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/spice-protocol/Config.in b/package/spice-protocol/Config.in
new file mode 100644
index 0000000..b354361
--- /dev/null
+++ b/package/spice-protocol/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SPICE_PROTOCOL
+	bool "spice protocol"
+	help
+	  The Spice project aims to provide a complete open source
+	  solution for interaction with virtualized desktop devices.
+	  The Spice project deals with both the virtualized devices
+	  and the front-end. Interaction between front-end and
+	  back-end is done using VD-Interfaces.
+	  
+	  This package implements the protocol-part of Spice.
+	  
+	  http://www.spice-space.org/
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
new file mode 100644
index 0000000..dcfe50d
--- /dev/null
+++ b/package/spice-protocol/spice-protocol.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# Spice-protocol
+#
+#############################################################
+
+SPICE_PROTOCOL_VERSION         = 0.12.2
+SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
+SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases/
+SPICE_PROTOCOL_LICENSE         = BSD-3c
+SPICE_PROTOCOL_LICENSE_FILES   = COPYING
+SPICE_PROTOCOL_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
