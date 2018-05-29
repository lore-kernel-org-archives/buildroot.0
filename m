From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:38:48 +0200
Subject: [Buildroot] [git commit branch/next] libqrencode: bump to version
 4.0.0
Message-ID: <20180529194155.370E38028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e4dd94dec988557c07bc7c30f12acf5e5a61489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Use new --with[out]-png option
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqrencode/libqrencode.hash |  7 +++++--
 package/libqrencode/libqrencode.mk   | 10 ++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
index 8c94ccd35d..1418413135 100644
--- a/package/libqrencode/libqrencode.hash
+++ b/package/libqrencode/libqrencode.hash
@@ -1,2 +1,5 @@
-# From http://fukuchi.org/works/qrencode/qrencode-3.4.2.tar.gz.sha1
-sha1	7daaad61f333ff6cdabfb0d925c3ab668d16dee2	qrencode-3.4.2.tar.gz
+# From http://fukuchi.org/works/qrencode/qrencode-4.0.0.tar.gz.sha
+sha512	fdbcee3ef90abf780dcbe495cef3e6ac5449a4a0aaa87d1a1a4f71d97fe6d96974d8132f7e227133cddb5ab73600e968821634752fc0d75113ca0959aae9a5d0	qrencode-4.0.0.tar.gz
+
+# Hash for license file:
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 8f17b895e0..62ca2ed11d 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQRENCODE_VERSION = 3.4.2
+LIBQRENCODE_VERSION = 4.0.0
 LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
@@ -18,9 +18,15 @@ else
 LIBQRENCODE_CONF_OPTS += --disable-thread-safety
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBQRENCODE_CONF_OPTS += --with-png
+LIBQRENCODE_DEPENDENCIES += libpng
+else
+LIBQRENCODE_CONF_OPTS += --without-png
+endif
+
 ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
 LIBQRENCODE_CONF_OPTS += --with-tools=yes
-LIBQRENCODE_DEPENDENCIES += libpng
 else
 LIBQRENCODE_CONF_OPTS += --with-tools=no
 endif
