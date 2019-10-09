From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Oct 2019 23:13:30 +0200
Subject: [Buildroot] [git commit] package/checkpolicy: now available on
 !glibc configs
Message-ID: <20191009221023.C80E581154@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25cc1eb03f0e6c62ace897e5f6c9866b5b39fc33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liselinux can now be selected on !glibc toolchains, so we can drop the
glibc dependency of the checkpolicy package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/checkpolicy/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index 97ad0b7704..f7b03df11d 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_FLEX
@@ -15,7 +14,6 @@ config BR2_PACKAGE_CHECKPOLICY
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "checkpolicy needs a glibc toolchain w/ threads, dynamic library"
+comment "checkpolicy needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
