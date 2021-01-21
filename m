From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:52 +0100
Subject: [Buildroot] [git commit] package/apache: add APACHE_CPE_ID_VENDOR
 and APACHE_CPE_ID_NAME
Message-ID: <20210121204358.5A18B88F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ee9d3ddf75a07dddec92960fed0d62f038ff136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apache:http_server is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Ahttp_server

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apache/apache.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 203d637fbb..0392e76144 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -9,6 +9,8 @@ APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
+APACHE_CPE_ID_VENDOR = apache
+APACHE_CPE_ID_NAME = http_server
 # Needed for mod_php
 APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
