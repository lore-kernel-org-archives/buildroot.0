From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:21:51 +0100
Subject: [Buildroot] [git commit] package/boinc: add optional dependency to
	freetype
Message-ID: <20171029171518.524EE81064@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=931899312ee476787e08610509b5f16191d782e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No configure option present:
https://github.com/BOINC/boinc/blob/client_release/7.8/7.8.3/configure.ac#L497

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boinc/boinc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 01fa66a..901f1ee 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -26,6 +26,10 @@ BOINC_CONF_OPTS = \
 	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY) \
 	--with-libcurl=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+BOINC_DEPENDENCIES += freetype
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFCGI),y)
 BOINC_DEPENDENCIES += libfcgi
 BOINC_CONF_OPTS += --enable-fcgi
