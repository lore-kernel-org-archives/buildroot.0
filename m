From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Jul 2017 22:54:53 +0200
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
	8.1.4
Message-ID: <20170713205300.4DC2D82142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=476ccdb3e49be2349248385dbacf4a72efebe343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-1000381 - The c-ares function ares_parse_naptr_reply(), which
is used for parsing NAPTR responses, could be triggered to read memory
outside of the given input buffer if the passed in DNS response packet was
crafted in a particular way.  This patch checks that there is enough data
for the required elements of an NAPTR record (2 int16, 3 bytes for string
lengths) before processing a record.

See https://nodejs.org/en/blog/release/v8.1.4/

[Peter: add CVE info]
Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 989616c..93aa6a1 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.1.2/SHASUMS256.txt
-sha256  ac190c1964ee0c28d4c163c0ccbb47435b2e4bd9b4c065b74a93373105c574b3  node-v8.1.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.1.4/SHASUMS256.txt
+sha256  a83c86445f79749c46fd4f2c4e681a3e5bb51b2bde5dc7aed1dc38e4e242c301  node-v8.1.4.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fdb856c..43c5ff3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.1.2
+NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
