From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 21:00:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent: annotate CVE-2009-1760
 and CVE-2016-5301
Message-ID: <20200301200049.211453-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2009-1760 and CVE-2016-5301 are misclassified (by our CVE tracker)
as affecting libtorrent, while in fact they affect libtorrent-rasterbar.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent/libtorrent.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index c8310cab65..17c6f92ab4 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -14,6 +14,10 @@ LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
+# CVE-2009-1760 and CVE-2016-5301 are misclassified (by our CVE tracker) as
+# affecting libtorrent, while in fact they affect libtorrent-rasterbar.
+LIBTORRENT_IGNORE_CVES += CVE-2009-1760 CVE-2016-5301
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBTORRENT_CONF_OPTS += --enable-openssl
 LIBTORRENT_DEPENDENCIES += openssl
-- 
2.25.0
