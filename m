Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9A7C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC5B819F3;
	Sun, 10 Mar 2024 22:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1B_B-OqcQw1C; Sun, 10 Mar 2024 22:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9546C819B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9546C819B8;
	Sun, 10 Mar 2024 22:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2276F1BF85D
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019F5405DD
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72jKNQ9MVwEp for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF87405CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF87405CF
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 162488822A; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 23:16:06 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1f674415ca663eb47b4da034ddf230d4f7e0754f
X-Git-Newrev: 1c603c41178109a7f1571353ec8c030595097b5d
X-Patchwork-Hint: ignore
Message-Id: <20240310221828.162488822A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libselinux: drop
 remnant of PKG_PYTHON_DISTUTILS_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c603c41178109a7f1571353ec8c030595097b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit c10349bf67c1 (package:libselinux: replace PKG_PYTHON_DISTUTILS_ENV)
forgot to update a comment that refered to PKG_PYTHON_DISTUTILS_ENV.

Replace that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2d381b8823b29534932b23ac800ef71eeb954ec7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
