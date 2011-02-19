From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Feb 2011 20:46:50 +0100
Subject: [Buildroot] [git commit master 1/1] squashfs: fix zlib dependency
Message-ID: <20110219194955.313538F5F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cbd5099271121f544a23a07c974f33d366591247
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'gzip' compression supports just needs zlib, and not the gzip package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squashfs/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 39cb7f3..d28926e 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_SQUASHFS
 config BR2_PACKAGE_SQUASHFS_GZIP
        bool "gzip support"
        default y
-       select BR2_PACKAGE_GZIP
+       select BR2_PACKAGE_ZLIB
        help
          Support GZIP compression algorithm
 
-- 
1.7.3.4
