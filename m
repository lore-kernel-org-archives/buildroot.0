From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 09:46:27 +0100
Subject: [Buildroot] [git commit] uboot: fix binman with a new dependency
Message-ID: <20210212082818.85241815F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=399432d60f835830ab7df23bc49600766f424821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

since 2021.01, tools/binman is broken.
tools/binman/control.py imports pkg_resources
the module pkg_resources is supplied by setuptools,
so this new dependency is required.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2478a2a1e9..bb45980022 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -173,9 +173,9 @@ UBOOT_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
-UBOOT_DEPENDENCIES += host-python
+UBOOT_DEPENDENCIES += host-python host-python-setuptools
 else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
-UBOOT_DEPENDENCIES += host-python3
+UBOOT_DEPENDENCIES += host-python3 host-python3-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
