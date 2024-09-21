Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A8DCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBDC54089D;
	Sat, 21 Sep 2024 18:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zt1y2_rcEupb; Sat, 21 Sep 2024 18:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78B9407DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78B9407DE;
	Sat, 21 Sep 2024 18:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 166791BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05BF0402CE
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OyCdgZBgSt8 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED0B3400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0B3400E4
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D67D483D95; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:18:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3e5bcec658b8b20740c30fcd18ed3eac5ee1a3e
X-Git-Newrev: 6bcdbccb7f09cc7635038cc67d001bee802a15e3
X-Patchwork-Hint: ignore
Message-Id: <20240921184811.D67D483D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: fix symmetry typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bcdbccb7f09cc7635038cc67d001bee802a15e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..849df66d54 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -78,7 +78,7 @@ if [ "${GIT_DIR}" ]; then
 
     # 'repo' stores .git/objects separately.
     if [ -L "${GIT_DIR}/objects" ]; then
-        # GITDIR is already an absolute path, but for symetry
+        # GITDIR is already an absolute path, but for symmetry
         # with the above, keep the same cd+readlink construct.
         OBJECTS_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}/objects")"
         mountpoints+=( "${OBJECTS_DIR}" )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
