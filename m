From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 17:32:29 +0200
Subject: [Buildroot] [PATCH] rtmpdump: security bump to current HEAD
Message-ID: <20170515153229.29831-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

- CVE-2015-8271: The AMF3CD_AddProp function in amf.c in RTMPDump 2.4 allows
  remote RTMP Media servers to execute arbitrary code
  https://www.talosintelligence.com/reports/TALOS-2016-0067/

- CVE-2015-8272: RTMPDump 2.4 allows remote attackers to trigger a denial of
  service (NULL pointer dereference and process crash).
  https://www.talosintelligence.com/reports/TALOS-2016-0068/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/rtmpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 19d9b04a2..f5d430ce3 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = a107cef9b392616dff54fabfd37f985ee2190a6f
+RTMPDUMP_VERSION = fa8646daeb19dfd12c181f7d19de708d623704c0
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
-- 
2.11.0
