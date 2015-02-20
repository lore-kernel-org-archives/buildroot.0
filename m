From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 18:56:00 +0100
Subject: [Buildroot] [git commit branch/next] libsigrok: remove
	--disable-udev from CONF_OPTS
Message-ID: <20150220175606.7778780400@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=733431b5f9bb29b9807b9094a6f7c4fd06312d5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This option is invalid and thus ignored by libsigrok configure.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/libsigrok.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index f91b8cb..109d4d3 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -13,7 +13,7 @@ LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_AUTORECONF = YES
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
-LIBSIGROK_CONF_OPTS = --disable-libudev --disable-bindings --disable-glibtest
+LIBSIGROK_CONF_OPTS = --disable-bindings --disable-glibtest
 
 define LIBSIGROK_ADD_MISSING
 	mkdir -p $(@D)/autostuff
