From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:48:16 +0200
Subject: [Buildroot] [git commit] package/enet: new package
Message-ID: <20190424205141.92ED78124B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bf328b114d1f015c1bab750c9ee472834687a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

enet will be used by supertuxkart 1.0.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/enet/Config.in | 16 ++++++++++++++++
 package/enet/enet.hash |  3 +++
 package/enet/enet.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e5b69c3ade..56556413aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1917,6 +1917,7 @@ N:	Romain Naour <romain.naour@gmail.com>
 F:	package/aubio/
 F:	package/bullet/
 F:	package/efl/
+F:	package/enet/
 F:	package/enlightenment/
 F:	package/flare-engine/
 F:	package/flare-game/
diff --git a/package/Config.in b/package/Config.in
index 091b16d02d..f592e74a99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1532,6 +1532,7 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/daq/Config.in"
 	source "package/davici/Config.in"
+	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/enet/Config.in b/package/enet/Config.in
new file mode 100644
index 0000000000..ef3f1523da
--- /dev/null
+++ b/package/enet/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_ENET
+	bool "enet"
+	help
+	  ENet's purpose is to provide a relatively thin, simple
+	  and robust network communication layer on top of UDP
+	  (User Datagram Protocol).The primary feature it
+	  provides is optional reliable, in-order delivery of
+	  packets.
+
+	  ENet omits certain higher level networking features
+	  such as authentication, lobbying, server discovery,
+	  encryption, or other similar tasks that are
+	  particularly application specific so that the library
+	  remains flexible, portable, and easily embeddable.
+
+	  http://enet.bespin.org
diff --git a/package/enet/enet.hash b/package/enet/enet.hash
new file mode 100644
index 0000000000..ed5231c779
--- /dev/null
+++ b/package/enet/enet.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 98f6f57aab0a424469619ed3047728f0d3901ce8f0dea919c11e7966d807e870  enet-1.3.14.tar.gz
+sha256 eebe647a9ef7e596b0e8b9216c215f169d762af1a27904a87bc2e05b83735d35  LICENSE
diff --git a/package/enet/enet.mk b/package/enet/enet.mk
new file mode 100644
index 0000000000..b12c1b60af
--- /dev/null
+++ b/package/enet/enet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# enet
+#
+################################################################################
+
+ENET_VERSION = 1.3.14
+ENET_SITE = http://enet.bespin.org/download
+ENET_LICENSE = MIT
+ENET_LICENSE_FILES = LICENSE
+
+ENET_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
