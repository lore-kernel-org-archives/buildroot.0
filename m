From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:30:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/expat: security
 bump to version 2.2.7
Message-ID: <20190707062919.B8500814FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55fd596e7d8a8292713329432126a8fb92f197ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilites:

CVE-2018-20843: In libexpat in Expat before 2.2.7, XML input including XML
names that contain a large number of colons could make the XML parser
consume a high amount of RAM and CPU resources while processing (enough to
be usable for denial-of-service attacks).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 84fd08cf4f860914b0d7b6e48dbe6819e96cc423)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 6c55972f69..91f70f36ed 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.6/
-md5	ca047ae951b40020ac831c28859161b2		expat-2.2.6.tar.bz2
-sha1	c8947fc3119a797b55485f2f7bdaaeb49cc9df01	expat-2.2.6.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.7/
+md5	72f36b87cdb478aba1e78473393766aa		expat-2.2.7.tar.bz2
+sha1	9c8a268211e3f1ae31c4d550e5be7708973ec6a6	expat-2.2.7.tar.bz2
 
 # Locally calculated
-sha256	17b43c2716d521369f82fc2dc70f359860e90fa440bea65b3b85f0b246ea81f2	expat-2.2.6.tar.bz2
+sha256	cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18	expat-2.2.7.tar.bz2
 sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 548ec826a0..1b49a12c49 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.6
+EXPAT_VERSION = 2.2.7
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
