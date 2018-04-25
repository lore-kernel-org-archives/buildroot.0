From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 25 Apr 2018 08:45:16 +0200
Subject: [Buildroot] [PATCH 2/4] package/Makefile.in: Add missing options to
 LDFLAGS for full RELRO build
In-Reply-To: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
Message-ID: <20180425064518.31797-2-stefan.sorensen@spectralink.com>
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
index d72a5494ab..1cbf34e0df 100644
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
2.14.3
