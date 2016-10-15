From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:58 +0200
Subject: [Buildroot] [git commit] tcping: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.60EC381F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1ff79a78c8883365223c65cb0b6b54d8a35bf51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcping/tcping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index ff43490..4633b98 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -10,7 +10,7 @@ TCPING_LICENSE = GPLv3+
 TCPING_LICENSE_FILES = LICENSE
 
 define TCPING_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) tcping.linux
 endef
 
