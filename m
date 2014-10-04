From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Oct 2014 19:32:12 +0200
Subject: [Buildroot] [PATCH v2] package/pkg-cmake.mk: rename
	_INSTALL_HOST_OPTS -> _INSTALL_OPTS
Message-ID: <1412443932-13585-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pacth renames, consistently with the other package infrastructures,
the _INSTALL_OPTS variable for host CMake-based package.

As mentioned in [1], no host-cmake-package uses this variable so far; so
it is a safe rename.

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
2.1.2
