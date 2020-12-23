From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 10:10:40 +0100
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 12.19.1
Message-ID: <20201223085641.347D281540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f359580796a7d0295680821213ed562c4f8ca24e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2020-8277: Denial of Service through DNS request (High).  A Node.js
  application that allows an attacker to trigger a DNS request for a host of
  their choice could trigger a Denial of Service by getting the application
  to resolve a DNS record with a larger number of responses.

https://nodejs.org/en/blog/release/v12.19.1/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 33fb407882..61259425ba 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.18.4/SHASUMS256.txt
-sha256  25f03cb18e53b6d0959d0c219e701a85eb4693f526bdda7c72bc6199b364f609  node-v12.18.4.tar.xz
+# From https://nodejs.org/dist/v12.19.1/SHASUMS256.txt
+sha256  74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d  node-v12.19.1.tar.xz
 
 # Hash for license file
 sha256  0dc03af08b95ea0c1e27f8fd591dee4383eb6f2c304db6eb6cdfb6751f7da87b  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b159b10253..524a6b5d8f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.18.4
+NODEJS_VERSION = 12.19.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
