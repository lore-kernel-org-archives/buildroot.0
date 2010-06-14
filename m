From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 14 Jun 2010 23:47:15 +1000
Subject: [Buildroot] [PATCH] Display current action in title bar
Message-ID: <1276523235-26299-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/Makefile.package.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index a2720d7..327ab92 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -48,8 +48,9 @@ INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
 INFLATE.tar  = cat
 
-# MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+# MESSAGE Macro -- display a message in bold type and in the title bar
+MESSAGE  = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" \
+		&& echo -en "\033]2; $($(PKG)_NAME) $($(PKG)_VERSION) $(1) \007"
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
-- 
1.7.0.4
