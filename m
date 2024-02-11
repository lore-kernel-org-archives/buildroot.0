Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267F4C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A5DB6086F;
	Sun, 11 Feb 2024 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzAla_emxNKI; Sun, 11 Feb 2024 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732346086A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732346086A;
	Sun, 11 Feb 2024 19:35:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5E201BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C83404028D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuuHim9g4oGT for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1AB4011B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF1AB4011B
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DFF98775F; Sun, 11 Feb 2024 19:35:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 20:33:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9e02b8896fee9a5e657231c30182750ef206cf7
X-Git-Newrev: 2d381b8823b29534932b23ac800ef71eeb954ec7
X-Patchwork-Hint: ignore
Message-Id: <20240211193527.0DFF98775F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: drop remnant of
 PKG_PYTHON_DISTUTILS_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d381b8823b29534932b23ac800ef71eeb954ec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c10349bf67c1 (package:libselinux: replace PKG_PYTHON_DISTUTILS_ENV)
forgot to update a comment that refered to PKG_PYTHON_DISTUTILS_ENV.

Replace that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/libselinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 4a8d71050d..601038e46f 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -54,7 +54,7 @@ endif # python3
 
 # Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22. We
 # set CFLAGS, CPPFLAGS and LDFLAGS here because we want to win over the
-# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
+# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_SETUPTOOLS_ENV)
 # when the python binding is enabled.
 LIBSELINUX_MAKE_OPTS += \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
