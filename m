From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 15:39:11 +0000
Subject: [Buildroot] [PATCH v2 4/4] package/python: enable openssl support
In-Reply-To: <20191027153853.23532-1-nicolas.carrier@orolia.com>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
Message-ID: <20191027153853.23532-4-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a python script is ran or used as (or in) a custom script like post
build, but requires ssl, then it will fail since it's explicitly disabled
by default.

This patch enables it unconditionnally.
Please note to, unlike for python3, the configure script doesn't have an
explicit --enable-openssl option.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

Changes v1 -> v2:
  - split the two original patches in two
  - removed the ssl support option

---

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/python/python.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4b82cdcce3..524de2a76d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -32,7 +32,6 @@ HOST_PYTHON_CONF_OPTS += \
 	--disable-bsddb \
 	--disable-test-modules \
 	--disable-bz2 \
-	--disable-ssl \
 	--disable-ossaudiodev \
 	--disable-pyo-build
 
@@ -56,7 +55,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
 
 PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
 
-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-openssl
 
 PYTHON_INSTALL_STAGING = YES
 
-- 
2.20.1
