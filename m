From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Jul 2019 20:35:39 +0200
Subject: [Buildroot] [PATCH 2/3] package/glib-networking: drop
 ca_certificates
In-Reply-To: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
References: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
Message-ID: <20190705183540.16524-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ca_certificates option is no more available since
https://gitlab.gnome.org/GNOME/glib-networking/commit/72a83a4cbcf4c0214f3131991fabe41c41d33cd6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/glib-networking.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 163f1b0dd2..b11f3a4a67 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -16,7 +16,6 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	gnutls
 
 GLIB_NETWORKING_CONF_OPTS = \
-	-Dca_certificates_path=/etc/ssl/certs/ca-certificates.crt \
 	-Dlibproxy_support=false \
 	-Dgnome_proxy_support=false \
 	-Dpkcs11_support=false
-- 
2.20.1
