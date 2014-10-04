From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 20:49:46 +0200
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: rename
	_INSTALL_HOST_OPTS -> _INSTALL_OPTS
Message-ID: <20141004185021.ABBB19D825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a25cec33d0680ba64b6d961da96bfe4b91f0bae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch renames, consistently with the other package
infrastructures, the _INSTALL_OPTS variable for host CMake-based
package.

As mentioned in [1], no host-cmake-package uses this variable so far;
so it is a safe rename.

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 85d8828..92574e2 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -41,7 +41,7 @@ $(2)_CONF_OPTS			?=
 $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_HOST_OPTS		?= install
+$(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
@@ -126,7 +126,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
