From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:41:02 +0200
Subject: [Buildroot] [git commit] jamvm: add depends on toolchain w/threads
Message-ID: <20150401214156.63B1C8191A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6be1abb14a4832c9d8e77bf316ddcdb2b393c265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jamvm/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index f480995..375bded 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	select BR2_PACKAGE_ZLIB
@@ -11,7 +12,8 @@ config BR2_PACKAGE_JAMVM
 
 	  http://jamvm.sf.net
 
-comment "jamvm needs a toolchain w/ IPv6"
+comment "jamvm needs a toolchain w/ IPv6, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
