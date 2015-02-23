From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Feb 2015 08:19:18 -0300
Subject: [Buildroot] [PATCH] busybox: add 1.23.1 patch to fix modinfo
Message-ID: <1424690358-26541-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/0005-modinfo.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/busybox/0005-modinfo.patch

diff --git a/package/busybox/0005-modinfo.patch b/package/busybox/0005-modinfo.patch
new file mode 100644
index 0000000..0a221f7
--- /dev/null
+++ b/package/busybox/0005-modinfo.patch
@@ -0,0 +1,17 @@
+Fix broken modinfo.
+
+From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-modinfo.patch
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- busybox-1.23.1/modutils/modinfo.c
++++ busybox-1.23.1-modinfo/modutils/modinfo.c
+@@ -154,7 +154,7 @@ int modinfo_main(int argc UNUSED_PARAM,
+ 		if (colon == NULL)
+ 			continue;
+ 		*colon = '\0';
+-		filename2modname(tokens[0], name);
++		filename2modname(bb_basename(tokens[0]), name);
+ 		for (i = 0; argv[i]; i++) {
+ 			if (fnmatch(argv[i], name, 0) == 0) {
+ 				modinfo(tokens[0], uts.release, &env);
-- 
2.0.5
