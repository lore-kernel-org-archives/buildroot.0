From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:56:02 +0100
Subject: [Buildroot] [git commit] linux: add support for Linux 5.0
Message-ID: <20190326180303.D8ADE87F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f156dc09d87ab0de06f6eed7cf6215bbc36a47b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This sets 5.0 to be the default, moving from 4.19 which was used instead
of 4.20 for the LTS branch.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index dc10238053..7793f71cc3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,10 +30,8 @@ config BR2_LINUX_NEEDS_MODULES
 choice
 	prompt "Kernel version"
 
-# We are intentionally staying at 4.19 for the next Buildroot LTS
-# release (2019.02)
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.19)"
+	bool "Latest version (5.0)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.171-cip30)"
@@ -123,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.25" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
