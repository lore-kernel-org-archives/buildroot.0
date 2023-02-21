Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B68C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9638144B;
	Tue, 21 Feb 2023 21:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9638144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5YMwluauKzu; Tue, 21 Feb 2023 21:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 727D181335;
	Tue, 21 Feb 2023 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 727D181335
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B63621BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E160403CA
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E160403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLqkTnYs8Qjv for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:59:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5BD4011F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5BD4011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9336866C0; Tue, 21 Feb 2023 21:59:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 22:59:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48d9042e5d2e0bc8bd0efc3a2516b156c4b89190
X-Git-Newrev: 7692d5beb2d9e4d0b463f0f26a177829e5bcc1ec
X-Patchwork-Hint: ignore
Message-Id: <20230221215944.C9336866C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/grub2: add details on
 grub.cfg location
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7692d5beb2d9e4d0b463f0f26a177829e5bcc1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 92b5dd501b..f05f33ccc7 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -27,6 +27,10 @@ config BR2_TARGET_GRUB2
 	  Amongst others, GRUB2 offers EFI support, which GRUB Legacy
 	  doesn't provide.
 
+	  The file boot/grub2/grub.cfg is used by default as the Grub
+	  configuration file. It can be overridden using a rootfs
+	  overlay or post-build script.
+
 	  For additional notes on using Grub 2 with Buildroot, see
 	  boot/grub2/readme.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
