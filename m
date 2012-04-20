From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 20 Apr 2012 11:08:55 +0100
Subject: [Buildroot] [PATCH resend] Add the www-data user group to the
	skeleton target filesystem
Message-ID: <1334916535-8866-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The www-data user is defined in fs/skeleton/etc/passwd, with gid 33. But
gid 33 is not present in the group file.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
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
-- 
1.7.5.4
