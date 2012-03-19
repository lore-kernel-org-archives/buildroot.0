From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 Mar 2012 16:59:35 +0100
Subject: [Buildroot] [PATCH 1/6] Change the /etc/mtab symlink to use an
	absolute path
In-Reply-To: <cover.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <16e6e9e98f4ece9b61ea5df842bd1c3927796299.1332172636.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As systemd checks if /etc/mtab is a symlink to /proc/mount or
/proc/self/mounts, we need to change it so that we can run systemd.

http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
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
-- 
1.7.5.4
