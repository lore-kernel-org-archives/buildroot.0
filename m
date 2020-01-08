From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 10:20:48 +0100
Subject: [Buildroot] [git commit] package/avro-c: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20200108091059.B6B51819D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=627e3fad32df88127f47d99d1fc0d6233df7ef8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/989/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
