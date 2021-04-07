From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  7 Apr 2021 09:12:20 +0200
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 12.22.1
Message-ID: <20210407071220.25669-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2020-7774: npm upgrade to 6.14.12 - Update y18n to fix
Prototype-Pollution (High)

This is a vulnerability in the y18n npm module which may be exploited by
prototype pollution.

https://github.com/advisories/GHSA-c4w7-xm78-47vh

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 7abb3c3b57..1e03587715 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.21.0/SHASUMS256.txt
-sha256  052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d  node-v12.21.0.tar.xz
+# From https://nodejs.org/dist/v12.22.1/SHASUMS256.txt
+sha256  dd650df7773a6ed3e390320ba51ef33cba6499f0e9397709ea3d1debdcbcb989  node-v12.22.1.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index f8b29d3685..108fce0926 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.21.0
+NODEJS_VERSION = 12.22.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.20.1
