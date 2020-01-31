From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 Jan 2020 19:08:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix lzma dependency
Message-ID: <20200131180800.1136153-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lzma package is a host-only package so replace this wrong dependency by
xz package

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 7dc38d30cb..b1f0e18dbc 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -21,8 +21,8 @@ SURICATA_DEPENDENCIES = \
 	libpcap \
 	libyaml \
 	$(if $(BR2_PACKAGE_LZ4),lz4) \
-	$(if $(BR2_PACKAGE_LZMA),lzma) \
-	pcre
+	pcre \
+	$(if $(BR2_PACKAGE_XZ),xz)
 
 SURICATA_CONF_ENV = ac_cv_path_HAVE_SPHINXBUILD=no
 
-- 
2.24.1
