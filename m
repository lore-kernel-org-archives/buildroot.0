From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:58:51 +0100
Subject: [Buildroot] [git commit] package/riemann-c-client: bump to version
 1.10.4
Message-ID: <20200110214902.29F428794D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e8df81c7c25a7084a3e2d75d4ce710a76750be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/riemann-c-client/riemann-c-client.hash | 3 ++-
 package/riemann-c-client/riemann-c-client.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
index 090288156c..6d4d634d75 100644
--- a/package/riemann-c-client/riemann-c-client.hash
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4b18804f489834fa953f4af887290173c745b471a5993bb108a9142c867de457 riemann-c-client-1.9.1.tar.xz
+sha256 334874f0b9a507a8abbc7138df719cba4f28f12c02c39d5e55090b8edb86f9d2 riemann-c-client-1.10.4.tar.gz
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index b051145f45..6fbb3caf5c 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-RIEMANN_C_CLIENT_VERSION = 1.9.1
-RIEMANN_C_CLIENT_SOURCE = riemann-c-client-$(RIEMANN_C_CLIENT_VERSION).tar.xz
-RIEMANN_C_CLIENT_SITE = https://github.com/algernon/riemann-c-client/releases/download/riemann-c-client-$(RIEMANN_C_CLIENT_VERSION)
+RIEMANN_C_CLIENT_VERSION = 1.10.4
+RIEMANN_C_CLIENT_SITE = \
+	$(call github,algernon,riemann-c-client,riemann-c-client-$(RIEMANN_C_CLIENT_VERSION))
 RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
 RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
 RIEMANN_C_CLIENT_INSTALL_STAGING = YES
 RIEMANN_C_CLIENT_MAKE = $(MAKE1)
+# From git
+RIEMANN_C_CLIENT_AUTORECONF = YES
 RIEMANN_C_CLIENT_DEPENDENCIES = \
 	host-pkgconf protobuf-c \
 	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
