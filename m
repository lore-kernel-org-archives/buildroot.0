From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:35:44 +0200
Subject: [Buildroot] [git commit] libsoc: add Python bindings support
Message-ID: <20160625133613.9445F804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6ba80ccae02fc8e26f6716480c200ed35efa9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add --disable-python, use 'else ifeq'.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoc/libsoc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 878616b..03bef04 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -11,4 +11,16 @@ LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
 
+# Install Python 2 bindings
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LIBSOC_DEPENDENCIES += python
+LIBSOC_CONF_OPTS += --enable-python=2
+# Install Python 3 bindings
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSOC_DEPENDENCIES += python3
+LIBSOC_CONF_OPTS += --enable-python=3
+else
+LIBSOC_CONF_OPTS += --disable-python
+endif
+
 $(eval $(autotools-package))
