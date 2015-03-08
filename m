From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:32:26 +0100
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.9.6
Message-ID: <20150308173258.9CBB7807AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65e8a2e75dad56dbc27b577b21eeb64a45a116e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this release contains a fix for yacc/bison issue,
see http://github.com/arsv/perl-cross/issues/13

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.hash |    2 +-
 package/perl/perl.mk   |    5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index ac7bafe..d28b5fd 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -4,4 +4,4 @@ sha1   63126c683b4c79c35008a47d56f7beae876c569f                         perl-5.2
 sha256 e5a4713bc65e1da98ebd833dce425c000768bfe84d17ec5183ec5ca249db71ab perl-5.20.2.tar.bz2
 
 # No upstream hashes for the following
-sha256 614f320d45042ca179a15ec88c6a15ff68e6f36fb004ee89efa71e42bda1dead perl-5.20.1-cross-0.9.4.tar.gz
+sha256 e25c5d9289b98db8f9d6a27bda9de12028ffc37eeede2d2fbfb10590d36fbf8f perl-5.20.2-cross-0.9.6.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index cd4c286..133e8aa 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,8 +12,8 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.4
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_CROSS_VERSION = 0.9.6
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -85,7 +85,6 @@ endif
 define PERL_CONFIGURE_CMDS
 	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
-	touch $(@D)/x2p/a2p.c # prevents regen by yacc
 endef
 
 define PERL_BUILD_CMDS
