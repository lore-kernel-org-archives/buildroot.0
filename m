From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 16 May 2012 13:10:28 +0100
Subject: [Buildroot] [PATCH 1/2] vala: do not append a -dirty suffix to the
	valac version number
Message-ID: <1337170229-29684-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/vala/vala-fix-dirty-version-suffix.patch |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/vala/vala-fix-dirty-version-suffix.patch

diff --git a/package/vala/vala-fix-dirty-version-suffix.patch b/package/vala/vala-fix-dirty-version-suffix.patch
new file mode 100644
index 0000000..4b0044d
--- /dev/null
+++ b/package/vala/vala-fix-dirty-version-suffix.patch
@@ -0,0 +1,15 @@
+Do not append a -dirty suffix to the valac version number. The presence of
+the suffix can caused problems for packages (e.g. midori) which check the
+valac version number during configuration.
+
+diff -Nur a/build-aux/git-version-gen b/build-aux/git-version-gen
+--- a/build-aux/git-version-gen	2010-08-15 12:49:03.000000000 +0100
++++ b/build-aux/git-version-gen	2012-05-14 10:17:19.977204570 +0100
+@@ -135,7 +135,6 @@
+     *) # Append the suffix only if there isn't one already.
+ 	case $v in
+ 	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
+ 	esac ;;
+ esac
+ 
-- 
1.7.9.5
