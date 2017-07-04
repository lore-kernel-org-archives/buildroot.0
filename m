From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:49 +0200
Subject: [Buildroot] [PATCH 069/100] python: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-70-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
