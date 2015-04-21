From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 15:36:56 +0200
Subject: [Buildroot] [git commit] system/skeleton: fix /etc/group
Message-ID: <20150421133701.2D46681D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab6b4c82f4d7857de3b48172e590f8d6dc6c9171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using busybox compiled from current git, login emits the following
message:

    login: /etc/group: bad record

Fix it by adding the missing colon to /etc/group in system/skeleton.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/group |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
