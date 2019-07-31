From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  1 Aug 2019 01:02:50 +0200
Subject: [Buildroot] [PATCH] package/subversion: security bump to version
 1.9.12
Message-ID: <20190731230251.7499-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-11782: Remotely triggerable DoS vulnerability in svnserve
'get-deleted-rev'
https://subversion.apache.org/security/CVE-2018-11782-advisory.txt

CVE-2019-0203: Remote unauthenticated denial-of-service in Subversion
svnserve
https://subversion.apache.org/security/CVE-2019-0203-advisory.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 2 +-
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index be0c8ec931..7f94631f89 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
 # From https://www.apache.org/dist/subversion/subversion-1.9.10.tar.bz2.sha512
-sha512 58ac11078e0e5a1720199e5c66da76e7a20b86d02edcb8d313f98e2ddc74ae70aa3e0763a7d8a8fcb5a1fd7d65186829625ff110d78028b1c447e91f420d6f48 subversion-1.9.10.tar.bz2
+sha512 08a5c6c0233cc1dbd992180d2077eb1c67725682c457d3f67ebb6d22db0f6b64002a699ab828d435b708340ce6fb07bb1f03d11daefb887053c427ed75ad2de7 subversion-1.9.12.tar.bz2
 
 # Locally calculated
 sha256 3202942c1aba495fd17390618dedc1d3542815c5bc11958da7fd98c985abc11a LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 0e26cfd4be..1013f1fc55 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.10
+SUBVERSION_VERSION = 1.9.12
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.11.0
