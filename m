From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Apr 2018 17:48:55 +0200
Subject: [Buildroot] [PATCH] package/perl: bump perl-cross to fix build with
 gcc-7 on AArch64
Message-ID: <20180416154855.21630-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Ellie Reeves <ellierevves@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Ellie Reeves <ellierevves@gmail.com>
---
 package/perl/perl.hash | 2 +-
 package/perl/perl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 14e6b117ca..1a67cd9f91 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -4,4 +4,4 @@ sha1   403bb1804cb41416153d908eea093f2be22a77f6                         perl-5.2
 sha256 fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680 perl-5.26.1.tar.xz
 
 # Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.8/perl-cross-1.1.8.hash
-sha256	08e626ed9c419b8a695a8762ff8b41a553023175e4ad67b5e858fc9b4322521c  perl-cross-1.1.8.tar.gz
+sha256  0bbb450e48d07e7fdf867d578b1780ac8f0e8dc284d52301dac4d763b42f6041  perl-cross-1.1.9.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c47367b9da..78d4f6b13c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.8
+PERL_CROSS_VERSION = 1.1.9
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.14.1
