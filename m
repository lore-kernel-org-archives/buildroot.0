From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 14:44:06 +0100
Subject: [Buildroot] [git commit] busybox: add 1.19.3 mdev fix
Message-ID: <20120130134507.92E449094D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e80ba177970516e74e280f8091c12d22261380c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see
http://lists.busybox.net/pipermail/busybox/2012-January/077236.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.3/busybox-1.19.3-mdev.patch       |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch
new file mode 100644
index 0000000..653ac35
--- /dev/null
+++ b/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch
@@ -0,0 +1,11 @@
+--- busybox-1.19.3/util-linux/mdev.c
++++ busybox-1.19.3-mdev/util-linux/mdev.c
+@@ -610,7 +610,7 @@ int mdev_main(int argc UNUSED_PARAM, cha
+ 				int seqlen;
+ 				char seqbuf[sizeof(int)*3 + 2];
+ 
+-				seqlen = open_read_close("mdev.seq", seqbuf, sizeof(seqbuf-1));
++				seqlen = open_read_close("mdev.seq", seqbuf, sizeof(seqbuf) - 1);
+ 				if (seqlen < 0) {
+ 					seq = NULL;
+ 					break;
