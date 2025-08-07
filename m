Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F180CA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FAD60689;
	Thu,  7 Aug 2025 17:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W95nAZKVm6b0; Thu,  7 Aug 2025 17:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B0B960699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B0B960699;
	Thu,  7 Aug 2025 17:19:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C2A4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 212834045F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Qx5MFHK-_5z for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E37F40481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E37F40481
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C72785C8D; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:51 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 23cc7bde082973d019bbc1f5ecb92325165ba9d9
X-Git-Newrev: 50c07d88fd976e9c816cdde0bb1d75498015460b
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.7C72785C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 toolchain/toolchain-wrapper.c: fix indentation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50c07d88fd976e9c816cdde0bb1d75498015460b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

A recent commit introduced a few lines that were indented with spaces
rather than a tab. Rectify this.

Fixes: 00b30f887ac2 ("toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5e4cb7607b4949453f1497263ba06f35d5cd5b7f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 toolchain/toolchain-wrapper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 480a1ed5f1..0dc632d9cc 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -481,14 +481,14 @@ int main(int argc, char **argv)
 #endif
 	}
 
-        n_args = (cur - args);
-        if ((n_args + argc) > DEFAULT_MAX_ARGS) {
+	n_args = (cur - args);
+	if ((n_args + argc) > DEFAULT_MAX_ARGS) {
 		args = realloc(args, (n_args + argc) * sizeof(char *));
 		if (args == NULL) {
 			perror(__FILE__ ": realloc");
 			return 2;
 		}
-        }
+	}
 
 	/* append forward args and terminating NULL */
 	memcpy(&args[n_args], &argv[1], sizeof(char *) * argc);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
