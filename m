From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:30:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/ruby: security
 bump to version 2.4.6
Message-ID: <20190424202619.BF447807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0ce796f576bf824f34c2d39da8fed949c75f5e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2019-8320: Delete directory using symlink when decompressing tar
- CVE-2019-8321: Escape sequence injection vulnerability in verbose
- CVE-2019-8322: Escape sequence injection vulnerability in gem owner
- CVE-2019-8323: Escape sequence injection vulnerability in API response handling
- CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
- CVE-2019-8325: Escape sequence injection vulnerability in errors

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 900982313786d3537417f18251732ab7dca95553)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index b36d49461c..fa9eddc279 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2018/10/17/ruby-2-4-5-released/
-sha256 2f0cdcce9989f63ef7c2939bdb17b1ef244c4f384d85b8531d60e73d8cc31eeb  ruby-2.4.5.tar.xz
+# https://www.ruby-lang.org/en/news/2019/04/01/ruby-2-4-6-released/
+sha256 25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c  ruby-2.4.6.tar.xz
 # License files, Locally calculated
 sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 3e71596bb4..10424020a9 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
