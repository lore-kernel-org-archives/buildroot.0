From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 May 2021 22:21:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/ruby: security bump to version 3.0.1
Message-ID: <20210507202104.2887487-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release includes security fixes:
- CVE-2021-28965: XML round-trip vulnerability in REXML
- CVE-2021-28966: Path traversal in Tempfile on Windows

https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index ec9492aa5e..b79596e57a 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/
-sha256  68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1  ruby-3.0.0.tar.xz
+# https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/
+sha512  97d2e883656060846b304368d9d836e2f3ef39859c36171c9398a0573818e4ed75bfd7460f901a9553f7f53518c505327a66e74f83704a881469f5ac61fe13d7  ruby-3.0.1.tar.xz
 # License files, Locally calculated
 sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c30ad691d1..fded7acebc 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
-RUBY_VERSION_EXT = 3.0.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 3.0.1
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.30.2
