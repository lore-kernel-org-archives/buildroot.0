From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  7 Jan 2017 09:12:17 +0100
Subject: [Buildroot] [PATCH] pkg-perl: set PERL_USE_UNSAFE_INC
Message-ID: <20170107081217.13863-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent perls are built with the `default_inc_excludes_dot` option.
As many CPAN modules rely on '.' in @INC, the toolchain
must set `PERL_USE_UNSAFE_INC`.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index a027810..4b20598 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,7 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME = $(ARCH)-linux
-PERL_RUN = PERL5LIB= $(HOST_DIR)/usr/bin/perl
+PERL_RUN = PERL5LIB= PERL_USE_UNSAFE_INC=1 $(HOST_DIR)/usr/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
-- 
2.9.3
