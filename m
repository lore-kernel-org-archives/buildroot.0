From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:57:13 +0200
Subject: [Buildroot] [git commit] libsigrok: add host-doxygen dependency for
	C++ bindings
Message-ID: <20150412165753.549F48082D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18c0584f88123b02d11b0fbeb4f2b238f2baf6f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doxygen is required to generate xml files required by libsigrokcxx
build system.

[Thomas: add host-python (or host-python3) to the dependencies when
building the C++ bindings for libsigrok, since a Python interpreter >=
2.7 is needed at build time.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/libsigrok.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 1e6080d..2d044b2 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -48,7 +48,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm
+LIBSIGROK_DEPENDENCIES += \
+	host-autoconf-archive \
+	glibmm \
+	host-doxygen \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 else
 LIBSIGROK_CONF_OPTS += --disable-cxx
 endif
