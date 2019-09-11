From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 20:14:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/openpowerlink: fixup the 'V' prefix
 in the version
Message-ID: <20190911181440.3778-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the openpowerlink version to match what is given by
release-monitoring.org, the 'V' prefix should be encoded in
OPENPOWERLINK_SOURCE and OPENPOWERLINK_SITE and not
OPENPOWERLINK_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openpowerlink/openpowerlink.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index f869780822..46dc3d10cd 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.7.1
-OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
-OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
+OPENPOWERLINK_VERSION = 2.7.1
+OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V$(OPENPOWERLINK_VERSION)
+OPENPOWERLINK_SOURCE = openPOWERLINK_V$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
 OPENPOWERLINK_LICENSE_FILES = license.md
 
-- 
2.23.0.rc1
