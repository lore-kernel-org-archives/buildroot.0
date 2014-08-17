From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:10:12 +0200
Subject: [Buildroot] [git commit] nftables: fix build in static scenarios
Message-ID: <20140817072258.27B449D44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34e3857d9855197bb52a4056ad1f2a95a67d08f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking against readline, it forgets to link against ncurses,
which is needed by readline. Fix this by passing LIBS="-lcurses" to
the configure script.

Fixes:

  http://autobuild.buildroot.org/results/98b/98b707ffdeeb1cda94b7c1019ef29cf5fd7db8bf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b25e8f2..b3abbc0 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -12,6 +12,8 @@ NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
-NFTABLES_CONF_ENV = ac_cv_prog_CONFIG_PDF=no
+NFTABLES_CONF_ENV = \
+	ac_cv_prog_CONFIG_PDF=no \
+	LIBS="-lncurses"
 
 $(eval $(autotools-package))
