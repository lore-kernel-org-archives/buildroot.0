From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:37 +0200
Subject: [Buildroot] [git commit] dmraid: don't test if the binary exists in
 the init script
Message-ID: <20180416053717.B6F7F83B4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e72bb38b9db3d9384398455c1a8e2dcf30140263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmraid/S20dmraid | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
index fd2ad9e845..b3bfdcc84b 100644
--- a/package/dmraid/S20dmraid
+++ b/package/dmraid/S20dmraid
@@ -2,8 +2,6 @@
 
 set -e
 
-[ -x /usr/sbin/dmraid ] || exit 0
-
 # try to load module in case that hasn't been done yet
 modprobe dm-mod >/dev/null 2>&1
 
