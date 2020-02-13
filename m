From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:24:50 +0100
Subject: [Buildroot] [git commit] package/libsigrok: drop remnants of
 autoreconf
Message-ID: <20200213221532.B8BF68E029@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ba7b9603b686524e1981e5251e9e25f5034d1bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsigrok has not needed autoreconf since b428801934 (package/libsigrok:
bump version to 0.4.0), 4 years ago now.

As such, we no longer need the autoreconf options, nor the dependency on
the autoconf archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 7a128e8dfa..4c1f31ea6e 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -53,9 +53,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/share/autoconf-archive
 LIBSIGROK_DEPENDENCIES += \
-	host-autoconf-archive \
 	glibmm \
 	host-doxygen \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
