From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 11:35:12 +0100
Subject: [Buildroot] [git commit branch/next] package/zbar: bump to version
 681b0f305fb5c5bb0df8437f7d740b29a93a7889
Message-ID: <20190210103349.3DD1D83F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b00a9f04b83f1c34dd6577e51c51d6e4beada9e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Zbar now has a dbus API which we should enable when dbus is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zbar/zbar.hash | 2 +-
 package/zbar/zbar.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 6735bc67d6..47a080af12 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 94c71c6110c705f07ba5ba2803583d09b3853e8773169c86bdcf831443156aaa zbar-57d601e82089f2f31de9e1683c3834f237421f5d.tar.gz
+sha256 7eb73c180c787184ede0f98806c52b23eb9c24609673e1ed51210504ea2937f5 zbar-681b0f305fb5c5bb0df8437f7d740b29a93a7889.tar.gz
 sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 6df069e001..fea233239f 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 57d601e82089f2f31de9e1683c3834f237421f5d
+ZBAR_VERSION = 681b0f305fb5c5bb0df8437f7d740b29a93a7889
 ZBAR_SITE = git://linuxtv.org/zbar.git
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
@@ -23,4 +23,11 @@ ZBAR_CONF_OPTS = \
 	--without-x \
 	--without-java
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+ZBAR_DEPENDENCIES += dbus
+ZBAR_CONF_OPTS += --with-dbus
+else
+ZBAR_CONF_OPTS += --without-dbus
+endif
+
 $(eval $(autotools-package))
