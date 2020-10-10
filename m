From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:52:28 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/mtd: add host-acl
 dependency for host
Message-ID: <20201010204948.EE0B581121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c38dfb58eee1c235d4d5444c7ad3dd56a35b895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

When compiling the host version of mtd, --with-jffs and --with-ubifs are
always set, meaning --with-xattr is set by default. The xattr support
only work if 'sys/acl.h' is available, otherwise the feature is silently
dropped (a warning is shown during the configuration step).

This patch adds a dependency on host-acl for host-mtd, so that the xattr
feature is correctly supported. Logic to have xattr support is already
there and working for the non-host flavour.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c3902e6e2e8ff5fe6a516b060819c60951c406f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 1186fa52d5..9f259b35d9 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -53,7 +53,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
