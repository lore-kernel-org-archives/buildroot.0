From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:28:57 +0300
Subject: [Buildroot] [PATCH 2/9] firefox: valgrind dependency needs
	--enable-tls for debug build
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-3-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/valgrind/valgrind.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 05f402f..1c44df7 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,7 +7,12 @@
 VALGRIND_VERSION = 3.7.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y) && ($(BR2_GCC_ENABLE_TLS),y)
+VALGRIND_CONF_OPT = --enable-tls
+else
 VALGRIND_CONF_OPT = --disable-tls
+endif
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
-- 
1.7.7.6
