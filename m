From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:36:16 +0100
Subject: [Buildroot] [git commit] package/brltty: avoid spurious log
 messages while decoding scancodes
Message-ID: <20171229205518.8C41383854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ac0abfca8973b9577a0cf271c4a7425e40c6f13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch cherry-picked from upstream, can be removed upon next release.

Signed-off-by: Mario Lang <mlang@blind.guru>
[Thomas: move patch out of per-version directory.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ncodes-from-generating-spurious-log-messa.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch b/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
new file mode 100644
index 0000000..e6a2005
--- /dev/null
+++ b/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
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
