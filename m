From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Sun, 12 Aug 2012 22:56:10 +0300
Subject: [Buildroot] [PATCH] valgrind: valgrind/valgrind.h missing if
	--disable-tls enabled
In-Reply-To: <1344801370-14582-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1344801370-14582-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1344801370-14582-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/valgrind/valgrind.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 05f402f..c39da4f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,7 +7,12 @@
 VALGRIND_VERSION = 3.7.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_CONF_OPT = --disable-tls
+
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+	VALGRIND_CONF_OPT = --enable-tls
+else
+	VALGRIND_CONF_OPT = --disable-tls
+endif
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
-- 
1.7.7.6
