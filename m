From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 15 Jan 2019 20:36:25 +0100
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to version 2.7.1
Message-ID: <20190115193625.19765-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch.
While at it, switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ernel-edrv-edrv-rawsock_linux.c-add-missi.patch | 35 ----------------------
 package/openpowerlink/openpowerlink.hash           |  8 ++---
 package/openpowerlink/openpowerlink.mk             |  4 +--
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch

diff --git a/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch b/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch
deleted file mode 100644
index 4e00ecdb67..0000000000
--- a/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 710e2b8ba2ecf51057a89de24e6f0d387614ea53 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 25 Aug 2018 23:36:39 +0200
-Subject: [PATCH] stack/src/kernel/edrv/edrv-rawsock_linux.c: add missing
- <sys/types.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This is necessary to get the definition of the u_char type, otherwise
-the build fails with the musl C library with:
-
-stack/src/kernel/edrv/edrv-rawsock_linux.c:373:46: error: ???u_char??? undeclared (first use in this function)
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/371
----
- stack/src/kernel/edrv/edrv-rawsock_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/stack/src/kernel/edrv/edrv-rawsock_linux.c b/stack/src/kernel/edrv/edrv-rawsock_linux.c
-index f8e0216f..e5230a52 100644
---- a/stack/src/kernel/edrv/edrv-rawsock_linux.c
-+++ b/stack/src/kernel/edrv/edrv-rawsock_linux.c
-@@ -59,6 +59,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include <arpa/inet.h>
- #include <ifaddrs.h>
- #include <linux/if_packet.h>
-+#include <sys/types.h>
- 
- //============================================================================//
- //            G L O B A L   D E F I N I T I O N S                             //
--- 
-2.14.4
-
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index da9bdd2a72..13b5e9351e 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.0/
-md5	4843f857b8334c984827435fa9e1ab96	openPOWERLINK_V2.7.0.tar.gz
-sha1	a256e05d187b334651764ab21a827b3a4fa64e2f	openPOWERLINK_V2.7.0.tar.gz
+# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.1/
+md5	04524d1b1f9946176dce0ccb0eecf537	openPOWERLINK_V2.7.1.tar.gz
+sha1	4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd	openPOWERLINK_V2.7.1.tar.gz
 # sha256 locally computed
-sha256	64c23ee42e3852bf2316fd99c59eae9cdd634219f92b3ea70ce747dad1e05354	openPOWERLINK_V2.7.0.tar.gz
+sha256	d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd	openPOWERLINK_V2.7.1.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 90088cef56..f869780822 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.7.0
-OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
+OPENPOWERLINK_VERSION = V2.7.1
+OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
 OPENPOWERLINK_LICENSE_FILES = license.md
-- 
2.14.5
