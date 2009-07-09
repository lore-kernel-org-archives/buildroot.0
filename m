From: laurent laffont <laurent.laffont@gmail.com>
Date: Thu, 9 Jul 2009 14:08:51 +0200
Subject: [Buildroot] [git commit] Change ruby version to 1.9.1-p129
Message-ID: <20090713074532.EB05B777E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8703912fa081014488faeb09e8ec5f10de6b039c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Ruby 1.9.1 handle cross compilation better, espescially extensions
(I'm working on ARM at91sam9263-ek).
This patch also disable ruby doc generation and ipv6.

[Peter: fixed ipv6 handling]

Signed-off-by: laurent laffont <laurent.laffont@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-configure.patch |    6 +++---
 package/ruby/ruby.mk              |    6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby-configure.patch b/package/ruby/ruby-configure.patch
index ab44ebe..2b58c70 100644
--- a/package/ruby/ruby-configure.patch
+++ b/package/ruby/ruby-configure.patch
@@ -1,6 +1,6 @@
---- ruby-1.8.3/configure.in.orig	2005-11-29 11:18:27.000000000 +0100
-+++ ruby-1.8.3/configure.in	2005-11-29 11:19:46.000000000 +0100
-@@ -529,7 +529,25 @@
+--- a/configure.in.orig	2009-07-08 15:23:44.000000000 +0200
++++ b/configure.in	2009-07-08 15:24:52.000000000 +0200
+@@ -997,7 +997,25 @@
  fi
  
  AC_FUNC_GETPGRP
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c7dc31f..3bfd542 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -3,9 +3,9 @@
 # ruby
 #
 #############################################################
-RUBY_VERSION:=1.8.2
+RUBY_VERSION:=1.9.1-p129
 RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
-RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.8
+RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DIR:=$(BUILD_DIR)/ruby-$(RUBY_VERSION)
 RUBY_CAT:=$(ZCAT)
 RUBY_BINARY:=ruby
@@ -41,6 +41,8 @@ $(RUBY_DIR)/.configured: $(RUBY_DIR)/.unpacked
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		--disable-install-doc \
+		$(DISABLE_IPV6) \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
-- 
1.6.3.3
