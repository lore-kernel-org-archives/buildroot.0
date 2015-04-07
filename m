From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue,  7 Apr 2015 13:08:16 +0900
Subject: [Buildroot] [PATCH] Makefile: remove redundant ifdef V
Message-ID: <1428379696-16079-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If "V" is not defined, "$(origin V)" returns "undefined".
"ifdev V" is redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index d6426b3..9db52a8 100644
--- a/Makefile
+++ b/Makefile
@@ -184,10 +184,8 @@ endif
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
-ifdef V
-  ifeq ("$(origin V)", "command line")
-    KBUILD_VERBOSE = $(V)
-  endif
+ifeq ("$(origin V)", "command line")
+  KBUILD_VERBOSE = $(V)
 endif
 ifndef KBUILD_VERBOSE
   KBUILD_VERBOSE = 0
-- 
1.9.1
