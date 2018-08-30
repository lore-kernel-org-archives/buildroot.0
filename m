From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 30 Aug 2018 12:18:47 +0200
Subject: [Buildroot] [PATCH 1/2] python-falcon: add optional dependency on
 host-python-cython
Message-ID: <20180830101848.19752-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Falcon can be compiled into shared objects using Cython.
Compiled version works much faster than pure-python one.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-falcon/python-falcon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 106387f96f..b724ffadbe 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -11,4 +11,8 @@ PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON_CYTHON),y)
+PYTHON_FALCON_DEPENDENCIES += host-python-cython
+endif
+
 $(eval $(python-package))
-- 
2.17.1
