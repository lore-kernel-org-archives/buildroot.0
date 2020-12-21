From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 13:20:05 +0100
Subject: [Buildroot] [PATCH 3/3] package/p11-kit: add systemd optional
 dependency
In-Reply-To: <20201221122005.343120-1-fontaine.fabrice@gmail.com>
References: <20201221122005.343120-1-fontaine.fabrice@gmail.com>
Message-ID: <20201221122005.343120-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is an optional dependency (enabled by default) since version
0.23.13 and
https://github.com/p11-glue/p11-kit/commit/53a7e915b2694bc1957d98493a7aee9abfa3c6c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p11-kit/p11-kit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index c2c6b2ab79..c90ed39f7e 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -33,4 +33,11 @@ else
 P11_KIT_CONF_OPTS += --without-libtasn1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+P11_KIT_DEPENDENCIES = host-pkgconf systemd
+P11_KIT_CONF_OPTS += --with-systemd
+else
+P11_KIT_CONF_OPTS += --without-systemd
+endif
+
 $(eval $(autotools-package))
-- 
2.29.2
