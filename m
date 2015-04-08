From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed,  8 Apr 2015 09:52:30 +0900
Subject: [Buildroot] [PATCH] Makefile: fix HOSTFC definition
Message-ID: <1428454350-30186-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"echo" always succeeds, "which g77 || type -p g77 || echo gfortran"
is never run.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9db52a8..8f4f87c 100644
--- a/Makefile
+++ b/Makefile
@@ -251,7 +251,7 @@ HOSTRANLIB := ranlib
 endif
 HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
 HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTFC := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
+HOSTFC := $(shell which $(HOSTFC) || type -p $(HOSTFC) || which g77 || type -p g77 || echo gfortran)
 HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
 HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
-- 
1.9.1
