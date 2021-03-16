From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:10:36 +0100
Subject: [Buildroot] [git commit] package/kexec-lite: add SELinux refpolicy
 module
Message-ID: <20210316214740.8FD63881F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbeb81542bf83e2e072768206db827b523f8a57e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for the kexec-lite tool (which produces a kexec binary)
is added by the admin/kdump refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
