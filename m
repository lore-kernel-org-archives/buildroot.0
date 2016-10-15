From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:40 +0200
Subject: [Buildroot] [git commit] pptp-linux: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.3467A81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eab4842c7e0b505365761486ece9c6961f4ee0da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pptp-linux/pptp-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index d7edf6c..1538457 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -12,7 +12,7 @@ PPTP_LINUX_LICENSE = GPLv2+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
 define PPTP_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
