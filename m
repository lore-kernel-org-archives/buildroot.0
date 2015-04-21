From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 21 Apr 2015 14:22:25 +0200
Subject: [Buildroot] [PATCH] system/skeleton: fix /etc/group
Message-ID: <1429618945-21621-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using busybox compiled from current git, login emits the following
message:

    login: /etc/group: bad record

Fix it by adding the missing colon to /etc/group in system/skeleton.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 system/skeleton/etc/group | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index fa74ae2..c1dc11f 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -21,6 +21,6 @@ plugdev:x:46:
 staff:x:50:
 lock:x:54:
 netdev:x:82:
-ftp:x:83
+ftp:x:83:
 nogroup:x:99:
 users:x:100:
-- 
2.1.4
