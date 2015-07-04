From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:36:04 +0200
Subject: [Buildroot] [git commit] tor: needs NPTL threads
Message-ID: <20150704133625.969C780796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfe2ba7453e1b5005267a6bfcab920cc4facc9aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/f09/f09af8dd0d85bc6137a0c2f26cbe62686767b957/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/Config.in b/package/tor/Config.in
index 3400dce..5200926 100644
--- a/package/tor/Config.in
+++ b/package/tor/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TOR
 	bool "tor"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -14,6 +14,6 @@ config BR2_PACKAGE_TOR
 
 	  https://www.torproject.org
 
-comment "tor needs a toolchain w/ threads"
+comment "tor needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
