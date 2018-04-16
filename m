From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:41 +0200
Subject: [Buildroot] [git commit] haveged: don't test if the binary exists
 in the init script
Message-ID: <20180416053717.EF9B27FE7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1371504a0a13ee96b25c39a711bb6638e0c1544e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/S21haveged | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
index 3e6ce8678f..4b6e6ced4e 100755
--- a/package/haveged/S21haveged
+++ b/package/haveged/S21haveged
@@ -1,7 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/haveged ] || exit 0
-
 case "$1" in
 	start)
 		printf "Starting haveged: "
