From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 13:48:51 -0300
Subject: [Buildroot] [PATCH 2/2] glib-networking: specify ca-certificates
	pathspec
In-Reply-To: <1471711731-462-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471711731-462-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1471711731-462-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the configure script will probe the distro directories for it
and it may not match what we use, for example fedora uses /etc/pki
instead of /etc/ssl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index d4782e0..b6e40f8 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -14,6 +14,8 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	host-pkgconf \
 	host-intltool \
 	libglib2
+GLIB_NETWORKING_CONF_OPTS = \
+	--with-ca-certificates=/etc/ssl/certs/ca-certificates.crt
 GLIB_NETWORKING_LICENSE = LGPLv2+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
-- 
2.7.3
