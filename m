From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 15:07:45 -0300
Subject: [Buildroot] [PATCH] opus-tools: disable flac when it is not selected
Message-ID: <1378836465-25626-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opus-tools expects flac since the 0.1.7 bump unless otherwise told so.
Disable it when it's not selected. Fixes:
http://autobuild.buildroot.net/results/c8c/c8c1a682336c150ee401f76b173944611b96bd4e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opus-tools/opus-tools.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index bb11a19..f4dee74 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -19,4 +19,10 @@ else
 OPUS_TOOLS_CONF_OPT += --disable-sse
 endif
 
+ifeq ($(BR2_PACKAGE_FLAC),y)
+OPUS_TOOLS_DEPENDENCIES += flac
+else
+OPUS_TOOLS_CONF_OPT += --without-flac
+endif
+
 $(eval $(autotools-package))
-- 
1.8.1.5
