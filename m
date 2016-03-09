From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 16:55:50 -0300
Subject: [Buildroot] [PATCH] yasm: style and whitespace cleanup
Message-ID: <1457553350-12363-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use $(SED) instead of sed.
Kill trailing whitespace in comment, and move it above the define as per
standard look.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/yasm/yasm.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index bf8a481..6729b6a 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -7,10 +7,10 @@
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
 
+# This sed prevents it compiling 2 programs (vsyasm and ytasm)
+# that are only of use on Microsoft Windows.
 define YASM_PRE_CONFIGURE_FIXUP
-# This sed prevents it compiling 2 programs (vsyasm and ytasm) 
-# that are only of use on Microsoft Windows. 
-	sed -i 's#) ytasm.*#)#' $(@D)/Makefile.in
+	$(SED) 's#) ytasm.*#)#' $(@D)/Makefile.in
 endef
 
 YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
-- 
2.4.10
