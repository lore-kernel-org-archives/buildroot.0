From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Oct 2019 20:25:18 +0100
Subject: [Buildroot] [PATCH 6/8] package/perl-moo: bump to version 2.003006
In-Reply-To: <20191028192520.8656-1-francois.perrad@gadz.org>
References: <20191028192520.8656-1-francois.perrad@gadz.org>
Message-ID: <20191028192520.8656-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

license lives now in its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-moo/Config.in     | 1 -
 package/perl-moo/perl-moo.hash | 6 +++---
 package/perl-moo/perl-moo.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/perl-moo/Config.in b/package/perl-moo/Config.in
index 141b95ca5..e4a6db290 100644
--- a/package/perl-moo/Config.in
+++ b/package/perl-moo/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_MOO
 	bool "perl-moo"
 	select BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS # runtime
-	select BR2_PACKAGE_PERL_DEVEL_GLOBALDESTRUCTION # runtime
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
 	select BR2_PACKAGE_PERL_ROLE_TINY # runtime
 	select BR2_PACKAGE_PERL_SUB_QUOTE # runtime
diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 509a9ea4e..21bcc6cca 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d4fcd0f240033198571fcc81ce7c5f15 Moo-2.003004.tar.gz
-sha256 f8bbb625f8e963eabe05cff9048fdd72bdd26777404ff2c40bc690f558be91e1 Moo-2.003004.tar.gz
+md5    53af7e7849492a8e3994ee379d12e348 Moo-2.003006.tar.gz
+sha256 bcb2092ab18a45005b5e2e84465ebf3a4999d8e82a43a09f5a94d859ae7f2472 Moo-2.003006.tar.gz
 
 # computed by scancpan
-sha256 3fe29ec1d93827ee69825ed4bf916cc5ce4e7bf0b940ec6dd2d4ed30f4755dc3 README
+sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 64e8d748a..691377640 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.003004
+PERL_MOO_VERSION = 2.003006
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
-PERL_MOO_LICENSE_FILES = README
+PERL_MOO_LICENSE_FILES = LICENSE
 PERL_MOO_DISTNAME = Moo
 
 $(eval $(perl-package))
-- 
2.20.1
