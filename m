From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:39:30 +0100
Subject: [Buildroot] [git commit] package/perl-gdgraph: fix license
Message-ID: <20191129093153.A36F782640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0cf9d76ea0975af9f576a5674f1fa77e955ab9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dustismo.LICENSE contains the license for the Dustismo_Sans.ttf font
file. The rest is licensed under the same terms as Perl as specified
in README so add README to license files and add GPL-2.0+ to license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-gdgraph/perl-gdgraph.hash | 3 ++-
 package/perl-gdgraph/perl-gdgraph.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index ea994519dd..c0b195eb2a 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -2,5 +2,6 @@
 md5    38c6a188519e6272e9b2b722b315c3d8 GDGraph-1.54.tar.gz
 sha256 b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f GDGraph-1.54.tar.gz
 
-# computed by scancpan
+# Hash for license files
 sha256 710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd Dustismo.LICENSE
+sha256 f44630ad9101e40a101d906a07908c975a9b0742273cfb0c00a51d73afb53e7d README
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 284dc9dc21..286902a66e 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -7,8 +7,8 @@
 PERL_GDGRAPH_VERSION = 1.54
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
-PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+
-PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
+PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
+PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDGRAPH_DISTNAME = GDGraph
 
 $(eval $(perl-package))
