From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 10:15:27 +0200
Subject: [Buildroot] [git commit] Revert "setools: fix race condition"
Message-ID: <20150930081546.8105781D9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=712025237092a1cc49066207e7bc82d3cdebf3cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1ac68fe2c9b4cea91c7a30429ebf75279ede8e70.

Further investigations revealed that the problem wasn't a race condition
but the lack of flex package in the host machine:

  https://github.com/TresysTechnology/setools3/issues/5#issuecomment-144048612

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 71301c7..a2bfd42 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -12,10 +12,6 @@ SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 
-# Race condition reported upstream:
-# https://github.com/TresysTechnology/setools3/issues/5
-SETOOLS_MAKE = $(MAKE1)
-
 # configure.ac is patched by the cross compile patch,
 # so autoreconf is necessary
 SETOOLS_AUTORECONF = YES
