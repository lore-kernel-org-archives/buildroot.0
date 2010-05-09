From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:41 +0200
Subject: [Buildroot] [PATCH 7/9] vlc: mark as broken
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <45c3fedd820039d865281a12b6b06c2b05a149bd.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before 2010.02, VLC didn't build, because it didn't pass the
appropriate --disable- options according to the libraries available in
Buildroot. Now, 2010.05 is going to be released, and no one bothered
to fix VLC. Therefore, let's mark VLC as broken.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/vlc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
index c8faaa7..a261607 100644
--- a/package/multimedia/vlc/Config.in
+++ b/package/multimedia/vlc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VLC
 	bool "vlc"
+	depends on BROKEN
 	help
 	  a free cross-platform media player
 
-- 
1.6.3.3
