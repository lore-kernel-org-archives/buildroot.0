From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 May 2010 09:13:14 +0200
Subject: [Buildroot] [git commit master] vlc: mark as broken
Message-ID: <20100511071422.BE750AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa3439e6a3fe26dbfe634d3ca9f1f5763a97a003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before 2010.02, VLC didn't build, because it didn't pass the
appropriate --disable- options according to the libraries available in
Buildroot. Now, 2010.05 is going to be released, and no one bothered
to fix VLC. Therefore, let's mark VLC as broken.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/vlc/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
index c8faaa7..412a3c7 100644
--- a/package/multimedia/vlc/Config.in
+++ b/package/multimedia/vlc/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_VLC
 	bool "vlc"
+	# Improper ./configure options passed compared to the
+        # multimedia libraries available in Buildroot.
+	depends on BROKEN
 	help
 	  a free cross-platform media player
 
-- 
1.6.3.3
