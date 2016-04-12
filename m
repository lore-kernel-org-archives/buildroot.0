From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:22:36 +0200
Subject: [Buildroot] [git commit] lksctp-tools: requires dynamic library
	support
Message-ID: <20160412220141.4AAD37FA20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bcc4f3e6ddb2fad7cf5a0ecd75536a2f3e26bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/259/25910726158f4b2cbd9ceb60c170f4b2d0b546ef/
http://autobuild.buildroot.net/results/94a/94ab8ba783a67529a62d4994ab8c62c8656a05e6/
http://autobuild.buildroot.net/results/1e5/1e59f273e0f31646065a1323a2e231c17babfe59/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lksctp-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lksctp-tools/Config.in b/package/lksctp-tools/Config.in
index b8a8c7a..9c95ef5 100644
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
