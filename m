From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Oct 2014 13:18:01 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: Let opencv's build system handle
	the ts module dependencies
In-Reply-To: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the former version of opencv we added a patch to fix a dependencies
problem in the ts module. That issue was reported upstream and is now
merged in the 2.4.10 version:

  https://github.com/Itseez/opencv/commit/7018f9495920f974258502b9b8b26af16d7ee427

So now we can revert our former patch and let opencv's build system
handle the ts module dependencies as we already do in the other modules.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d648e5e..24f540e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -101,7 +101,6 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
-	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	default y
 	help
 	  Include opencv_ts module into the OpenCV build.
-- 
1.7.1
