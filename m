Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C6BD41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57626404FE;
	Wed, 13 Nov 2024 09:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjsOIK5q6aAT; Wed, 13 Nov 2024 09:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048F5403B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 048F5403B7;
	Wed, 13 Nov 2024 09:55:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EE121DC4
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D8A6000A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQjF39c83RKc for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B8660837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23B8660837
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D9286283; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 22:37:06 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 817b3b756282c00c05df7f910fd40442ce3c5ed1
X-Git-Newrev: 97b722418cfe253f5989daa11867a11bfecba791
X-Patchwork-Hint: ignore
Message-Id: <20241113095505.20D9286283@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/heimdal: Fix
 build with autoconf-2.72
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=97b722418cfe253f5989daa11867a11bfecba791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes:
http://autobuild.buildroot.net/results/175/175fb65f0151866cd2d83c91c23b453d8c4489f7/
https://bugs.busybox.net/show_bug.cgi?id=15991

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a79d0b467f60e7d198c25549166a1383bb978392)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...largefile.m4-Fix-build-with-autoconf-2.72.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
new file mode 100644
index 0000000000..5b36c5a784
--- /dev/null
+++ b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
@@ -0,0 +1,27 @@
+From 1b57b62d82a478c1fade350f0fb1d57031a8734e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Feb 2024 09:33:48 +0100
+Subject: [PATCH] cf/largefile.m4: Fix build with autoconf-2.72
+
+Fixes https://github.com/heimdal/heimdal/issues/1201
+
+Upstream: https://github.com/heimdal/heimdal/commit/1b57b62d82a478c1fade350f0fb1d57031a8734e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cf/largefile.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cf/largefile.m4 b/cf/largefile.m4
+index 5c54897be4..cdbbc55431 100644
+--- a/cf/largefile.m4
++++ b/cf/largefile.m4
+@@ -10,7 +10,7 @@ dnl with generated code, such as lex
+ if test "$enable_largefile" != no -a "$ac_cv_sys_large_files" != no; then
+ 	CPPFLAGS="$CPPFLAGS -D_LARGE_FILES=$ac_cv_sys_large_files"
+ fi
+-if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no; then
++if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no && test -n "$ac_cv_sys_file_offset_bits"; then
+ 	CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
+ fi
+ ])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
