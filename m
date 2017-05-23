From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:37:51 +0200
Subject: [Buildroot] [git commit branch/next] iproute2: drop obsolete patch
Message-ID: <20170523133758.15888822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e0a7254790329e08934ec0642d3e576fd904107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since version 4.5.0 the iptables_common.h header is unused. Don't bother
patching this file.

Renumber the following patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Add-missing-sys-types.h-include.patch     | 38 ----------------------
 ...ch => 0002-ip-include-libc-headers-first.patch} |  0
 2 files changed, 38 deletions(-)

diff --git a/package/iproute2/0002-Add-missing-sys-types.h-include.patch b/package/iproute2/0002-Add-missing-sys-types.h-include.patch
deleted file mode 100644
index ef91814..0000000
--- a/package/iproute2/0002-Add-missing-sys-types.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 560dee4b4be54699c0c9679771c9e0d61e4db80a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 19 Nov 2015 17:48:55 +0100
-Subject: [PATCH] Add missing <sys/types.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The u_intXX_t types are defined in <sys/types.h>, so it should be
-included before using those types. Otherwise, with certain C
-libraries, the build fails with:
-
-In file included from ../include/iptables.h:4:0,
-                 from m_ipt.c:18:
-../include/iptables_common.h:47:16: error: unknown type name ???u_int32_t???
- #define __le32 u_int32_t
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/iptables_common.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/iptables_common.h b/include/iptables_common.h
-index 9099667..2c27a4b 100644
---- a/include/iptables_common.h
-+++ b/include/iptables_common.h
-@@ -43,6 +43,8 @@ extern char *lib_dir;
-   extern void init_extensions(void);
- #endif
- 
-+#include <sys/types.h>
-+
- #define __be32	u_int32_t
- #define __le32	u_int32_t
- #define __be16	u_int16_t
--- 
-2.6.3
-
diff --git a/package/iproute2/0003-ip-include-libc-headers-first.patch b/package/iproute2/0002-ip-include-libc-headers-first.patch
similarity index 100%
rename from package/iproute2/0003-ip-include-libc-headers-first.patch
rename to package/iproute2/0002-ip-include-libc-headers-first.patch
