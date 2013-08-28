From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:35:20 +0200
Subject: [Buildroot] [PATCH 01/12] package/Makefile.in: fix incorrect comment
In-Reply-To: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377671731-28656-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TARGET_{CC,CXX,LD,...} variables no longer contain any --sysroot
option, since we're now using a toolchain wrapper for external
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 91ae1b9..0b1c33a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -143,8 +143,7 @@ endif
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 
-# Define TARGET_xx variables for all common binutils/gcc tools by
-# including the --sysroot option where necessary.
+# Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
 TARGET_CC       = $(TARGET_CROSS)gcc
-- 
1.8.1.2
