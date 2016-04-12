From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Apr 2016 19:56:15 +0300
Subject: [Buildroot] [PATCH] lksctp-tools: requires dynamic library support
Message-ID: <39be3340acb2a5c8c5be1c1b0f28b51b38793305.1460480175.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/259/25910726158f4b2cbd9ceb60c170f4b2d0b546ef/
http://autobuild.buildroot.net/results/94a/94ab8ba783a67529a62d4994ab8c62c8656a05e6/
http://autobuild.buildroot.net/results/1e5/1e59f273e0f31646065a1323a2e231c17babfe59/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lksctp-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lksctp-tools/Config.in b/package/lksctp-tools/Config.in
index b8a8c7af93ca..9c95ef5e1caa 100644
--- a/package/lksctp-tools/Config.in
+++ b/package/lksctp-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LKSCTP_TOOLS
 	bool "lksctp-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  The lksctp-tools project provides a Linux user space library
 	  for SCTP (libsctp) including C language header files
@@ -11,6 +12,6 @@ config BR2_PACKAGE_LKSCTP_TOOLS
 
 	  http://lksctp.sourceforge.net/
 
-comment "lksctp-tools needs a toolchain w/ threads"
+comment "lksctp-tools needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.8.0.rc3
