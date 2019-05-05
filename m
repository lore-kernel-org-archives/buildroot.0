From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun,  5 May 2019 18:53:54 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/qemu: enable sparc64 support for
 host-qemu
In-Reply-To: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557075239-30667-3-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config enable host eqmu support for sparc64 which
allows to test this architecture in gitlab.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 160725d..ea80d6f 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -16,6 +16,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_sparc
+	default y if BR2_sparc64
 	default y if BR2_x86_64
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e82d372..b509472 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -183,6 +183,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       sh4aeb          sh4eb
 #       sh64            not supported
 #       sparc           sparc
+#       sparc64         sparc64
 
 HOST_QEMU_ARCH = $(ARCH)
 ifeq ($(HOST_QEMU_ARCH),i486)
-- 
2.7.4
