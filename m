From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Oct 2014 19:19:02 +0200
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: rename _INSTALL_HOST_OPTS
	-> _INSTALL_OPTS
Message-ID: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
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
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 85d8828..2bea003 100644
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
 
-- 
2.1.2
