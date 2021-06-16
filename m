From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Wed, 16 Jun 2021 17:25:39 +0300
Subject: [Buildroot] [PATCH] package/tinyproxy: bump to version 1.11.0
Message-ID: <20210616142539.4017-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, since tinyproxy no longer uses a2x, remove its explicit disabling.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/tinyproxy/tinyproxy.hash | 3 ++-
 package/tinyproxy/tinyproxy.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
index 8096741597..8c58b98ca2 100644
--- a/package/tinyproxy/tinyproxy.hash
+++ b/package/tinyproxy/tinyproxy.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.0
+sha256  c1ec81cfc4c551d2c24e0227a5aeeaad8723bd9a39b61cd729e516b82eaa3f32  tinyproxy-1.11.0.tar.xz
 # locally computed
-sha256  a23a8f647f622f01e51b93fa882ea5a15c20e026d45c3aafa81ec579e464daf7  tinyproxy-1.10.0.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 326bfa8b88..3930e90d72 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-TINYPROXY_VERSION = 1.10.0
+TINYPROXY_VERSION = 1.11.0
 TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
-TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
+TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VENDOR = tinyproxy_project
-TINYPROXY_CONF_ENV = ac_cv_path_A2X=no
 
 $(eval $(autotools-package))
-- 
2.20.1
