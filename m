From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 17:24:38 +0100
Subject: [Buildroot] [git commit] binutils: Also install libopcodes in
	staging
Message-ID: <20150102181119.3AE538083F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a508d93610d63b6abedca990833b038429fc3f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library will be used later in the "lightning" package.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1ff7fba..c3b3c18 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -78,9 +78,11 @@ HOST_BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
-# We just want libbfd and libiberty, not the full-blown binutils in staging
+# We just want libbfd, libiberty and libopcodes,
+# not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
 	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 
