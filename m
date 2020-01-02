From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu,  2 Jan 2020 18:51:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avro-c: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20200102175135.155177-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/989/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1->v2: Config.in comment also depends on ..SYNC_4
---
 package/avro-c/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
index fe962e1e3c..76d9123a4e 100644
--- a/package/avro-c/Config.in
+++ b/package/avro-c/Config.in
@@ -1,9 +1,11 @@
 comment "avro-c needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_AVRO_C
 	bool "avro-c"
 	depends on !BR2_STATIC_LIBS  # Avro unconditionally compiles shared libs
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_JANSSON
 	help
 	  Select this option to install the Avro C language bindings,
-- 
2.23.0
