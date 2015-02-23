From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:25:46 +0100
Subject: [Buildroot] [git commit] busybox: add 1.23.1 patch to fix modinfo
Message-ID: <20150223112551.C973780156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f583f2bf8f1b62c7fbb59851560d395e82d5db45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/0005-modinfo.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
