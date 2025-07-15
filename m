Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E53DC83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA3EA41160;
	Thu, 17 Jul 2025 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYlPyhZmdCaC; Thu, 17 Jul 2025 20:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E8041130
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E8041130;
	Thu, 17 Jul 2025 20:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5386A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAAE683B29
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVPRZaqJiVF0 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED28F83AE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED28F83AE2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A9086688; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:50:21 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4cce71330e9496ba0c2c2b6e5a7c14e89db45525
X-Git-Newrev: 2a67ac2fc69b878c7b33aad8384b1ac50fbd6541
X-Patchwork-Hint: ignore
Message-Id: <20250717203255.E9A9086688@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 toolchain/toolchain-wrapper.c: correct CCACHE_BASEDIR comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a67ac2fc69b878c7b33aad8384b1ac50fbd6541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Commit 1e97b2787331 ("ccache: support changing the output directory") added
the CCACHE_BASEDIR logic, but added a comment (presumably from cut'n'paste)
about compilercheck instead, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f66e4c2568c5867b3f92f2c78609fafa0252194e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 toolchain/toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e644c1e7bb..698d36b54f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -520,7 +520,7 @@ int main(int argc, char **argv)
 		}
 #endif
 #ifdef BR_CCACHE_BASEDIR
-		/* Allow compilercheck to be overridden through the environment */
+		/* Allow basedir to be overridden through the environment */
 		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
 			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
 			return 3;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
