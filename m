From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:47:04 +0200
Subject: [Buildroot] [git commit] ipmitool: add patch to fix missing stddef
	include
Message-ID: <20160418194822.A293880824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b02d66fccbcd3fa9f2518d351e06c43b466df1aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for wchar_t. Fixes build error:

imbapi.h:140:9: error: unknown type name 'wchar_t'
 typedef wchar_t      WCHAR;

Fixes:
http://autobuild.buildroot.net/results/9e9/9e99aa8aebf68667b8c054b64e49de6dd73dd53d/
http://autobuild.buildroot.net/results/496/49637fcab9cd8e6278257158574fd7574f97bc30/
http://autobuild.buildroot.net/results/6a3/6a37f69ac40d60a1735afe5974cabec3ca5de41f/

Upstream status: Pending
https://sourceforge.net/p/ipmitool/mailman/message/35022779/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-Fix-missing-stddef.h-include.patch        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/ipmitool/0004-Fix-missing-stddef.h-include.patch b/package/ipmitool/0004-Fix-missing-stddef.h-include.patch
new file mode 100644
index 0000000..e58c8b0
--- /dev/null
+++ b/package/ipmitool/0004-Fix-missing-stddef.h-include.patch
@@ -0,0 +1,37 @@
+From 2b149f7723fbd6153e6605ea8efb2c9f2940c8e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 18 Apr 2016 21:17:26 +0200
+Subject: [PATCH] Fix missing stddef.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed for wchar_t. Fixes build error:
+
+imbapi.h:140:9: error: unknown type name 'wchar_t'
+ typedef wchar_t      WCHAR;
+
+Upstream status: Pending
+https://sourceforge.net/p/ipmitool/mailman/message/35022779/
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/plugins/imb/imbapi.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
+index ead8956..8d0c7ae 100644
+--- a/src/plugins/imb/imbapi.h
++++ b/src/plugins/imb/imbapi.h
+@@ -40,6 +40,8 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ # include <config.h>
+ #endif
+ 
++#include <stddef.h>
++
+ #ifndef FALSE
+ #define FALSE   0
+ #endif
+-- 
+2.8.0
+
