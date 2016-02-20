From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:21:24 +0100
Subject: [Buildroot] [git commit] erlang-p1-xml: bump to version 1.1.1
Message-ID: <20160302202755.111BD80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a39cbd932ba15594322fe0020e3798d183916d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas:
  - add dependency on erlang-p1-utils, as noticed by Romain Naour.
  - the license is now Apache-2.0 and no longer GPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-xml/Config.in        | 1 +
 package/erlang-p1-xml/erlang-p1-xml.mk | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
index a6f4bd7..504501d 100644
--- a/package/erlang-p1-xml/Config.in
+++ b/package/erlang-p1-xml/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_XML
 	bool "erlang-p1-xml"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_EXPAT
 	help
 	  XML utilities for Erlang
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index f81d3e5..31bab23 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 2c61083
+ERLANG_P1_XML_VERSION = 1.1.1
 ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
-ERLANG_P1_XML_LICENSE = GPLv2+
-ERLANG_P1_XML_LICENSE_FILES = COPYING
-ERLANG_P1_XML_DEPENDENCIES = expat
+ERLANG_P1_XML_LICENSE = Apache-2.0
+ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
+ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
 ERLANG_P1_XML_INSTALL_STAGING = YES
 
 ERLANG_P1_XML_USE_AUTOCONF = YES
