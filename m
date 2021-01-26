From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 20:16:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/ply: needs headers >= 4.14
Message-ID: <20210126191608.2183070-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ply uses BPF_JLT is available only since kernel 4.14 with:
https://github.com/torvalds/linux/commit/92b31a9af73b3a3fc801899335d6c47966351830

Fixes:
 - http://autobuild.buildroot.org/results/632187ceb7ca5e2dc5a3e5185860ddb874b4274c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ply/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index aa03d03858..35c2dc9bfc 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_PLY
 	bool "ply"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 # BPF_FUNC_get_stackid
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
 	help
 	  ply is a light-weight dynamic tracer for Linux. By means of
 	  using the BPF it can attach probes to the linux kernel
-- 
2.29.2
