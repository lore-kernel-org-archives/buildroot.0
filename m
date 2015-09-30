From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Sep 2015 08:46:36 +0100
Subject: [Buildroot] [PATCH v2] setools: depends on host-flex
In-Reply-To: <1443599196-1073-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443599196-1073-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1443599196-1073-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setools needs host-flex in order to generate some source files during
build time, otherwise it will fail with an error like this one:

error: policy_scan.c: No such file or directory

Issue reported here as a race condition problem, but it turned out that
it the actual problem was the lack of host-flex:

  https://github.com/TresysTechnology/setools3/issues/5#issuecomment-144048612

Fixes:

  http://autobuild.buildroot.net/results/dad/dad9d79c10722b203536540141a6defc79937e4e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
  - No changes.

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
-- 
1.7.1
