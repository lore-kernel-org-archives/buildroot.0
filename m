From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:23:06 +0200
Subject: [Buildroot] [git commit] flannel: depends on CGO linking being
	supported
Message-ID: <20160706193045.DEB667FBDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e289630d62e8e9e261c81a0a8687bf8d2f545063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/3594f33800857cf57302f9b58e30d68f1d9c33b9/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flannel/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index cfdb909..134111b 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,10 +1,12 @@
 comment "flannel needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Flannel is a virtual network that gives a subnet to each
