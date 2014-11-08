From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 21:55:09 +0100
Subject: [Buildroot] [git commit] package/cramfs: Needs zlib
Message-ID: <20141108214404.C2646B308B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4da0c4e0f2f43d042bf0b78478ac77fae2fc249e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cramfs.mk contains

CRAMFS_DEPENDENCIES = zlib

but this dependency was missing in Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cramfs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index daf6e6d..b2a0c6c 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRAMFS
 	bool "cramfs"
+	select BR2_PACKAGE_ZLIB
 	help
 	  cramfs is a compressed read-only filesystem. This package
 	  contains the tools to generate and check a cramfs filesystem.
