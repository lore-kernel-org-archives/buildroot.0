Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA781C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C51D408C8;
	Tue, 19 Jul 2022 21:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C51D408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNHIszX3VQrG; Tue, 19 Jul 2022 21:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2568540650;
	Tue, 19 Jul 2022 21:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2568540650
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6851BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25EC140105
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25EC140105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hW--4SyTgmvX for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564D3400BB
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564D3400BB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD7CA83F08; Tue, 19 Jul 2022 21:30:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 23:43:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8f6aebdb2e163f681a43ab1175b7c7bdfd25d086
X-Git-Newrev: e924e351f67d045ff8983eb5a0bd83f84a51ffed
X-Patchwork-Hint: ignore
Message-Id: <20220719213032.BD7CA83F08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] docs/manual: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=e924e351f67d045ff8983eb5a0bd83f84a51ffed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
