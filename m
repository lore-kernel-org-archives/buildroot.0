From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 17:08:13 +0100
Subject: [Buildroot] [git commit] Change the /etc/mtab symlink to use an
	absolute path
Message-ID: <20120319162001.5D5BE953F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5fd0f2709cab72f48da12a5804dd8670fffbf6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As systemd checks if /etc/mtab is a symlink to /proc/mount or
/proc/self/mounts, we need to change it so that we can run systemd.

http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/mtab |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/mtab b/fs/skeleton/etc/mtab
index e1c2045..4c0a094 120000
--- a/fs/skeleton/etc/mtab
+++ b/fs/skeleton/etc/mtab
@@ -1 +1 @@
-../proc/mounts
\ No newline at end of file
+/proc/mounts
\ No newline at end of file
