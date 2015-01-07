From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:36:56 +0100
Subject: [Buildroot] [git commit] linux: hide custom patches when using a
	local tree
Message-ID: <20150107213703.A2D63807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=727f58044e3ae3c861acff78c369b400e0334734
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a custom local tree, we're using the OVERRIDE_SRCDIR
internally, which means we do not apply patches. Since this is the
expected behavior, make BR2_LINUX_KERNEL_PATCH and
BR2_LINUX_KERNEL_CUSTOM_LOCAL options exclusive.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bf30426..13ae1ac 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -119,6 +119,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_PATCH
 	string "Custom kernel patches"
+	depends on !BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	help
 	  A space-separated list of patches to apply to the
 	  kernel. Each patch can be described as an URL, a local file
