From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Feb 2020 16:12:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/libsigrok: drop remnants of
 autoreconf
In-Reply-To: <cover.1581261155.git.yann.morin.1998@free.fr>
References: <cover.1581261155.git.yann.morin.1998@free.fr>
Message-ID: <f3a6a36229cf2b73df2ea2f5ee0c092c601cf4ea.1581261155.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsigrok has not needed autoreconf since b428801934 (package/libsigrok:
bump version to 0.4.0), 4 years ago now.

As such, we no longer need the autoreconf options, nor the dependency on
the autoconf archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
