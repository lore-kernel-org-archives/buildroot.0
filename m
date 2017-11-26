From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:04:42 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] apr: security bump to
 version 1.6.3
Message-ID: <20171126184640.4823E7FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=080fb1e2e7b3d77a93dfcc7ee9d0684323f1ba59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes CVE-2017-12613: Out-of-bounds array deref in apr_time_exp*()
functions.

Use upstream provided SHA256 hash.

Add license has.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c91981a985108a83bfeca1a61a4457b5ac785574)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.hash | 6 ++++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 7a5969e..be130a5 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,2 +1,4 @@
-# From http://archive.apache.org/dist/apr/apr-1.6.2.tar.bz2.sha1
-sha1 01b0d4faa0194825e8e525b9ac7ccfb832471d50  apr-1.6.2.tar.bz2
+# From http://www.apache.org/dist/apr/apr-1.6.3.tar.bz2.sha256
+sha256 131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172  apr-1.6.3.tar.bz2
+# Locally calculated
+sha256 f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index ffb3099..58b1d86 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.6.2
+APR_VERSION = 1.6.3
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
