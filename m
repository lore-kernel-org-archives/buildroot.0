From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:35 +0100
Subject: [Buildroot] [PATCH v5 18/19] infra-libtool: remove workaround for
	calls without `--tag'
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-19-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot included a work around for the case libtool was called with a
non-existant `--tag'. We was not able create reproduce this problem anymore. So,
we drop this workaround.

Please send a bug report if you encounter this problem again.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/libtool/buildroot-libtool-v1.5.patch   | 12 ------------
 support/libtool/buildroot-libtool-v2.2.patch   | 11 -----------
 support/libtool/buildroot-libtool-v2.4.4.patch | 11 -----------
 support/libtool/buildroot-libtool-v2.4.patch   | 11 -----------
 4 files changed, 45 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
index 3d78831..3664221 100644
--- a/support/libtool/buildroot-libtool-v1.5.patch
+++ b/support/libtool/buildroot-libtool-v1.5.patch
@@ -1,17 +1,5 @@
 --- a/ltmain.sh	2014-07-31 10:43:01.634568799 -0300
 +++ b/ltmain.sh	2014-07-31 10:44:14.032018999 -0300
-@@ -226,8 +226,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
 @@ -247,6 +248,11 @@
    arg="$1"
    shift
diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
index 6d9bac7..c7dc33c 100644
--- a/support/libtool/buildroot-libtool-v2.2.patch
+++ b/support/libtool/buildroot-libtool-v2.2.patch
@@ -1,16 +1,5 @@
 --- a/ltmain.sh	2010-06-09 15:08:53.000000000 +0200
 +++ b/ltmain.sh	2014-07-30 22:33:41.176710372 +0200
-@@ -1214,8 +1214,8 @@
- 	# was found and let the user know that the "--tag" command
- 	# line option must be used.
- 	if test -z "$tagname"; then
--	  func_echo "unable to infer tagged configuration"
--	  func_fatal_error "specify a tag with \`--tag'"
-+	  func_echo "defaulting to \`CC'"
-+	  func_echo "if this is not correct, specify a tag with \`--tag'"
- #	else
- #	  func_verbose "using $tagname tagged configuration"
- 	fi
 @@ -4429,7 +4429,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
index 2400aa3..ddd5675 100644
--- a/support/libtool/buildroot-libtool-v2.4.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.4.patch
@@ -5,17 +5,6 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
 --- a/ltmain.sh	2014-12-16 09:51:23.068441045 -0300
 +++ b/ltmain.sh	2014-12-16 09:57:10.509430339 -0300
-@@ -2687,8 +2687,8 @@
- 	# was found and let the user know that the "--tag" command
- 	# line option must be used.
- 	if test -z "$tagname"; then
--	  func_echo "unable to infer tagged configuration"
--	  func_fatal_error "specify a tag with '--tag'"
-+	  func_echo "defaulting to \`CC'"
-+	  func_echo "if this is not correct, specify a tag with \`--tag'"
- #	else
- #	  func_verbose "using $tagname tagged configuration"
- 	fi
 @@ -6550,7 +6550,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
index 7165bea..0008980 100644
--- a/support/libtool/buildroot-libtool-v2.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.patch
@@ -1,16 +1,5 @@
 --- a/ltmain.sh	2014-07-30 22:21:24.664684143 +0200
 +++ b/ltmain.sh	2014-07-30 22:23:02.440687625 +0200
-@@ -1417,8 +1417,8 @@
- 	# was found and let the user know that the "--tag" command
- 	# line option must be used.
- 	if test -z "$tagname"; then
--	  func_echo "unable to infer tagged configuration"
--	  func_fatal_error "specify a tag with \`--tag'"
-+	  func_echo "defaulting to \`CC'"
-+	  func_echo "if this is not correct, specify a tag with \`--tag'"
- #	else
- #	  func_verbose "using $tagname tagged configuration"
- 	fi
 @@ -5176,7 +5176,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
-- 
1.9.1
