From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Sep 2013 21:49:25 +0200
Subject: [Buildroot] [git commit] opus-tools: disable flac when it is not
	selected
Message-ID: <20130910200702.82D09834B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=685e50f5171eea2ad560523ff31d38ff6e3c0376
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opus-tools expects flac since the 0.1.7 bump unless otherwise told so.
Disable it when it's not selected. Fixes:
http://autobuild.buildroot.net/results/c8c/c8c1a682336c150ee401f76b173944611b96bd4e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opus-tools/opus-tools.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
