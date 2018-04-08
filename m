From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Apr 2018 10:40:00 +0200
Subject: [Buildroot] [PATCH] package/python-yieldfrom: fix licensing info
Message-ID: <20180408084000.9379-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no file containing the license text. The closest we can use is
the PKG-INFO file, which contains the license name...

Fixes:
    http://autobuild.buildroot.net/results/dff21d63845d3d6a5f78c1000301cdd2104595f4
    http://autobuild.buildroot.net/results/220e82f555ce6c98b89605bab72c7ea3eea61c66
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-yieldfrom/python-yieldfrom.hash | 2 +-
 package/python-yieldfrom/python-yieldfrom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-yieldfrom/python-yieldfrom.hash b/package/python-yieldfrom/python-yieldfrom.hash
index cee4aaf96b..2df8085327 100644
--- a/package/python-yieldfrom/python-yieldfrom.hash
+++ b/package/python-yieldfrom/python-yieldfrom.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/yieldfrom/json, sha256 locally computed
 md5	1a1c6fd152032d49ccd4ac250aad7746  yieldfrom-1.0.3.tar.gz
 sha256	388004d0ee8854c2ed7a2c87e664aad13acd70c9b33d7f3c441182d37357739b  yieldfrom-1.0.3.tar.gz
-sha256	99da56b23b254ccd2ec6f2e82aea731a86d29a916002b3b3bcd801453edab74e  LICENSE
+sha256	3695faeb17a2507f445b7e0a454043671f646591795477ced20e29de2359d666  PKG-INFO
diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
index cb4a05d83a..b1137cdbb4 100644
--- a/package/python-yieldfrom/python-yieldfrom.mk
+++ b/package/python-yieldfrom/python-yieldfrom.mk
@@ -9,7 +9,7 @@ PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
 PYTHON_YIELDFROM_SITE = https://pypi.python.org/packages/de/2d/05524f368e691846824d962b64f983e3fde9b8c10839e7efbc1b51d42de3
 PYTHON_YIELDFROM_SETUP_TYPE = setuptools
 PYTHON_YIELDFROM_LICENSE = MIT
-PYTHON_YIELDFROM_LICENSE_FILES = LICENSE
+PYTHON_YIELDFROM_LICENSE_FILES = PKG-INFO
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.14.1
