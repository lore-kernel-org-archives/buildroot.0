From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 14:20:20 +0100
Subject: [Buildroot] [git commit] busybox 1.22.0: add line edit patch
Message-ID: <20140115140318.8F1679C4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c75e5117b473bc9d0b8789295527e0156b769d84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../1.22.0/0005-busybox-1.22.0-lineedit.patch      |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

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
