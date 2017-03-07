From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Mar 2017 13:45:36 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] pcre: change download
	location
Message-ID: <20170307124916.4687C80359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f2009a93621bea5103fc2eb92d8c20d562381f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The location at ftp.csx.cam.ac.uk only stores 2 latest versions of PCRE.
This results in old (2015.11 and older currently) buildroot versions
timing out on wget several times and having to retrieve the package
from sources.buildroot.org afterwards.

Signed-off-by: Oleg Kitain <okitain@ya.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6d7644df7043706e455b06817abbe24da5613210)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 211e235..e302ed7 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE_VERSION = 8.40
-PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
