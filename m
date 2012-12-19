From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:49 +0200
Subject: [Buildroot] [PATCH 11/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-11-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just some function name aliasing to make elfutils happy

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/elfutils/elfutils-memcpy_def.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils-memcpy_def.patch

diff --git a/package/elfutils/elfutils-memcpy_def.patch b/package/elfutils/elfutils-memcpy_def.patch
new file mode 100644
index 0000000..77a037d
--- /dev/null
+++ b/package/elfutils/elfutils-memcpy_def.patch
@@ -0,0 +1,14 @@
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
+@@ -55,6 +55,11 @@
+ /* Get the ELF types.  */
+ #include <elf.h>
+ 
++#ifndef _LIBC
++#ifndef __mempcpy
++#define __mempcpy mempcpy
++#endif
++#endif
+ 
+ /* Known translation types.  */
+ typedef enum
-- 
1.7.7.6
