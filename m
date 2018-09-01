From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:58:38 +0200
Subject: [Buildroot] [git commit] python-falcon: add optional dependency on
 host-python-cython
Message-ID: <20180907111607.E8D317FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=763c2db314fa3a5a486055ad15cb506859e4e955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Falcon can be compiled into shared objects using Cython.
Compiled version works much faster than pure-python one.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
