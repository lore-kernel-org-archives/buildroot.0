From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 16:42:28 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/python3: security
 bump to version 3.7.5
Message-ID: <20191103080703.209478E5B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f5b4da6d329e1c231fd1ded908e8e5ce73106e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes the following security vulnerabilities:

- bpo-38243: Escape the server title of xmlrpc.server.DocXMLRPCServer when
  rendering the document page as HTML.  (Contributed by Dong-hee Na in
  bpo-38243.)

- bpo-38174: Update vendorized expat library version to 2.2.8, which
  resolves CVE-2019-15903.

- bpo-37764: Fixes email._header_value_parser.get_unstructured going into an
  infinite loop for a specific case in which the email header does not have
  trailing whitespace, and the case in which it contains an invalid encoded
  word.  Patch by Ashwin Ramaswami.

- bpo-37461: Fix an infinite loop when parsing specially crafted email
  headers.  Patch by Abhilash Raj.

- bpo-34155: Fix parsing of invalid email addresses with more than one @
  (e.g.  a at b@c.com.) to not return the part before 2nd @ as valid email
  address.  Patch by maxking & jpic.

Additionally, the release contains a number of non-security related fixes.
For details, see the changelog:

https://docs.python.org/3.7/whatsnew/changelog.html#python-3-7-5-final

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 4a82e1dd9c..a138724ff8 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-374/
-md5		d33e4aae66097051c2eca45ee3604803 Python-3.7.4.tar.xz
+# From https://www.python.org/downloads/release/python-375/
+md5 08ed8030b1183107c48f2092e79a87e2 Python-3.7.5.tar.xz
 # Locally computed
-sha256 fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f Python-3.7.4.tar.xz
+sha256 e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94 Python-3.7.5.tar.xz
 sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8e6a0296ed..8d042954df 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
