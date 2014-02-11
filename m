From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 10:06:58 +0100
Subject: [Buildroot] [git commit] rpcbind: uses fork(), needs MMU
Message-ID: <20140211090901.CB9799C963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fb892820ffbd4f49a500948fc311182d847dd42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/d7c/d7c788749b54275154cc3934a7a32385cd72be61/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 578c6d6..e02fb95 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_RPCBIND
 	# support, needed for libtirpc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
@@ -16,3 +18,4 @@ comment "rpcbind needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
