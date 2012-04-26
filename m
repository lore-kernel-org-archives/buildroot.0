From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Apr 2012 15:22:15 +0200
Subject: [Buildroot] [git commit] Add the www-data user group to the
	skeleton target filesystem
Message-ID: <20120426132308.7B8F596BD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe63b5925af2ce14fa20c4d5d92ce5d0789d909a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The www-data user is defined in fs/skeleton/etc/passwd, with gid 33. But
gid 33 is not present in the group file.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index cd4ca79..8fc486d 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -7,6 +7,7 @@ tty:x:5:
 disk:x:6:
 wheel:x:10:root
 audio:x:29:
+www-data:x:33:
 utmp:x:43:
 staff:x:50:
 lock:x:54:
