From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 15:57:37 +0100
Subject: [Buildroot] [git commit] busybox: 1.21.1 fix for
	move_to_unaligned16()
Message-ID: <20130227145817.F35689ADAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8024d2d87864eb0ba381291e0e2986f7643c8dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
new file mode 100644
index 0000000..2401b86
--- /dev/null
+++ b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
@@ -0,0 +1,11 @@
+--- busybox-1.21.0/include/platform.h
++++ busybox-1.21.0-platform/include/platform.h
+@@ -228,7 +228,7 @@ typedef uint32_t bb__aliased_uint32_t FI
+ # define move_from_unaligned32(v, u32p) (memcpy(&(v), (u32p), 4))
+ # define move_to_unaligned16(u16p, v) do { \
+ 	uint16_t __t = (v); \
+-	memcpy((u16p), &__t, 4); \
++	memcpy((u16p), &__t, 2); \
+ } while (0)
+ # define move_to_unaligned32(u32p, v) do { \
+ 	uint32_t __t = (v); \
