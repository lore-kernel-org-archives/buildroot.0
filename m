From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Oct 2013 20:26:55 +0200
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix compile warning
	because of missing include.
Message-ID: <1381429615-6689-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With commit b58bf60b519353e983e372f5627d639e7cc72a7a the libgen.h
include was removed from confdata.c, but it is needed for the dirname
function declaration.

Fixes the following compile warning:
./confdata.c: In function ?conf_split_config?:
./confdata.c:849:6: warning: assignment makes pointer from integer
without a cast

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 support/kconfig/confdata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 43f08fa..db1fac5 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -13,6 +13,7 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
+#include <libgen.h>
 
 #include "lkc.h"
 
-- 
1.8.1.4
