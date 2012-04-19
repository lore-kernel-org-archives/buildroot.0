From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 15:46:05 +0200
Subject: [Buildroot] [git commit] Fix systemd failure with lock files
Message-ID: <20120419194555.027CC96B1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=552b4f9400d1710796371fb29c23087a78e5c440
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd introduced a new policy described here:
http://lists.freedesktop.org/archives/systemd-devel/2011-March/001823.html

Add the "lock" group to buildroot to allow systemd to set this in place
at boot time

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index 311a455..cd4ca79 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -9,6 +9,7 @@ wheel:x:10:root
 audio:x:29:
 utmp:x:43:
 staff:x:50:
+lock:x:54:
 haldaemon:x:68:
 dbus:x:81:
 netdev:x:82:
