Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C3CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDDE040580;
	Sat, 12 Oct 2024 14:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecVL7RbCRAHb; Sat, 12 Oct 2024 14:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D836F405A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D836F405A7;
	Sat, 12 Oct 2024 14:03:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBAA71BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7D6940887
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlSA4_eD4Q4i for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C211F4084B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C211F4084B
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF01885C8F; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:56:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 33135684c030199800b89b7c40b2f2b77bf98b60
X-Git-Newrev: c54cbdb9016806a4d243c28fa49d0b74ab90be96
X-Patchwork-Hint: ignore
Message-Id: <20241012140333.AF01885C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/docker-run: fix
 symmetry typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c54cbdb9016806a4d243c28fa49d0b74ab90be96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6bcdbccb7f09cc7635038cc67d001bee802a15e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 79694474c1..92a77376e2 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -63,7 +63,7 @@ if [ "${GIT_DIR}" ]; then
 
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
