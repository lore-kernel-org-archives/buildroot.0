From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:08:50 +0100
Subject: [Buildroot] [git commit] ljsyscall: move installation path to
	/usr/share/lua/5x
Message-ID: <20140306220855.D92399BDB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a888535d45f5dc3cbdeb08f5c30876d3139d65d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move ljsyscall install destination to /usr/share/lua/$(abiver}, to
match what the luarocks install would naturally do.  This also
reflects the value of INSTALL_LMOD in the luajit.pc file.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Tested-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljsyscall/ljsyscall.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 1f36dc7..cc49890 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -19,7 +19,7 @@ else ifeq ($(LJSYSCALL_ARCH),)
 LJSYSCALL_ARCH = $(BR2_ARCH)
 endif
 
-LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)
+LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)
 
 define LJSYSCALL_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall
