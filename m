From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:08:48 +0200
Subject: [Buildroot] [git commit] package/openpowerlink: fixup the 'V'
 prefix in the version
Message-ID: <20190915140423.C746C8E3FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2d0ea7aa9493dd0e8c96eb4c3abd97a09b46686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the openpowerlink version to match what is given by
release-monitoring.org, the 'V' prefix should be encoded in
OPENPOWERLINK_SOURCE and OPENPOWERLINK_SITE and not
OPENPOWERLINK_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
