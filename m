Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25107C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27E461124;
	Tue, 22 Jul 2025 17:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKb1_mOcuPG8; Tue, 22 Jul 2025 17:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B74C60D96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B74C60D96;
	Tue, 22 Jul 2025 17:09:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D8C6CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F8560F6F
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-37OH1HaFSy for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CEA060ACC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEA060ACC
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68CEC86995; Tue, 22 Jul 2025 17:09:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 19:09:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26e69feb77eb63c615b830a9e951110c7486b89d
X-Git-Newrev: 5e4cb7607b4949453f1497263ba06f35d5cd5b7f
X-Patchwork-Hint: ignore
Message-Id: <20250722170954.68CEC86995@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper.c: fix
 indentation
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e4cb7607b4949453f1497263ba06f35d5cd5b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A recent commit introduced a few lines that were indented with spaces
rather than a tab. Rectify this.

Fixes: 00b30f887ac2 ("toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-wrapper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 9fb96a276a..5b306190bb 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -487,14 +487,14 @@ int main(int argc, char **argv)
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
