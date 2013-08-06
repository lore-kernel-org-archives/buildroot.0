From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  6 Aug 2013 22:46:44 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
	term window
Message-ID: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-utils.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 15db096..8572cb1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -64,7 +64,8 @@ INFLATE.xz   = $(XZCAT)
 INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" && \
+              echo -e "\033]2;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
 TERM_BOLD  := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
-- 
1.7.9.5
