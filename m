From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:36:33 +0200
Subject: [Buildroot] [git commit] glib-networking: specify ca-certificates
	pathspec
Message-ID: <20160820203642.3B4F78212B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c061e39ca23642297ca568f5bd0edfbe92903a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the configure script will probe the distro directories for it
and it may not match what we use, for example fedora uses /etc/pki
instead of /etc/ssl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
