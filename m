From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2021 14:54:47 +0100
Subject: [Buildroot] [PATCHv2 4/7] package/libjson: drop explicit '-DNDEBUG'
In-Reply-To: <20210212135451.22786-1-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
Message-ID: <20210212135451.22786-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The passing of 'NDEBUG' is now steered by BR2_ENABLE_RUNTIME_DEBUG and
commonly set from package/Makefile.in.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/libjson/libjson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index d04ddc40f3..9d064e53c3 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -11,7 +11,7 @@ LIBJSON_INSTALL_STAGING = YES
 LIBJSON_LICENSE = BSD-2-Clause
 LIBJSON_LICENSE_FILES = License.txt
 
-LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
+LIBJSON_CXXFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBJSON_MAKE_OPTS += SHARED=0
-- 
2.26.2
