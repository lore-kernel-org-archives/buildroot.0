From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:23:37 +0200
Subject: [Buildroot] [git commit] runc: depends on CGO linking being
	supported
Message-ID: <20160706193046.0133782237@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0115a1f4da127772467d780c0fb15c8a7752f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/35d72aac0b0cc0ac92bf309d1a957d7903b1411a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 1802e59..fd5dee7 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RUNC
 	bool "runc"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -9,5 +10,6 @@ config BR2_PACKAGE_RUNC
 	  https://github.com/opencontainers/runc
 
 comment "runc needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
