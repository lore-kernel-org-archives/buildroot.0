From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:12:19 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] ruby: security bump to
 version 2.4.5
Message-ID: <20181113230941.13FC8831CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b45d4b5fba5544b801688365b9da2b366dbf2d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security issues:

- CVE-2018-16396: Tainted flags are not propagated in Array#pack and
  String#unpack with some directives
https://www.ruby-lang.org/en/news/2018/10/17/not-propagated-taint-flag-in-some-formats-of-pack-cve-2018-16396/

- CVE-2018-16395: OpenSSL::X509::Name equality check does not work correctly
https://www.ruby-lang.org/en/news/2018/10/17/openssl-x509-name-equality-check-does-not-work-correctly-cve-2018-16395/

Update hash of LEGAL as it had a few (wayback machine) URLs added/changed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 646ae5a0b1ec9e7c099de0088c333470283f7e33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index dd4cfc202b..b36d49461c 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# From https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-4-4-released/
-sha256 1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0  ruby-2.4.4.tar.xz
+# https://www.ruby-lang.org/en/news/2018/10/17/ruby-2-4-5-released/
+sha256 2f0cdcce9989f63ef7c2939bdb17b1ef244c4f384d85b8531d60e73d8cc31eeb  ruby-2.4.5.tar.xz
 # License files, Locally calculated
-sha256 5cda9584acd5e1096276a375085b7e659fa67a072fd69ec2c3931e54f7f563bb  LEGAL
+sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
 sha256 a5e3042dacb53eebda91f3b1caefbfec8307711df8c4ed1ed20e4e97c43307a4  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b85ee9d069..3e71596bb4 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
