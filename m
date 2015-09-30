From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 10:15:40 +0200
Subject: [Buildroot] [git commit] setools: depends on host-flex
Message-ID: <20150930081546.8323B80E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa9d0818f41dbf6d7ff485a25a370cd4f5ab47b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

setools needs host-flex in order to generate some source files during
build time, otherwise it will fail with an error like this one:

error: policy_scan.c: No such file or directory

Issue reported here as a race condition problem, but it turned out that
it the actual problem was the lack of host-flex:

  https://github.com/TresysTechnology/setools3/issues/5#issuecomment-144048612

Fixes:

  http://autobuild.buildroot.net/results/dad/dad9d79c10722b203536540141a6defc79937e4e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index a2bfd42..612ab89 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -7,7 +7,7 @@
 SETOOLS_VERSION = 3.3.8
 SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
 SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
-SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison
+SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison host-flex
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
