From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 00:26:01 +0100
Subject: [Buildroot] [git commit] toolchain: disallow internal/ctng
	toolchains for microblaze
Message-ID: <20120318232731.D112E90E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a7462b34de06fd941dd59ddfe02063e77f54822
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While there's some microblaze support in mainline gcc from 4.6.x,
there still seems to be something missing with the uClibc support, so
disable these for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2f4709a..849b8e3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -10,6 +10,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
@@ -22,6 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
+	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
