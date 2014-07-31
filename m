From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 31 Jul 2014 10:46:57 +0200
Subject: [Buildroot] [PATCH 1/1] manual/adding-packages-perl.txt: remove the
	trailing slash sign from description of PERL_SITE variable
Message-ID: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:

$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))

so it is redundant.


Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/adding-packages-perl.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 9a3df4d..b6cec21 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -19,7 +19,7 @@ with an example :
 06:
 07: PERL_FOO_BAR_VERSION = 0.02
 08: PERL_FOO_BAR_SOURCE = Foo-Bar-$(PERL_FOO_BAR_VERSION).tar.gz
-09: PERL_FOO_BAR_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MO/MONGER/
+09: PERL_FOO_BAR_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MO/MONGER
 10: PERL_FOO_BAR_DEPENDENCIES = perl-strictures
 11: PERL_FOO_BAR_LICENSE = Artistic or GPLv1+
 12: PERL_FOO_BAR_LICENSE_FILES = LICENSE
-- 
1.7.9.5
