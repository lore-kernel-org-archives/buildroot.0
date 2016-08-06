From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 00:11:13 +0200
Subject: [Buildroot] [PATCH 1/2] blktrace: add missing dependency on
	Config.in comment
Message-ID: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_BLKTRACE option "depends on
BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS", but this architecture dependency was
not replicated in the Config.in comment. This commit fixes this
inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 958f004..c17de80 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_BLKTRACE
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
 
 comment "blktrace needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.7.4
