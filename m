From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:32:33 +0100
Subject: [Buildroot] [git commit] package/netcat: set NETCAT_CPE_ID_VALID
Message-ID: <20210111201431.97F858658C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=376c010974e31bb66df29c407bfe13c3c1662ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:netcat_project:netcat is indeed the right CPE identifier for
this package, as can be seen from:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetcat_project%3Anetcat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netcat/netcat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index eb7ddcac27..c9d7952e59 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,5 +8,6 @@ NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
+NETCAT_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
