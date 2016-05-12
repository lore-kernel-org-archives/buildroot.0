From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:46 +0000
Subject: [Buildroot] [PATCH 4/9] package/go: Add BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CGO needs thread support.  Fixes build errors like these:

  warning requested reentrant code, but thread support was disabled

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 094e402..e988483 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
 	depends on !BR2_ARM_CPU_ARMV4
-- 
2.5.0
