From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jul 2020 15:30:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: fix build error
Message-ID: <20200726133023.1943702-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5db/5dbce5860f57c1457962aa295857689f49a60bc6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-sofia-sip-fix-s2tcase.c.patch        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch

diff --git a/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
new file mode 100644
index 0000000000..c4b9270984
--- /dev/null
+++ b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
@@ -0,0 +1,38 @@
+From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Jul 2020 13:47:16 +0200
+Subject: [PATCH] [sofia-sip] fix s2tcase.c
+
+Fixes build error with libcheck:
+https://github.com/signalwire/freeswitch/issues/681
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libs/sofia-sip/s2check/s2tcase.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
+index 382aaa3ad7..d67694c2ce 100644
+--- a/libs/sofia-sip/s2check/s2tcase.c
++++ b/libs/sofia-sip/s2check/s2tcase.c
+@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+-- 
+2.27.0
+
-- 
2.27.0
