From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 15 Mar 2018 23:50:12 +0100
Subject: [Buildroot] [PATCH 6/6] package/enlightenment: install to staging
In-Reply-To: <20180315225012.9845-1-romain.naour@gmail.com>
References: <20180315225012.9845-1-romain.naour@gmail.com>
Message-ID: <20180315225012.9845-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

enlightenment provide enlightenment.pc and some shared libraries.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ae68888aac..ba6b54143e 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -26,6 +26,9 @@ ENLIGHTENMENT_MESON_OPTS += \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
 	-Dpam=false
 
+# enlightenment.pc and /usr/lib/enlightenment/modules/*.so
+ENLIGHTENMENT_INSTALL_STAGING = YES
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
 ENLIGHTENMENT_DEPENDENCIES += systemd
-- 
2.14.3
