From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:34 +0200
Subject: [Buildroot] [git commit] mongoose: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.1983181F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11b9d006883dba6427781277983c46274f3a2a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongoose/mongoose.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 98f6525..7dfa119 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -19,8 +19,8 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
-	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
+	$(TARGET_MAKE_ENV) $(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
+	$(TARGET_MAKE_ENV) $(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
 define MONGOOSE_INSTALL_STAGING_CMDS
