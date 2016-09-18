From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 18 Sep 2016 22:56:19 +0200
Subject: [Buildroot] [PATCH 2/2] Openjpeg: Build third party dependencies
	for static library
In-Reply-To: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
References: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1474232179-19811-3-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/openjpeg/openjpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index bf12526..08192a7 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -9,6 +9,9 @@ OPENJPEG_SITE = $(call github,uclouvain,openjpeg,version.$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2c
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENJPEG_CONF_OPTS = -DBUILD_THIRDPARTY=ON
+endif
 
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
-- 
2.7.4
