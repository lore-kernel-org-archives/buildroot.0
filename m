From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:33:10 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/kexec: add
 SELinux refpolicy module
Message-ID: <20210319171640.208718840D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=926d709a00c35365d5e607810f788228e5c28843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

SELinux support for kexec and kdump is added by the admin/kdump
refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44670b4f4efe1034ca6704c7333d7ccdaf6d422c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 63fcc074b5..c54ce1f11a 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -9,6 +9,7 @@ KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
+KEXEC_SELINUX_MODULES = kdump
 
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
 KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
