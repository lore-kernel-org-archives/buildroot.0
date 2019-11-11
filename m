From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 11 Nov 2019 08:06:43 -0600
Subject: [Buildroot] [PATCH 2/2] package/pkg-python: use
 TARGET_CONFIGURE_OPTS for distutils
In-Reply-To: <20191111140643.2629-1-ryan.barnett@rockwellcollins.com>
References: <20191111140643.2629-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20191111140643.2629-2-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling a distutils python package, use TARGET_CONFIGURE_OPTS
for the environment to ensure that all the environment variables for
cross compilation with buildroot are correct.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/pkg-python.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 8e4c7e5795..15438bdcb0 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -27,9 +27,7 @@ endef
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
-	CC="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_CONFIGURE_OPTS) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
-- 
2.18.0
