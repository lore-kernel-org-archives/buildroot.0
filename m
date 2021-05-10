From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 11:21:57 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/ruby: security
 bump to version 2.7.3
Message-ID: <20210510085418.AF01886D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=337331bfc4502cc844901aacd050115f8341fd9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This release includes security fixes:
- CVE-2021-28965: XML round-trip vulnerability in REXML
- CVE-2021-28966: Path traversal in Tempfile on Windows

https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 80ffb00c0f..58a3b54d79 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/
-sha256  1b95ab193cc8f5b5e59d2686cb3d5dcf1ddf2a86cb6950e0b4bdaae5040ec0d6  ruby-2.7.2.tar.xz
+# https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/
+sha256  5e91d1650857d43cd6852e05ac54683351e9c301811ee0bef43a67c4605e7db1  ruby-2.7.3.tar.xz
 # License files, Locally calculated
 sha256  b09ca195d2de08f0aacfa8793d0af62d7681c304b3ef714b75813721823295a6  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4ab6ea78c1..aee173cb67 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.7
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 2.7.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
