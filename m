From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] dstat: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132039.1AB7B819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=943f0219cc8981486403127ba0d22707579f0e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dstat/dstat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index f02e908..180031f 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -11,7 +11,7 @@ DSTAT_LICENSE = GPLv2
 DSTAT_LICENSE_FILES = COPYING
 
 define DSTAT_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
