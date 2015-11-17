From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 17 Nov 2015 10:24:06 -0200
Subject: [Buildroot] [PATCH 1/1] perl-file-util: restore host variant and
	fix dependencies
Message-ID: <1447763046-25345-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host variant was added by us (DATACOM) because it is useful to
build some third-party packages that we use in our firmware. We humbly
request you to keep it alive.

Declare that it requires host-perl-module-build.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/perl-file-util/perl-file-util.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index fe83585..7026515 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -10,5 +10,7 @@ PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
+HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.5.0
