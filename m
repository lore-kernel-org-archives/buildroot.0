From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Mar 2021 10:53:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/expat: update CPE variables
Message-ID: <20210306095311.2155649-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libexpat:expat has been replaced by libexpat_project:libexpat:
  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibexpat_project%3Alibexpat

  <cpe-item name="cpe:/a:libexpat:expat:2.2.10" deprecated="true" deprecation_date="2021-01-25T15:44:50.537Z">
    <title xml:lang="en-US">libexpat Expat 2.2.10</title>
      <reference href="https://github.com/libexpat/libexpat/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libexpat:expat:2.2.10:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:libexpat_project:libexpat:2.2.10:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 201e18ae65..4acbade2c8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -12,7 +12,8 @@ EXPAT_DEPENDENCIES = host-pkgconf
 HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
-EXPAT_CPE_ID_VENDOR = libexpat
+EXPAT_CPE_ID_VENDOR = libexpat_project
+EXPAT_CPE_ID_PRODUCT = libexpat
 
 EXPAT_CONF_OPTS = --without-docbook
 HOST_EXPAT_CONF_OPTS = --without-docbook
-- 
2.30.0
