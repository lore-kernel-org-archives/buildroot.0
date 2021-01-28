From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:53 +0100
Subject: [Buildroot] [PATCH 5/9] package/kexec: add SELinux refpolicy module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-6-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for kexec and kdump is added by the admin/kdump
refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
