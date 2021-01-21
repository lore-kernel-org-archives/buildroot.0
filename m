From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:34 +0100
Subject: [Buildroot] [PATCH 05/15] package/apache: add APACHE_CPE_ID_VENDOR
 and APACHE_CPE_ID_NAME
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:apache:http_server is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Ahttp_server

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
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
-- 
2.30.0
