From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:18:30 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] ti-gfx: only available on
 x86(-64) hosts
Message-ID: <20171126213910.B81D281539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b3729439d20ee3319772c6040e08d5bc0495f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

ti-gfx is provided as a x86 self extracting executable, so it is only
available on x86(-64) hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e480e88169160ad2d2972c949336a668e122af98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 6ec2f23..dc49d82 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
