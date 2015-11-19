From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 13:29:18 +0100
Subject: [Buildroot] [git commit] perl-file-util: restore host variant and
	fix dependencies
Message-ID: <20151119123546.926C08163E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b7cb94c967549cd59cc692ec2fc843f66974478
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant was added by us (DATACOM) because it is useful to
build some third-party packages that we use in our firmware. We humbly
request you to keep it alive.

Declare that it requires host-perl-module-build.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-file-util/perl-file-util.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
