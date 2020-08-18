From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:36:31 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ruby: security
 bump to version 2.4.10
Message-ID: <20200818153621.AB19686312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc3e64390c189e9e374ba4ded0408328d4c4c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-10663: Unsafe Object Creation Vulnerability in JSON (Additional
  fix)
  https://www.ruby-lang.org/en/news/2020/03/19/json-dos-cve-2020-10663/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79c9a82a10349b3d277370eeef8fdb1135dbae25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index d0aac63872..89cab3fcd3 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2019/10/02/ruby-2-4-9-released/
-sha256 0c4e000253ef7187feeb940a01a1c7594f28d63aa16f978e892a0e2864f58614  ruby-2.4.9.tar.xz
+# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-4-10-released/
+sha256 d5668ed11544db034f70aec37d11e157538d639ed0d0a968e2f587191fc530df  ruby-2.4.10.tar.xz
 # License files, Locally calculated
 sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 0ac1164332..6f8cb319cb 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
