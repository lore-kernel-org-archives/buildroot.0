From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:26 +0200
Subject: [Buildroot] [RFC 16/37] package/efl: add frame buffer config option
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-17-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 5 +++++
 package/efl/efl.mk    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index ea607d7..4077565 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -37,6 +37,11 @@ config BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
 	  otherwise we need to add a very long and obscure option
 	  to start the build.
 
+comment "libecore video support"
+
+config BR2_PACKAGE_EFL_FB
+	bool "libecore framebuffer support"
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 17a08fa..8f5c9fb 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -159,6 +159,12 @@ else
 EFL_CONF_OPTS += --enable-wayland=no
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_FB),y)
+EFL_CONF_OPTS += --enable-fb=yes
+else
+EFL_CONF_OPTS += --enable-fb=no
+endif
+
 # image loader: handle only loaders that requires dependencies.
 # All other loaders are builded by default statically.
 ifeq ($(BR2_PACKAGE_EFL_PNG),y)
-- 
2.4.3
