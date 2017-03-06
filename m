From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:19:48 +0100
Subject: [Buildroot] [git commit] pcre: change download location
Message-ID: <20170306202022.4E462822B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d7644df7043706e455b06817abbe24da5613210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The location at ftp.csx.cam.ac.uk only stores 2 latest versions of PCRE.
This results in old (2015.11 and older currently) buildroot versions
timing out on wget several times and having to retrieve the package
from sources.buildroot.org afterwards.

Signed-off-by: Oleg Kitain <okitain@ya.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
