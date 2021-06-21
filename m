From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:00:12 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/gdb: enable nios2
Message-ID: <20210621190350.9C80F8DF3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5391fb17d6a572816b8574095a25272fcaeae7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

It turn out that gdb/gdbserver support for nios2 is available since 7.7 release, since commit [1] [2].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a1217d97c4b0449d052fad3d2df2ab58b48f918c
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=68f5f83833e21b8c8466fe852b403b81db227ce4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8eac45e6cf59491dde4a1deac888b0db89ccd5cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in      | 1 -
 package/gdb/Config.in.host | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index b1aa5e47d9..262740fc4c 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_nios2
 	depends on !BR2_or1k
 	depends on !BR2_nds32
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9ac939ec1e..07e75b2c0e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_nios2
 	depends on !BR2_or1k
 	depends on !BR2_riscv
 	depends on !BR2_nds32
