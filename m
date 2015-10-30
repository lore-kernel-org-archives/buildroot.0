From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Oct 2015 15:09:56 +0100
Subject: [Buildroot] [git commit] host-perl: fix patching
Message-ID: <20151030141036.DEB9B81F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af0e6a33ff32d1772d7f9a36d5f5bd2598a5647a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.net/results/c8e/c8e6bbe50ca71835bdde9503a9fe23ace8236a09/

the newest patches are against perl-cross,
so we need to extract perl-cross in the host-perl case.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 7192700..d35e05c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -31,6 +31,7 @@ define PERL_CROSS_EXTRACT
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
+HOST_PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 define PERL_CROSS_SET_POD
 	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
