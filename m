From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 14:08:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/gnuchess: add CPE variables
Message-ID: <20210304130846.1734524-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:chess is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Achess

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuchess/gnuchess.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 4d91706de4..e386556c9f 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -8,6 +8,8 @@ GNUCHESS_VERSION = 6.2.5
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
+GNUCHESS_CPE_ID_VENDOR = gnu
+GNUCHESS_CPE_ID_PRODUCT = chess
 
 GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
-- 
2.30.0
