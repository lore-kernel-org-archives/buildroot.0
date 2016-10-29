From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:42:09 +0200
Subject: [Buildroot] [git commit] ezxml: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029134216.B5150800B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a185aab18c2450390b57e334717c187a8c31e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ezxml/ezxml.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 7693466..a806e56 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -11,8 +11,8 @@ EZXML_LICENSE = MIT
 EZXML_LICENSE_FILES = license.txt
 
 define EZXML_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
-	-f GNUmakefile -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f GNUmakefile \
+		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR)
 endef
 
 define EZXML_INSTALL_STAGING_CMDS
