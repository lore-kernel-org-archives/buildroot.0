From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jul 2012 20:22:50 +0200
Subject: [Buildroot] [git commit] Ensure DESTDIR will not confuse the build
Message-ID: <20120702195608.230DC8F6E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91123a6fab2770ced312fc54a69f4d83f3a2e1e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having DESTDIR defined will confuse the build of certain packages, so
we ensure that it is undefined from the environment when Buildroot
starts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index bcbe9fc..b80477f 100644
--- a/Makefile
+++ b/Makefile
@@ -168,6 +168,10 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 # Make sure pkg-config doesn't look outside the buildroot tree
 unexport PKG_CONFIG_PATH
 
+# Having DESTDIR set in the environment confuses the installation
+# steps of some packages.
+unexport DESTDIR
+
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
