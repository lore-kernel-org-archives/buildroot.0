From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 10:16:14 -0300
Subject: [Buildroot] [PATCH] busybox 1.22.0: add line edit patch
Message-ID: <1389791774-16354-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch

diff --git a/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch b/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch
new file mode 100644
index 0000000..e414314
--- /dev/null
+++ b/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch
@@ -0,0 +1,12 @@
+--- busybox-1.22.0/libbb/lineedit.c
++++ busybox-1.22.0-lineedit/libbb/lineedit.c
+@@ -1255,7 +1255,9 @@ line_input_t* FAST_FUNC new_line_input_t
+ {
+ 	line_input_t *n = xzalloc(sizeof(*n));
+ 	n->flags = flags;
++#if MAX_HISTORY > 0
+ 	n->max_history = MAX_HISTORY;
++#endif
+ 	return n;
+ }
+ 
-- 
1.8.3.2
