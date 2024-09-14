Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B70C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF21441887;
	Sat, 14 Sep 2024 14:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTItAWPK_ok3; Sat, 14 Sep 2024 14:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B35842485
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B35842485;
	Sat, 14 Sep 2024 14:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E76B1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2C360776
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqepTEcrZhik for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E660560767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E660560767
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E33A682B75; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b185bfccbfcbf6804f52b374ee8be0ae4bd7f071
X-Git-Newrev: 79d062ab99fef3d7bb5982ac99d9cfcbe6d0cd83
X-Patchwork-Hint: ignore
Message-Id: <20240914140013.E33A682B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedevs/makedevs.c: fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=79d062ab99fef3d7bb5982ac99d9cfcbe6d0cd83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And replace Couldn't with 'Could not' for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
