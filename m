Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB6AC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8789F40755;
	Tue, 21 May 2024 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eADC-ye2thHf; Tue, 21 May 2024 20:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D7E94072E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7E94072E;
	Tue, 21 May 2024 20:19:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B50F01BF27C
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE05F40709
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ps62-4HV5WR for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 20:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F320406D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F320406D7
 for <buildroot@buildroot.org>; Tue, 21 May 2024 20:19:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795FC874D4; Tue, 21 May 2024 20:19:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 22:11:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5c7927f6986a53a0bb329785058b03f40e640d03
X-Git-Newrev: e26c33a4b9d85deaceb6de22989a21320aef064c
X-Patchwork-Hint: ignore
Message-Id: <20240521201906.795FC874D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libglib2: update
 atomic patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e26c33a4b9d85deaceb6de22989a21320aef064c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 929bffbf4bf8fcb91bda446777f907f32c782656 forgot to update patch
number
Moreover, replace it with a new iteration to follow upstream request [1]
and avoid the following build host build failure with br-autobuild-1:

/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.2.0: No such file or directory

Fixes: 929bffbf4bf8fcb91bda446777f907f32c782656
 - http://autobuild.buildroot.org/results/a12b9c4436594818f4ce128595b429adf7d90e31

[1]: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3606

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: mention upstream commit now it's merged]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f5257789d6f088f1e2a0a8b00e1d21d32d2497ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-link-with-latomic-when-needed.patch       | 45 -------------------
 .../0006-link-with-latomic-when-needed.patch       | 52 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 45 deletions(-)

diff --git a/package/libglib2/0005-link-with-latomic-when-needed.patch b/package/libglib2/0005-link-with-latomic-when-needed.patch
deleted file mode 100644
index 275d86032b..0000000000
--- a/package/libglib2/0005-link-with-latomic-when-needed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d1814dbd3a88c95a43d4c9805bb4a523cf62d97b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Sep 2023 20:42:00 +0200
-Subject: [PATCH] link with -latomic when needed
-
-Some architecture such as sparc and some flavors of arm needs -latomic
-to avoid the following build failure:
-
-gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3586
----
- glib/meson.build | 1 +
- meson.build      | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/glib/meson.build b/glib/meson.build
-index c26a35e42..7a761306b 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -426,6 +426,7 @@ libglib = library('glib-2.0',
-     pcre2,
-     platform_deps,
-     thread_dep,
-+    atomic_dep
-   ],
-   c_args : glib_c_args,
-   objc_args : glib_c_args,
-diff --git a/meson.build b/meson.build
-index 25ae10fc2..5ae84b3b3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2130,6 +2130,8 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
- 
- libz_dep = dependency('zlib')
- 
-+atomic_dep = cc.find_library('atomic', required: false)
-+
- # First check in libc, fallback to libintl, and as last chance build
- # proxy-libintl subproject.
- # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
--- 
-2.40.1
-
diff --git a/package/libglib2/0006-link-with-latomic-when-needed.patch b/package/libglib2/0006-link-with-latomic-when-needed.patch
new file mode 100644
index 0000000000..3b5a071010
--- /dev/null
+++ b/package/libglib2/0006-link-with-latomic-when-needed.patch
@@ -0,0 +1,52 @@
+From 4e6dc4dee0e1c6407113597180d9616b4f275f94 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 May 2024 14:02:17 +0200
+Subject: [PATCH] link with -latomic when needed
+
+Some architecture such as sparc and some flavors of arm needs -latomic
+to avoid the following build failure:
+
+gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/4e6dc4dee0e1c6407113597180d9616b4f275f94
+---
+ glib/meson.build | 1 +
+ meson.build      | 9 +++++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index 24cbb664d4..b2dd569e1e 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -419,6 +419,7 @@ libglib = library('glib-2.0',
+   include_directories : configinc,
+   link_with: [charset_lib, gnulib_lib],
+   dependencies : [
++    atomic_dep,
+     gnulib_libm_dependency,
+     libiconv,
+     libintl_deps,
+diff --git a/meson.build b/meson.build
+index 46c5aa200a..8b42940558 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2233,6 +2233,15 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
+
+ libz_dep = dependency('zlib')
+
++libatomic_test_code = '''
++  int main (int argc, char ** argv) {
++    return 0;
++  }'''
++atomic_dep = []
++if cc.links(libatomic_test_code, args : '-latomic', name : 'check for -latomic')
++  atomic_dep = cc.find_library('atomic')
++endif
++
+ # First check in libc, fallback to libintl, and as last chance build
+ # proxy-libintl subproject.
+ # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
+--
+2.44.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
