Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA9CCCFA19
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25D4381EB2;
	Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dMEZeg0rpQ7; Wed,  5 Nov 2025 22:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E5680E85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E5680E85;
	Wed,  5 Nov 2025 22:29:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C66B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C9B041050
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho2loYCeTxbm for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC59B408C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC59B408C9
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C04783D96; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5578468ae1f523f3e69cdc88c6f32b5a71090eb8
X-Git-Newrev: c519334742781ff8556a2c782518d935bd411208
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.9C04783D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: drop superfluous negative
 condition for default PATH
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c519334742781ff8556a2c782518d935bd411208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfig applies the default values in the order they are defined, and
stops at the first which condition is met. In this case, the two
conditions are mutually exclusive, so we can drop the second one. This
also makes it obvious there actually is a default value.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 1bc8b61f11..b24004c533 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -535,7 +535,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
-	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
 	  Sets the system's default PATH. It is being used in
 	  /etc/profile in the skeleton-init-common package and by some
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
