From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:14:01 +0200
Subject: [Buildroot] [git commit] package/gcc: remove legacy leftover for
	PR60102
Message-ID: <20170816210748.9A24A8211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=055a155a2032f054d40483f0538203c4f8bf29eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2c8de6c4 (gcc 4.9.1: add patch for PR60102) removed the SPE
condition becasue of said PR, but forgot to remove the associated
comment, which has been tagging along all this time...

Remove it, it is no longer valid and causes confusion.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a2e02d7..485755a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -39,7 +39,6 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-	# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_GCC_VERSION_5_X
