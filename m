From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] memstat: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132037.F3D647F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf263619284f1b10d2c3211e9a4ed20c6ff85c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memstat/memstat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7ee4d60..e11b4ae 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -11,7 +11,7 @@ MEMSTAT_LICENSE = GPL
 MEMSTAT_LICENSE_FILES = debian/copyright
 
 define MEMSTAT_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(@D) memstat
 endef
 
