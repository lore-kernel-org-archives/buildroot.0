From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 18:04:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/luksmeta: do not
 build man pages
Message-ID: <20190925160056.2913D8F3D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2465aac0e2abb3f7489d03d67268fd3021d96cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/a6247b95f1578fe1daec485589582310c75b5d84/

luksmeta-v9 generates man pages at build if a2x is available since:

commit 3fa51bb22350fee101fc52044949f6eb394114ae
Author: Daniel Kope??ek <dkopecek@redhat.com>
Date:   Fri Jul 13 01:52:45 2018 +0200

   Generate manual page from source during build time

   If a2x (asciidoc) is not available during configure time,
   a warning will be generated and the manual page wont be
   generated nor installed.

Man pages are not needed on target and the build step fails in certain
setups, so disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0471f650b1eeb99276d1387dc50bf70b36460ce3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luksmeta/luksmeta.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
index c8a19ddeeb..129713aec8 100644
--- a/package/luksmeta/luksmeta.mk
+++ b/package/luksmeta/luksmeta.mk
@@ -10,6 +10,7 @@ LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSME
 LUKSMETA_LICENSE = LGPL-2.1+
 LUKSMETA_LICENSE_FILES = COPYING
 LUKSMETA_DEPENDENCIES = host-pkgconf cryptsetup
+LUKSMETA_CONF_ENV = ac_cv_prog_A2X=""
 LUKSMETA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
