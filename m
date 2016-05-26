From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:05:41 +0200
Subject: [Buildroot] [git commit] package/flannel: Add
	BR2_TOOLCHAIN_HAS_THREADS
Message-ID: <20160526191312.44A7381F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=263cadeb45fbe496e89c802eca07e1c90c826292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flannel uses the cgo package, so needs a toolchain with thread
support.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flannel/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index c6a84ef..cfdb909 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,6 +1,11 @@
+comment "flannel needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
