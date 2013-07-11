From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 11:37:33 -0300
Subject: [Buildroot] [PATCH] Makefile: unexport RUBYOPT
Message-ID: <1373553453-30335-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Gentoo systems with ruby installed RUBYOPT is set and causes build
breakage for some packages that needs host-ruby (example: webkit).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.8.1.5
