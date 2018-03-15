From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 15 Mar 2018 23:50:11 +0100
Subject: [Buildroot] [PATCH 5/6] package/enlightenment: add xkeyboard-config
 optional dependency
In-Reply-To: <20180315225012.9845-1-romain.naour@gmail.com>
References: <20180315225012.9845-1-romain.naour@gmail.com>
Message-ID: <20180315225012.9845-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meson build systemd is checking for xkeyboard-config optional
dependency but there is no option to handle it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 6ee983db76..ae68888aac 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -41,6 +41,10 @@ else
 ENLIGHTENMENT_MESON_OPTS += -Dmixer=false
 endif
 
+ifeq ($(BR2_PACKAGE_XKEYBOARD_CONFIG),y)
+ENLIGHTENMENT_DEPENDENCIES += xkeyboard-config
+endif
+
 define ENLIGHTENMENT_CONFIGURE_CMDS
 	rm -rf $(@D)/build
 	mkdir -p $(@D)/build
-- 
2.14.3
