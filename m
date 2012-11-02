From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:07:03 +0100
Subject: [Buildroot] [git commit] toolchain: make external toolchain the
	default for AArch64
Message-ID: <20121102231431.BC200999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d27e09a71ae68d141ba6eb0fc64f9eb03a734727
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our internal toolchain backend does not yet have support for AArch64,
and Crosstool-NG also does not have support for AArch64 at the moment
(though it should be coming quickly since the Linaro AArch64 toolchain
is generated with a modified Crosstool-NG version).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 849b8e3..29ed2f0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -10,7 +10,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_microblaze
+	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
-	depends on !BR2_microblaze
+	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
