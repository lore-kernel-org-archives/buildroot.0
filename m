From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2020 15:09:59 +0200
Subject: [Buildroot] [PATCH 1/3 v2] package/kmod: explicitly disable
 compression when not enabled
In-Reply-To: <cover.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <7067f36377f52c1a5022a9988be2ee7e70ce48ac.1588511382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e2dfea5c7b..cdbfc5a469 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -35,11 +35,15 @@ endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += --with-zlib
+else
+KMOD_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
+else
+KMOD_CONF_OPTS += --without-xz
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-- 
2.20.1
