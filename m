From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:34:47 +0200
Subject: [Buildroot] [git commit] package/spice-protocol: bump to version
 0.14.3
Message-ID: <20201014212350.672788125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1fe8a00ee6c09c990b9670e4b68588d7907f08f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add link to upstream sha256
- Switch to meson-package
- Update indentation in hash file

https://github.com/freedesktop/spice-protocol/blob/v0.14.3/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice-protocol/spice-protocol.hash | 6 +++---
 package/spice-protocol/spice-protocol.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index c23135141a..f02cf7f0e2 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256	b6a4aa1ca32668790b45a494bbd000e9d05797b391d5a5d4b91adf1118216eac	spice-protocol-0.14.0.tar.bz2
+# From https://www.spice-space.org/download/releases/spice-protocol-0.14.3.tar.xz.sha256sum
+sha256  f986e5bc2a1598532c4897f889afb0df9257ac21c160c083703ae7c8de99487a  spice-protocol-0.14.3.tar.xz
 
 # Hash for license file
-sha256	eb55ea746be694c449224c7ddce6340648b075fd377281712a19094e7fb7ef92	COPYING
+sha256  eb55ea746be694c449224c7ddce6340648b075fd377281712a19094e7fb7ef92  COPYING
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index f8c55c7b01..172d45687d 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.14.0
-SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
+SPICE_PROTOCOL_VERSION = 0.14.3
+SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.xz
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3-Clause
 SPICE_PROTOCOL_LICENSE_FILES = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
