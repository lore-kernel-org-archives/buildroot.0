From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.9.3
Message-ID: <20141017121829.49B05B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=547d0e16072ddc1d3e47bef5784cdab567789f26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this version fixes the issue with big endian,
see https://github.com/arsv/perl-cross/issues/10

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 3ce55a8..723dc12 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,8 +12,8 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.2
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_CROSS_VERSION = 0.9.3
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -58,7 +58,6 @@ PERL_CONF_OPTS = \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
-	-Dmultiarch \
 	-Dmydomain="" \
 	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
