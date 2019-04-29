From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:21 +0200
Subject: [Buildroot] [PATCH 2/7] package/qemu: enable nios2 support for
 host-qemu
In-Reply-To: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556555546-9246-3-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config enable host eqmu support for nios2 which
allows to test this architecture in gitlab.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8a0df38..160725d 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,6 +9,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
+	default y if BR2_nios2
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 19bcafa..e82d372 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -172,6 +172,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       mipsel          mipsel
 #       mips64          mips64
 #       mips64el        mips64el
+#       nios2           nios2
 #       powerpc         ppc
 #       powerpc64       ppc64
 #       powerpc64le     ppc64 (system) / ppc64le (usermode)
-- 
2.7.4
