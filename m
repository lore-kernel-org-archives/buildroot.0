From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:34:03 +0200
Subject: [Buildroot] [git commit] python: use the new gettext logic
Message-ID: <20170704233518.C5EB57F96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf216e48e1a163c19f8130bbb9792089b0fec544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index d3f7b31..8724d8c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -54,16 +54,12 @@ HOST_PYTHON_CONF_ENV += \
 # MAKE1 has shown to workaround the problem.
 HOST_PYTHON_MAKE = $(MAKE1)
 
-PYTHON_DEPENDENCIES = host-python libffi
+PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-PYTHON_DEPENDENCIES += gettext
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
 PYTHON_DEPENDENCIES += readline
 else
