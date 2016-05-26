From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 18:21:33 +0000
Subject: [Buildroot] [PATCH v3 5/6] package/flannel: Add
	BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <cover.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
Message-ID: <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flannel uses the cgo package, so needs a toolchain with thread
support.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index c6a84ef..32d9f66 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,6 +1,10 @@
+comment "flannel needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
-- 
2.5.0
