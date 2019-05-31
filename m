From: Valerio Crini <vcrini@gmail.com>
Date: Fri, 31 May 2019 09:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: add node modules to
 check-bin-arch's IGNORES list
Message-ID: <20190531075800.7064-1-vcrini@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Valerio Crini <valerio.crini@docomodigital.com>

Some node modules as stf ship compiled binaries causing check-bin-arch script
to return errors.

Signed-off-by: Valerio Crini <valerio.crini@docomodigital.com>
---
 support/scripts/check-bin-arch | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 3449bd1aeb..a276b75b92 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -25,6 +25,11 @@ declare -a IGNORES=(
 	# it for a different architecture (e.g. i386 grub on x86_64).
 	"/lib/grub"
 	"/usr/lib/grub"
+
+	# Skip files in /usr/lib/node_modules, since it is possible to have it
+	# for a different architecture (e.g. stf module has some packages already
+	# compiled for several architectures).
+	"/usr/lib/node_modules"
 )
 
 while getopts p:l:r:a:i: OPT ; do
-- 
2.20.1
