From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 00:40:28 +0200
Subject: [Buildroot] [git commit] flite: fix <pkg>_LICENSE_FILES
Message-ID: <20150712224116.C88F380438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c60766a3727a21e90e12d4c86a17d7565302de6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit dd4bcebd7c43212650cccc2494527dc3d69024d9 ("flite: use
FLITE_STRIP_COMPONENTS and FLITE_SUBDIR"), the FLITE_LICENSE_FILES was
no longer pointing to existing directories, which was breaking
legal-info.

Fixes:

  http://autobuild.buildroot.org/results/798/7983ec41a3f136bd997ebbfc110c7fc51ad79717/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flite/flite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 07ec473..611e334 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -25,7 +25,7 @@ FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
 FLITE_STRIP_COMPONENTS = 0
 FLITE_SUBDIR = flite-$(FLITE_VERSION)-release
 FLITE_LICENSE = BSD-4c
-FLITE_LICENSE_FILES = COPYING
+FLITE_LICENSE_FILES = $(FLITE_SUBDIR)/COPYING
 
 FLITE_INSTALL_STAGING = YES
 # Patching configure.in
