From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Thu, 16 Mar 2017 17:13:21 +0530
Subject: [Buildroot] [PATCH v4 2/3] Add LINUX_DIR to EXTRA_ENV for use in
	post-build scripts
In-Reply-To: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <1489664602-32596-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>

To build fitImage in post-build scripts, we need compressed
kernel binary which is intermediate target, hence doesnt get
copied to output/images folder.

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
---
 Changes v3->v4 (Suggested by Arnout)
   - Drop exporting LINUX_DIR instead add to EXTRA_ENV var

 package/Makefile.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4a3eb26..b1962ed 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -310,7 +310,8 @@ HOST_CONFIGURE_OPTS = \
 EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
-	BUILD_DIR=$(BUILD_DIR)
+	BUILD_DIR=$(BUILD_DIR) \
+	LINUX_DIR=$(LINUX_DIR)
 
 ################################################################################
 # settings we need to pass to configure
-- 
2.7.4
