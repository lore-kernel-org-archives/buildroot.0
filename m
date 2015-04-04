From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:27:44 +0200
Subject: [Buildroot] [git commit] procps-ng: add dependency on host-pkgconf
Message-ID: <20150404154941.AC18581906@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaa942c4047e599340ae8d664a52307bb84a31a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

procps-ng configure.ac script uses PKG_CHECK_MODULES(), which needs
pkg-config. Until now, it wasn't mandatory since for the ncurses check
it tries PKG_CHECK_MODULES() and then falls back to AC_CHECK_LIB(),
but for the upcoming systemd support, pkg-config is really needed.

Since pkg-config is used both for the ncurses and systemd checks, we
make it a mandatory dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 71e32dd..ff3c6d3 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -11,7 +11,7 @@ PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
 
-PROCPS_NG_DEPENDENCIES = ncurses
+PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
 
 # If both procps-ng and busybox are selected, make certain procps-ng
 # wins the fight over who gets to have their utils actually installed.
