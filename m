From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 13:46:10 +0200
Subject: [Buildroot] [git commit] package/linuxptp: needs threads
Message-ID: <20200906113803.EAA0A8758B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a002434d2c00fce64245317a4e432114d945d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linuxptp needs threads since version 3.0 and
https://sourceforge.net/p/linuxptp/code/ci/7486e6e4e1b13bd9bceb23c40ace7e048a88b8e5

Fixes:
 - http://autobuild.buildroot.org/results/421dd595f0fd3c0af099cd2991ee94d4edd272e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linuxptp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
index 3e18a0cb13..c88b7a0619 100644
--- a/package/linuxptp/Config.in
+++ b/package/linuxptp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LINUXPTP
 	bool "linuxptp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Linux PTP Project is the Precision Time Protocol
 	  implementation according to IEEE standard 1588 for Linux.
@@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
 	  not a goal.
 
 	  http://linuxptp.sourceforge.net/
+
+comment "linuxptp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
