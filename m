From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:54 +0100
Subject: [Buildroot] [PATCH 6/9] package/kexec-lite: add SELinux refpolicy
 module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-7-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for the kexec-lite tool (which produces a kexec binary)
is added by the admin/kdump refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/kexec-lite/kexec-lite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 45c5d4d8b7..89d42659bd 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -10,5 +10,6 @@ KEXEC_LITE_LICENSE = GPL-2.0+
 KEXEC_LITE_LICENSE_FILES = COPYING
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
 KEXEC_LITE_AUTORECONF = YES
+KEXEC_LITE_SELINUX_MODULES = kdump
 
 $(eval $(autotools-package))
-- 
2.25.4
