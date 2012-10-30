From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 30 Oct 2012 08:47:07 +0000
Subject: [Buildroot] [PATCH] lcdapi: fix autobuilder failures
Message-ID: <1351586827-17432-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Version 0.3 of the lcdapi package does not correctly handle CXXFLAGS passed
in from the environment/command line. In particular, the passing in of CXXFLAGS
clobbers the -fPIC flag which is set in the top-level lcdapi makefile.

The following autobuild logs highlight the problem.
  
  http://autobuild.buildroot.net/results/9a47b4a70d29308f668d65d983ba6146c0c56365/build-end.log

  http://autobuild.buildroot.net/results/4a4f6e2e7f80d5a23c9d26069094e9dafb1468e7/build-end.log

  http://autobuild.buildroot.net/results/0d96c207a9db44cf2791a66cad5162a739e7053a/build-end.log

This has been fixed upstream in version 0.4; this patch simply bumps the
version number in the Buildroot lcdapi package.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdapi/lcdapi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 8125018..b024252 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -3,7 +3,7 @@
 # lcdapi
 #
 #############################################################
-LCDAPI_VERSION = v0.3
+LCDAPI_VERSION = v0.4
 LCDAPI_SITE = http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
 LCDAPI_LICENSE = LGPLv2.1+
 LCDAPI_LICENSE_FILES = COPYING
-- 
1.7.10.4
