From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 22:50:21 +0100
Subject: [Buildroot] [git commit] package/boost: drop BOOST_IGNORE_CVES
Message-ID: <20210107213756.ACF1B8688D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23f49799473739752cf2edeee01daac2b97bfd87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed since commit 63332c33aa0771532807fd2684d4eee4eb952435

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index f574e5c47d..b61f6ea838 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,10 +12,6 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = $(BOOST_NAME)
 
-# CVE-2009-3654 is misclassified (by our CVE tracker) as affecting to boost,
-# while in fact it affects Drupal (a module called boost in there).
-BOOST_IGNORE_CVES += CVE-2009-3654
-
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
