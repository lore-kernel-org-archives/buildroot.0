From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 10 Apr 2021 06:37:38 -0300
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump version to
 LTS_01_2021_Ref01
Message-ID: <20210410093738.5529-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch (already in upstream)

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...0001-Fix-redirection-of-errno-header.patch | 32 -------------------
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk    |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch

diff --git a/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch b/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
deleted file mode 100644
index efc3d3326540..000000000000
--- a/package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9ff62052a9490c96366d97096a039dca30702b2d Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Fri, 3 Jul 2020 21:09:20 -0300
-Subject: [PATCH] Fix redirection of errno header
-
-The POSIX correct header to include is <errno.h>.
-
-The glibc silently redirects incorrect includes, but musl libc prints
-a warning:
-   #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- c-utility/pal/linux/socket_async_os.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/c-utility/pal/linux/socket_async_os.h b/c-utility/pal/linux/socket_async_os.h
-index bd59e487c099..1797089851e3 100644
---- a/c-utility/pal/linux/socket_async_os.h
-+++ b/c-utility/pal/linux/socket_async_os.h
-@@ -10,7 +10,7 @@
- #include <sys/select.h>
- #include <netinet/in.h>
- #include <netinet/tcp.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <fcntl.h>
- #include <unistd.h>
- #include <netdb.h>
--- 
-2.17.1
-
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 124c7a1107d2..72fa99c44d85 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  61874790b66c7e120550fdffff88cb1e3cbfbfebcf324e41982f04461f8793a0  azure-iot-sdk-c-LTS_07_2020_Ref02-br1.tar.gz
+sha256  987b469aa76d6c81e5dbcd62e81f4ece0620770930cf65722754c76aedd6049f  azure-iot-sdk-c-LTS_01_2021_Ref01-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index c664ad83a40b..3f00db3ff4c1 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_07_2020_Ref02
+AZURE_IOT_SDK_C_VERSION = LTS_01_2021_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.17.1
