From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:41:46 +0100
Subject: [Buildroot] [git commit branch/next] perl-module-build: downgrade
	to version 0.4208
Message-ID: <20150219214342.0EA2C7F8E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9691848d06a69004321847c691292fef6f1d13f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

fix prerequisites:
    CPAN::Meta (2.140640) is installed, but we need version >= 2.142060

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-module-build/perl-module-build.hash |    3 +++
 package/perl-module-build/perl-module-build.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
new file mode 100644
index 0000000..7da8793
--- /dev/null
+++ b/package/perl-module-build/perl-module-build.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    296e2ee8d7f7c6b4b178cda6919ba3c9 Module-Build-0.4208.tar.gz
+sha256 32eca47c494a5d2a826c30616270b0fc744315b7363223b54fdea2dcef635378 Module-Build-0.4208.tar.gz
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 4fdb4c7..aa6259a 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4210
+PERL_MODULE_BUILD_VERSION = 0.4208
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
