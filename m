From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:10 +0100
Subject: [Buildroot] [PATCH 11/51] package/slirp: new package
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-12-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in       |    1 +
 package/slirp/Config.in |   25 +++++++++++++++++++++++++
 package/slirp/slirp.mk  |   15 +++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/slirp/Config.in
 create mode 100644 package/slirp/slirp.mk

diff --git a/package/Config.in b/package/Config.in
index 92b07b6..1d8df2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -482,6 +482,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
+source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 endmenu
diff --git a/package/slirp/Config.in b/package/slirp/Config.in
new file mode 100644
index 0000000..dedded3
--- /dev/null
+++ b/package/slirp/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SLIRP
+	bool "slirp"
+	help
+	  The Spice project aims to provide a complete open source
+	  solution for interaction with virtualized desktop devices.
+	  The Spice project deals with both the virtualized devices
+	  and the front-end. Interaction between front-end and
+	  back-end is done using VD-Interfaces.
+	  
+	  This package implements the slirp-part for Spice.
+	  Slirp emulates a PPP or SLIP connection over a normal terminal.
+	  
+	  http://www.spice-space.org/
+	  
+	  NOTE:
+	  This package has some history of a unique kind:
+	    - originally developped as 'slirp' by Danny Gasparovski, and
+	      seemingly abandonned (developper /disapeared/)
+	    - then re-maintained at sourceforge by "Kelly", up to some
+	      time around 2009: http://slirp.sourceforge.net/
+	    - during that period, QEMU (Fabrice BELLARD) forked the code
+	      and included it in QEMU
+	    - and it was imported from this breed by the Spice project
+	      around May 2009
+	    - which is what we use here
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
new file mode 100644
index 0000000..04a4736
--- /dev/null
+++ b/package/slirp/slirp.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# Spice-slirp
+#
+#############################################################
+
+SLIRP_VERSION         = 8c2da74c1385242f20799fec8c04f8378edc6550
+SLIRP_SITE            = git://anongit.freedesktop.org/spice/slirp
+SLIRP_LICENSE         = BSD-4c BSD-2c
+# Note: The license file 'COPYRIGHT' is missing from the sources,
+# although some files refer to it.
+SLIRP_INSTALL_STAGING = YES
+SLIRP_AUTORECONF      = YES
+
+$(eval $(autotools-package))
-- 
1.7.2.5
