From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 10 Apr 2015 11:49:58 +0200
Subject: [Buildroot] [PATCH v3 2/3] libsigrok: add host-doxygen dependency
	for C++ bindings
In-Reply-To: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428659399-28620-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doxygen is required to generate xml files required by libsigrokcxx
build system.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 1e6080d..4309480 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -48,7 +48,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm
+LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm host-doxygen
 else
 LIBSIGROK_CONF_OPTS += --disable-cxx
 endif
-- 
2.1.4
