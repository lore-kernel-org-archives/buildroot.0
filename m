From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:14 +0200
Subject: [Buildroot] [git commit] blktrace: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.B9FE581F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae50be799df603f325203cf4987a977f8c0575d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/blktrace.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index c193375..de583cf 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -11,11 +11,11 @@ BLKTRACE_LICENSE = GPLv2+
 BLKTRACE_LICENSE_FILES = COPYING
 
 define BLKTRACE_BUILD_CMDS
-	$(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define BLKTRACE_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
 		DESTDIR=$(TARGET_DIR) prefix=/usr
 endef
 
