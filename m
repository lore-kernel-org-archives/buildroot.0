From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:11 +0200
Subject: [Buildroot] [git commit] statserial: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.A45FF81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4367efc87505108961e10dd42cbc641e6447674e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/statserial/statserial.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index f0e15bc..22b468e 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -11,7 +11,7 @@ STATSERIAL_LICENSE = GPLv2+
 STATSERIAL_LICENSE_FILES = COPYING
 
 define STATSERIAL_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define STATSERIAL_INSTALL_TARGET_CMDS
