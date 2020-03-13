From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:22:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libsigrok: drop
 remnants of autoreconf
Message-ID: <20200313152231.D002F90ABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a7c792b082ea91b63b7f49833b3731595e73c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

libsigrok has not needed autoreconf since b428801934 (package/libsigrok:
bump version to 0.4.0), 4 years ago now.

As such, we no longer need the autoreconf options, nor the dependency on
the autoconf archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ba7b9603b686524e1981e5251e9e25f5034d1bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index aa79191e94..e06aaf6172 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -39,9 +39,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/share/autoconf-archive
 LIBSIGROK_DEPENDENCIES += \
-	host-autoconf-archive \
 	glibmm \
 	host-doxygen \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
