From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:37:53 +0100
Subject: [Buildroot] [git commit] musl: enable or1k architecture
Message-ID: <20171201205341.1E22A80FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc6a562c04be41d9e869c644dd6691fc5d5aa3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Linux kernel >= 4.13.x musl or1k can be used
with Qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c624350..9668f8d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -79,10 +79,10 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
-		   BR2_microblaze || BR2_mips    || BR2_mipsel    || BR2_mips64 || \
-		   BR2_mips64el   || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		   BR2_sh         || BR2_x86_64
+	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
+		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
+		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
+		   BR2_powerpc64le || BR2_sh    || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
