From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 01:32:42 +0200
Subject: [Buildroot] [git commit] libbdplus: select libgcrypt in Config.in
	as well
Message-ID: <20160703233533.AEACE803CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133369f46fd2c522b8f00af8d4693d6870951419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/4d9/4d91521378402f3f5b6402ea453df4c14c391bdc/

libbdplus adds libgcrypt to its _DEPENDENCIES, but forgot to select it in
Config.in.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbdplus/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbdplus/Config.in b/package/libbdplus/Config.in
index 19170a6..df5ea27 100644
--- a/package/libbdplus/Config.in
+++ b/package/libbdplus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBBDPLUS
 	bool "libbdplus"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  libbdplus is a research project to implement the BD+ System
 	  Specifications.
