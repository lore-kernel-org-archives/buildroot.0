From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 18:25:06 +0100
Subject: [Buildroot] [git commit] board/csky: fixup gdb instructions in
	readme.txt
Message-ID: <20170323172524.1B393820FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54242226f034c1245d379df5f98cefcc13553437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdbinit file assumes the .dtb file is in the current directory, so
let's start gdb from output/images.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
[Thomas: improved commit description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/csky/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index a820e3b..daf7185 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -83,5 +83,6 @@ Run
 
   Setup the Console with the rate 115200/8-N-1.
 
-  $ ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
+  $ cd output/images
+  $ ../host/usr/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
 
