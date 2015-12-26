From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Dec 2015 22:35:10 +0100
Subject: [Buildroot] [PATCH v2 1/1] [autobuild] configs: update PowerPC
	Kconfig symbols
Message-ID: <1451165710-30849-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Kconfig symbole BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
has been renamed to BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC in commit
[1].

And with [2], the CS PowerPC 2012.03 toolchain became the default toolchain
when the PPC 8548 is selected. This toolchain doesn't requiere the "-te500v2"
since there is only one sysroot.

[1] https://git.busybox.net/buildroot/commit/?id=fa4214e21b50b791ec365c64897ac2676b45448a
[2] http://patchwork.ozlabs.org/patch/561118/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v2: add explicitely BR2_powerpc_8548 to the e500v2 config
    reword the commit log.
---
 web/toolchains/configs/sourcery-powerpc-e500v2.config | 3 +--
 web/toolchains/configs/sourcery-powerpc.config        | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/web/toolchains/configs/sourcery-powerpc-e500v2.config b/web/toolchains/configs/sourcery-powerpc-e500v2.config
index f4e3b57..133f368 100644
--- a/web/toolchains/configs/sourcery-powerpc-e500v2.config
+++ b/web/toolchains/configs/sourcery-powerpc-e500v2.config
@@ -1,4 +1,3 @@
 BR2_powerpc=y
+BR2_powerpc_8548=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103=y
-BR2_TARGET_OPTIMIZATION="-te500v2"
diff --git a/web/toolchains/configs/sourcery-powerpc.config b/web/toolchains/configs/sourcery-powerpc.config
index 532fab5..385ca88 100644
--- a/web/toolchains/configs/sourcery-powerpc.config
+++ b/web/toolchains/configs/sourcery-powerpc.config
@@ -1,4 +1,2 @@
 BR2_powerpc=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103=y
-
-- 
2.4.3
