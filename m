Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E60C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5909F40562;
	Tue, 19 Jul 2022 21:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5909F40562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJhUTvtVIOHB; Tue, 19 Jul 2022 21:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62A8240105;
	Tue, 19 Jul 2022 21:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A8240105
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 136921BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F015860EFA
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F015860EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hheByn--cAvo for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C7360BD5
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C7360BD5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B439F83F1D; Tue, 19 Jul 2022 21:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 23:43:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 24f15feb161ec3e6104ded806bb6ca4a41367612
X-Git-Newrev: 1666013009704961480ee0c2d9c4729a184a5faf
X-Patchwork-Hint: ignore
Message-Id: <20220719213038.B439F83F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] docs/manual: fix
 configurations listing command
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

commit: https://git.buildroot.net/buildroot/commit/?id=1666013009704961480ee0c2d9c4729a184a5faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5c5f30cbc78661025f2d95a98ddbe68d49e54056)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-configuration.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index ae6cebe6c4..fa8f454674 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -15,8 +15,8 @@ make with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.
 
 The recommended place to store this defconfig is
 +configs/<boardname>_defconfig+. If you follow this recommendation, the
-configuration will be listed in +make help+ and can be set again by
-running +make <boardname>_defconfig+.
+configuration will be listed in +make list-defconfigs+ and can be set
+again by running +make <boardname>_defconfig+.
 
 Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
