From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 17:09:42 +0200
Subject: [Buildroot] [git commit] nodejs: security bump to version 8.11.1
Message-ID: <20180331151016.4B0DB83F93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f02604553bc3c8449d6a112818f038e99abbdaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- Fix for inspector DNS rebinding vulnerability (CVE-2018-7160): A malicious
  website could use a DNS rebinding attack to trick a web browser to bypass
  same-origin-policy checks and allow HTTP connections to localhost or to
  hosts on the local network, potentially to an open inspector port as a
  debugger, therefore gaining full code execution access.  The inspector now
  only allows connections that have a browser Host value of localhost or
  localhost6.

- Fix for 'path' module regular expression denial of service
  (CVE-2018-7158): A regular expression used for parsing POSIX paths could
  be used to cause a denial of service if an attacker were able to have a
  specially crafted path string passed through one of the impacted 'path'
  module functions.

- Reject spaces in HTTP Content-Length header values (CVE-2018-7159): The
  Node.js HTTP parser allowed for spaces inside Content-Length header
  values.  Such values now lead to rejected connections in the same way as
  non-numeric values.

While we are at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 7 +++++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 4adef79dca..b3900f6a7d 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,5 @@
-# From http://nodejs.org/dist/v8.10.0/SHASUMS256.txt
-sha256 b72d4e71618d6bcbd039b487b51fa7543631a4ac3331d7caf69bdf55b5b2901a  node-v8.10.0.tar.xz
+# From http://nodejs.org/dist/v8.11.1/SHASUMS256.txt
+sha256 40a6eb51ea37fafcf0cfb58786b15b99152bec672cccf861c14d1cca0ad4758a  node-v8.11.1.tar.xz
+
+# Hash for license file
+sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e1dd11cef5..2642525c47 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.10.0
+NODEJS_VERSION = 8.11.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
