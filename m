From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 15:39:08 +0000
Subject: [Buildroot] [PATCH v2 2/4] package/python3: enable openssl support
In-Reply-To: <20191027153853.23532-1-nicolas.carrier@orolia.com>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
Message-ID: <20191027153853.23532-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a python script is ran or used as (or in) a custom script like post
build, but requires ssl, then it will fail since it's explicitly disabled
by default.

This patch enables it unconditionnally.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

Changes v1 -> v2:
  - split the two original patches in two
  - removed the ssl support option

---

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/python3/python3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 060f9061ff..b3a187b130 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -27,7 +27,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev \
-	--disable-openssl
+	--enable-openssl
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
@@ -40,7 +40,7 @@ HOST_PYTHON3_CONF_ENV += \
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
-HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
+HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi host-openssl
 
 PYTHON3_INSTALL_STAGING = YES
 
-- 
2.20.1
