From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 11:00:07 +0200
Subject: [Buildroot] [PATCH 2/3] package/libuio: disable Werror
In-Reply-To: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
References: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1467450008-27597-2-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -Werror to avoid build issues caused by warnings.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reported-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuio/libuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 6a73d23..c254d0d 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -9,7 +9,7 @@ LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
 LIBUIO_LICENSE_FILES = COPYING
-LIBUIO_CONF_OPTS = --with-glib=no
+LIBUIO_CONF_OPTS = --with-glib=no --without-werror
 LIBUIO_INSTALL_STAGING = YES
 
 # Fetched from github, no pre-generated configure script provided
-- 
2.5.5
