From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] iostat: use provided linker
	flags as well
Message-ID: <20120802195246.9EBB38C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2bcd32922a06b701befea97c964248d36e208b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iostat/iostat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 83eea07..d3efa59 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -10,7 +10,7 @@ IOSTAT_SITE = http://www.linuxinsight.com/files
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
 define IOSTAT_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define IOSTAT_CLEAN_CMDS
