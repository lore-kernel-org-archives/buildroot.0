From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:17:07 +0200
Subject: [Buildroot] [git commit] manual/adding-packages-perl.txt: remove
	the trailing slash sign from description of PERL_SITE variable
Message-ID: <20140731211907.1AE849D357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17902f5b1601ab2036b6e89d91c2042755545cec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:

$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))

so it is redundant.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-perl.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
