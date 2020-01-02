From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu,  2 Jan 2020 12:03:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/avro-c: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20200102110341.149419-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/989/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/avro-c/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
index fe962e1e3c..03922612df 100644
--- a/package/avro-c/Config.in
+++ b/package/avro-c/Config.in
@@ -4,6 +4,7 @@ comment "avro-c needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_AVRO_C
 	bool "avro-c"
 	depends on !BR2_STATIC_LIBS  # Avro unconditionally compiles shared libs
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_JANSSON
 	help
 	  Select this option to install the Avro C language bindings,
-- 
2.23.0
