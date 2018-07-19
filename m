From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu, 19 Jul 2018 13:02:02 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/Makefile.in: Add missing options
 to LDFLAGS for full RELRO build
In-Reply-To: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <1531998123-28360-3-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The options for a full RELRO build should also be added to LDFLAGS.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5e0ff8c..14b3bbd 100644
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
1.8.3.1
