Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45589C83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159EB41937;
	Mon,  7 Jul 2025 20:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WD7-fezFH2a; Mon,  7 Jul 2025 20:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3159140C64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3159140C64;
	Mon,  7 Jul 2025 20:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1E712E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A6281146
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLe-ZbVBYc4T for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B514281115
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B514281115
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A14F486138; Mon,  7 Jul 2025 20:33:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 22:31:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4819ab45f48bce72c3249d3efa0f87498558932
X-Git-Newrev: f66e4c2568c5867b3f92f2c78609fafa0252194e
X-Patchwork-Hint: ignore
Message-Id: <20250707203312.A14F486138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper.c: correct
 CCACHE_BASEDIR comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=f66e4c2568c5867b3f92f2c78609fafa0252194e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1e97b2787331 ("ccache: support changing the output directory") added
the CCACHE_BASEDIR logic, but added a comment (presumably from cut'n'paste)
about compilercheck instead, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 4dde0362b6..703d2fc042 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -526,7 +526,7 @@ int main(int argc, char **argv)
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
