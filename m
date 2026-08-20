Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020E4C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F45181755;
	Fri, 21 Aug 2026 15:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I54fUQvJRhAv; Fri, 21 Aug 2026 15:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325094;
	bh=3IQfgr9Jnnb8nTCMuLGjlTowlo/7q7LvtziiYI/ZOWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oEjfpnVRQuDXSrK8FuTIG7/Oc5FGRujJvFqindWiFiDunKMeXMWjvMBZ2uOz06fPx
	 dryEd/mQ/ep7Jy+YZdQkXoV6aDJ/TqxS8p87d/fdnh+g7jNUwvKD9d9JdQ0szFwy/W
	 EeAH5bjTCaHAL3bVwZe6NTFy77woFDmxDGpkvAS5h0wHcOKHzf+n6yWelpJ1YD5TJB
	 F3iiBzl0vxKuRyOng8aclJHS8UyZE65d7T1D+YtD2VrlsDFJ3O5ar5na3skBNWPn/m
	 FiVY1ULTi95y1/yKIy6n4bISQGebPt1N+n9krNS4x08Q48Ey0iyrz8eHtES+d3Q4QM
	 hwVKFpYBjTtZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E4D7816FE;
	Fri, 21 Aug 2026 15:11:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8B3429B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF6FA400AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPJw58UfAb1m for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6BF400DC
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D83E8E13D; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 11:43:43 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 34b36081608779221954590177a9fb2f07c8c59a
X-Git-Newrev: 43d970f062dc98215046dd0ab864d0dfaa954923
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.5D83E8E13D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dracut: bump
 version to 111
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8461752611501706797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8461752611501706797==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43d970f062dc98215046dd0ab864d0dfaa954923
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/dracut-ng/dracut/blob/111/NEWS.md

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c6fa81a18c8c78515e621c26122fa227e1556022)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ns-prevent-find_binary-from-dropping-last.patch | 45 ----------------------
 package/dracut/dracut.hash                         |  2 +-
 package/dracut/dracut.mk                           |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch b/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch
deleted file mode 100644
index ad312d0b85..0000000000
--- a/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 94c4274e32467235fb580a27ea182169f253ca5f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mat=C3=A9o=20Pourrier?= <mateo.pourrier@smile.fr>
-Date: Tue, 28 Apr 2026 17:23:23 +0200
-Subject: [PATCH] fix(functions): prevent find_binary from dropping last PATH
- element
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When `read` encounters EOF before the delimiter, it returns a non-zero
-exit status, causing the while loop to terminate immediately. As a result,
-if the PATH string doesn't end with a colon, the very last directory in
-PATH is ignored by find_binary().
-
-This caused regressions on split-usr architectures where critical
-binaries reside exclusively in /bin, and /bin happens to be
-appended at the very end of the PATH by dracut.sh.
-
-Appending a virtual colon to the Here-String ensures the loop processes
-all directories correctly.
-
-Fixes dracut-ng issue #1467 : https://github.com/dracut-ng/dracut-ng/issues/1467
-
-Upstream: https://github.com/dracut-ng/dracut-ng/pull/2416
-Signed-off-by: Matéo Pourrier <mateo.pourrier@smile.fr>
----
- dracut-functions.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dracut-functions.sh b/dracut-functions.sh
-index f430a28e..5046f45e 100755
---- a/dracut-functions.sh
-+++ b/dracut-functions.sh
-@@ -94,7 +94,7 @@ find_binary() {
-             printf "%s\n" "${_path}"
-             return 0
-         fi
--    done <<< "$PATH"
-+    done <<< "${PATH}:"
- 
-     [[ -n ${dracutsysrootdir-} ]] && return 1
-     type -P "${1##*/}"
--- 
-2.34.1
-
diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 3288ed6ad4..1b5b3dce55 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d357853f8cf2371d89a8ebcbbb1fd2c1c85a79d8866925fd7385eaeb20a27dc  dracut-110.tar.gz
+sha256  ca949190692e91611ef16ea3642c0f764f63948860f3f742524310728c991493  dracut-111.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index b40f618fe8..3a1c1567e8 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 110
+DRACUT_VERSION = 111
 DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING

--===============8461752611501706797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8461752611501706797==--
