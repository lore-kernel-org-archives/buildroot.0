From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Jul 2018 09:31:09 -0500
Subject: [Buildroot] [PATCH 2/6] package/Makefile.in: Add missing options to
 LDFLAGS for full RELRO build
In-Reply-To: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180711143113.11927-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan S?rensen <stefan.sorensen@spectralink.com>

The options for a full RELRO build should also be added to LDFLAGS.

Originally submitted as
http://patchwork.ozlabs.org/patch/904034/

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5e0ff8c841..14b3bbd243 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -159,7 +159,7 @@ TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
 TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie
+TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
-- 
2.17.0
