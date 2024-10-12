Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67F2CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83545402D0;
	Sat, 12 Oct 2024 14:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjEJknZ7OkUL; Sat, 12 Oct 2024 14:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F35C3417DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F35C3417DE;
	Sat, 12 Oct 2024 14:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31E2F1BF8B4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF7154084B
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3rAG8N3hMrf for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29B040858
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E29B040858
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDFF085C61; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:05 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: ec2b0f56d009c22d68749cc0f16824344189e4e4
X-Git-Newrev: 499d0a5bf1c4672841ea7d51d97f9d0652dc2b5b
X-Patchwork-Hint: ignore
Message-Id: <20241012140529.DDFF085C61@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] utils/docker-run: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=499d0a5bf1c4672841ea7d51d97f9d0652dc2b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6bcdbccb7f09cc7635038cc67d001bee802a15e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
