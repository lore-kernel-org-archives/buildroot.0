From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Mon, 27 Feb 2017 19:08:00 +0530
Subject: [Buildroot] [PATCH v3 2/3] Export LINUX_DIR for post-build scripts
In-Reply-To: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <1488202681-9744-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
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
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9663d15..5c8a934 100644
--- a/Makefile
+++ b/Makefile
@@ -464,6 +464,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export LINUX_DIR
 
 ################################################################################
 #
-- 
2.7.4
