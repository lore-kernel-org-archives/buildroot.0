From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Feb 2017 08:42:12 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix build of native part
Message-ID: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EUMM don't find .xs file in subdirectory (only .pm files are handled)
So, let move lib/GD.xs in the root directory.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index ea8fd5c..2ad966c 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -12,6 +12,11 @@ PERL_GD_LICENSE = Artistic or GPLv1+
 PERL_GD_LICENSE_FILES = LICENSE
 PERL_GD_PREFER_INSTALLER = EUMM
 
+define PERL_GD_MOVE_XS
+	mv $(@D)/lib/GD.xs $(@D)/GD.xs
+endef
+PERL_GD_POST_PATCH_HOOKS += PERL_GD_MOVE_XS
+
 PERL_GD_CONF_OPTS = \
 	-options=FT,PNG \
 	-lib_gd_path=$(STAGING_DIR)/usr \
-- 
2.7.4
