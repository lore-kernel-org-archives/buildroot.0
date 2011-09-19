From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:04 +0200
Subject: [Buildroot] [PATCH 01/21] libfuse: rename fuse to libfuse
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a460227dbc2f05ad7c2e9f4703c54cb7d15ade2e.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We rename the package/fuse directory to package/libfuse to be
consistent with the package name. This is needed for a future commit
that will simplify the AUTOTARGETS macro by making assumptions on the
directory name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    2 +-
 package/{fuse => libfuse}/Config.in  |    0
 package/{fuse => libfuse}/libfuse.mk |    0
 3 files changed, 1 insertions(+), 1 deletions(-)
 rename package/{fuse => libfuse}/Config.in (100%)
 rename package/{fuse => libfuse}/libfuse.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 451b271..5d7c15d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -266,7 +266,7 @@ menu "Filesystem"
 source "package/gamin/Config.in"
 source "package/libconfig/Config.in"
 source "package/libconfuse/Config.in"
-source "package/fuse/Config.in"
+source "package/libfuse/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 endmenu
diff --git a/package/fuse/Config.in b/package/libfuse/Config.in
similarity index 100%
rename from package/fuse/Config.in
rename to package/libfuse/Config.in
diff --git a/package/fuse/libfuse.mk b/package/libfuse/libfuse.mk
similarity index 100%
rename from package/fuse/libfuse.mk
rename to package/libfuse/libfuse.mk
-- 
1.7.4.1
