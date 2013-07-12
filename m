From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Jul 2013 13:31:11 +0200
Subject: [Buildroot] [git commit] Makefile: unexport RUBYOPT
Message-ID: <20130712113809.43A6D9A68C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bed61a7be37cd95b05b8fa9c48cab77e81c93efd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Gentoo systems with ruby installed RUBYOPT is set and causes build
breakage for some packages that needs host-ruby (example: webkit).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index f6e9965..f477124 100644
--- a/Makefile
+++ b/Makefile
@@ -180,6 +180,9 @@ unexport PKG_CONFIG_SYSROOT_DIR
 # steps of some packages.
 unexport DESTDIR
 
+# Causes breakage with packages that needs host-ruby
+unexport RUBYOPT
+
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
