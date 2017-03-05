From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:10:02 +0100
Subject: [Buildroot] [PATCH 7/9] package/darktable: add libsoup optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-7-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsoup checked in src/CMakeLists.txt without USE_LIBSOUP option.

	find_package(LibSoup2)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 package/darktable/darktable.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/darktable/darktable.mk b/package/darktable/darktable.mk
index bd2d079..de08af0 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -71,6 +71,11 @@ else
 DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=OFF
 endif
 
+# There is no option to handle libsoup dependency
+ifeq ($(BR2_PACKAGE_LIBSOUP),y)
+DARKTABLE_DEPENDENCIES += libsoup
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 DARKTABLE_CONF_OPTS += -DUSE_OPENJPEG=ON
 DARKTABLE_DEPENDENCIES += openjpeg
-- 
2.9.3
