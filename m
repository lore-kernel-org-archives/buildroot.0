Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5336BC78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E48742D5F;
	Fri, 20 Sep 2024 10:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Mkotp0Q-BaC; Fri, 20 Sep 2024 10:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C262C42D6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C262C42D6F;
	Fri, 20 Sep 2024 10:36:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8E81BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B1E84C91
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6D53xJe_jqyY for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C802384C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C802384C41
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4C9084117; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:40 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: ba222b59766de993c4329de82ac4414e5bd32b8b
X-Git-Newrev: 511b426a75496820665a345cefa5fea700cd8b58
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.C4C9084117@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 package/makedevs/makedevs.c: fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=511b426a75496820665a345cefa5fea700cd8b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

And replace Couldn't with 'Could not' for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 79d062ab99fef3d7bb5982ac99d9cfcbe6d0cd83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index a5c9c7d64d..be76155ab6 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -165,7 +165,7 @@ int bb_make_directory (char *path, long mode, int flags)
 			}
 			/* Since the directory exists, don't attempt to change
 			 * permissions if it was the full target.  Note that
-			 * this is not an error conditon. */
+			 * this is not an error condition. */
 			if (!c) {
 				umask(mask);
 				return 0;
@@ -480,11 +480,11 @@ int main(int argc, char **argv)
 	}
 
 	if (optind >= argc || (rootdir=argv[optind])==NULL) {
-		bb_error_msg_and_die("root directory not speficied");
+		bb_error_msg_and_die("root directory not specified");
 	}
 
 	if (chdir(rootdir) != 0) {
-		bb_perror_msg_and_die("Couldnt chdir to %s", rootdir);
+		bb_perror_msg_and_die("Could not chdir to %s", rootdir);
 	}
 
 	umask(0);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
