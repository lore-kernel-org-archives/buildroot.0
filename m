From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 21:46:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 4.5.1
In-Reply-To: <20200615184632.493821-1-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
Message-ID: <20200615184632.493821-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The options --with-xslt-config and --with-xml2-config were
renamed to --xslt-config and --xml2-config", respectively.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-lxml/python-lxml.hash |  2 +-
 package/python-lxml/python-lxml.mk   | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 593a5e1c56..240314e888 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60  lxml-4.5.0.tar.gz
+sha256  27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2  lxml-4.5.1.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index cfb87bb6fd..7e727a6753 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.5.0
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/39/2b/0a66d5436f237aff76b91e68b4d8c041d145ad0a2cdeefe2c42f76ba2857
+PYTHON_LXML_VERSION = 4.5.1
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/03/a8/73d795778143be51d8b86750b371b3efcd7139987f71618ad9f4b8b65543
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
@@ -26,11 +26,11 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 # python-lxml needs these scripts in order to properly detect libxml2 and
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
-	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
-	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+	--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
-	--with-xslt-config=$(HOST_DIR)/bin/xslt-config \
-	--with-xml2-config=$(HOST_DIR)/bin/xml2-config
+	--xslt-config=$(HOST_DIR)/bin/xslt-config \
+	--xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.26.2
