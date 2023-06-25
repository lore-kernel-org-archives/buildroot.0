Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB00C001B0
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBDC81C6F;
	Sun, 25 Jun 2023 19:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EBDC81C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_n4Tu4l54wo; Sun, 25 Jun 2023 19:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DF581C46;
	Sun, 25 Jun 2023 19:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DF581C46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3F51BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466C0413D0
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466C0413D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwDlfrBS8g7G for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59756413A3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59756413A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A3B851E8; Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:42:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fa8914bf1dad02e7110ba94a51796511151e7a4
X-Git-Newrev: fd6b33426962727b97e2ea2a63bfb7a018adcfaf
X-Patchwork-Hint: ignore
Message-Id: <20230625194428.43A3B851E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgroup: add newline at end of
 file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd6b33426962727b97e2ea2a63bfb7a018adcfaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 the newline at the
end got accidentally removed. Re-add it.

Reported by check-package.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libcgroup/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index 546b5f3560..9326b967ed 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 endif
 
 comment "libcgroup needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
\ No newline at end of file
+	depends on !BR2_INSTALL_LIBSTDCPP
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
