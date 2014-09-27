From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 27 Sep 2014 21:32:42 +0200
Subject: [Buildroot] [PATCH 05 of 15] packages: rename FOO_INSTALL_HOST_OPT
 into FOO_INSTALL_HOST_OPTS
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <ba7545d68ae2f0383285.1411846362@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_INSTALL_HOST_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_INSTALL_HOST_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: rebase

 package/pkg-cmake.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -41,7 +41,7 @@
 $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_HOST_OPT		?= install
+$(2)_INSTALL_HOST_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
@@ -124,7 +124,7 @@
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
