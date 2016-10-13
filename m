From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:35 -0300
Subject: [Buildroot] [PATCH 28/51] blktrace: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-29-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
 
-- 
2.7.3
