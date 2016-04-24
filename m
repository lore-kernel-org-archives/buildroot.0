From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 24 Apr 2016 16:39:48 +0200
Subject: [Buildroot] [PATCH 1/2] python: enable bzip2 in host variant
In-Reply-To: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1461508789-17644-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable support for bzip2 in Python host variant, so the tarfile module
works properly.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/python/python.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4ecd0d1..09356c5 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -31,7 +31,6 @@ HOST_PYTHON_CONF_OPTS += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
 	--disable-ssl		\
 	--disable-ossaudiodev	\
 	--disable-pyo-build
@@ -52,7 +51,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
 
 PYTHON_DEPENDENCIES = host-python libffi
 
-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-bzip2
 
 PYTHON_INSTALL_STAGING = YES
 
-- 
2.4.11
