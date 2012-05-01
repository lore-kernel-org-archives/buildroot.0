From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 14:13:01 +0200
Subject: [Buildroot] [git commit] cups: add optional image dependencies
Message-ID: <20120501121323.9D68196C42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67e4edfb96bd99cec33fae6fc142b3de848f4538
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 1508b6e..f06502a 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -15,6 +15,11 @@ CUPS_CONF_OPT = --without-perl \
 		--disable-gnutls \
 		--disable-gssapi
 
+CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
+		    $(if $(BR2_PACKAGE_LIBPNG),libpng) \
+		    $(if $(BR2_PACKAGE_JPEG),jpeg) \
+		    $(if $(BR2_PACKAGE_TIFF),tiff)
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	CUPS_CONF_OPT += --enable-dbus
 	CUPS_DEPENDENCIES += dbus
