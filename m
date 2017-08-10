From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 10 Aug 2017 14:12:51 +0200
Subject: [Buildroot] [PATCH 1/1] erlang-p1-xml: Fix host dependencies
	variable name
Message-ID: <20170810121251.17203-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should fix the error reported by autobuild:
http://autobuild.buildroot.net/results/63c/63c63b2578e9f6ad71cbea82b987c128305cdab4/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 0b0b1caaee..58ba3cbdeb 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -9,7 +9,7 @@ ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
-ERLANG_P1_XML_HOST_DEPENDENCIES = host-expat host-erlang-p1-utils
+HOST_ERLANG_P1_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
 ERLANG_P1_XML_INSTALL_STAGING = YES
 
 ERLANG_P1_XML_USE_AUTOCONF = YES
-- 
2.11.0
