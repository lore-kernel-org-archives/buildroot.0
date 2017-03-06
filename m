From: Oleg Kitain <okitain@ya.ru>
Date: Mon, 6 Mar 2017 03:02:02 +0300
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
Message-ID: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject: [PATCH 1/1] pcre: Change download location

The location at ftp.csx.cam.ac.uk only stores 2 latest versions of PCRE.
This results in old (2015.11 and older currently) buildroot versions
timing out on wget several times and having to retrieve the package
from sources.buildroot.org afterwards.

Signed-off-by: Oleg Kitain <okitain@ya.ru>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 211e2359a..7b06db1a5 100644
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
-- 
2.11.1
