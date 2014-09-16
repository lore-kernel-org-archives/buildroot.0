From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 16 Sep 2014 22:01:27 +0200
Subject: [Buildroot] [PATCH] lttng-babeltrace: Fix comment display
Message-ID: <1410897687-8155-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/lttng-babeltrace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index fae49ab..ce776d1 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -30,4 +30,4 @@ comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar,
 	depends on BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_UCLIBC_VERSION_SNAPSHOT || !BR2_TOOLCHAIN_USES_GLIBC
+		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
-- 
1.9.1
