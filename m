From: Mario Lang <mlang@blind.guru>
Date: Fri, 29 Dec 2017 13:52:02 +0100
Subject: [Buildroot] [PATCH 1/2] Avoid spurious log messages when decoding
 scancodes
Message-ID: <20171229125203.2361-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch cerry-picked from upstream, can be removed upon next release.

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 ...ncodes-from-generating-spurious-log-messa.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/brltty/5.5/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch

diff --git a/package/brltty/5.5/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch b/package/brltty/5.5/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
new file mode 100644
index 0000000000..e6a2005d59
--- /dev/null
+++ b/package/brltty/5.5/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
@@ -0,0 +1,28 @@
+From 3ea213e47c6771b7e2481f64a98f30c02fcb4867 Mon Sep 17 00:00:00 2001
+From: Mario Lang <mlang@delysid.org>
+Date: Thu, 30 Nov 2017 13:14:47 +0100
+Subject: [PATCH] Prevent scancodes from generating spurious log messages. (ml)
+
+Signed-off-by: Mario Lang <mlang@blind.guru>
+---
+This patch was taken from upstream, and can be removed when 5.6 is out.
+
+ Drivers/Braille/HandyTech/braille.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Drivers/Braille/HandyTech/braille.c b/Drivers/Braille/HandyTech/braille.c
+index ef95fd15b..f7e605c1a 100644
+--- a/Drivers/Braille/HandyTech/braille.c
++++ b/Drivers/Braille/HandyTech/braille.c
+@@ -1560,7 +1560,7 @@ brl_readCommand (BrailleDisplay *brl, KeyTableCommandContext context) {
+                   case HT_EXTPKT_Scancode: {
+                     while (length--)
+                       enqueueCommand(BRL_CMD_BLK(PASSAT) | BRL_ARG_PUT(*bytes++));
+-                    break;
++                    continue;
+                   }
+ 
+                   case HT_EXTPKT_GetRTC: {
+-- 
+2.15.0
+
-- 
2.15.0
