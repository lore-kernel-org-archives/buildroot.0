From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:12:00 +0100
Subject: [Buildroot] [git commit] sbc: new package
Message-ID: <20151215212236.7754581DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea614ccdc7dcb866f8b2e1993af54670da02c236
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |  1 +
 package/sbc/Config.in |  8 ++++++++
 package/sbc/sbc.hash  |  2 ++
 package/sbc/sbc.mk    | 15 +++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1eea89b..26009fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -734,6 +734,7 @@ menu "Audio/Sound"
 	source "package/opus/Config.in"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
+	source "package/sbc/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
diff --git a/package/sbc/Config.in b/package/sbc/Config.in
new file mode 100644
index 0000000..f1dbc0e
--- /dev/null
+++ b/package/sbc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SBC
+	bool "sbc"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  An audio codec to connect bluetooth high quality audio
+	  devices like headphones or loudspeakers.
+
+	  http://www.bluez.org/
diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
new file mode 100644
index 0000000..be3c8f7
--- /dev/null
+++ b/package/sbc/sbc.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
+sha256	e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309	sbc-1.3.tar.xz
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
new file mode 100644
index 0000000..60ebc74
--- /dev/null
+++ b/package/sbc/sbc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# sbc
+#
+################################################################################
+
+SBC_VERSION = 1.3
+SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
+SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+SBC_INSTALL_STAGING = YES
+SBC_DEPENDENCIES = libsndfile host-pkgconf
+SBC_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
+SBC_LICENSE_FILES = COPYING COPYING.LIB
+
+$(eval $(autotools-package))
