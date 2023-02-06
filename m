Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAD4C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C6A4F07E;
	Tue, 21 Feb 2023 00:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C6A4F07E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTDL5-ve1vhp; Tue, 21 Feb 2023 00:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CFA14F14B;
	Tue, 21 Feb 2023 00:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CFA14F14B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E51021BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFC3415A4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAFC3415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7NwSgfgfFHj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 149974179B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149974179B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0541B86495; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 16:30:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 579b65b55234d298570e5191efb509905933eef5
X-Git-Newrev: 01ce9e95eb4f7fb731b20f3973edd582d4640084
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.0541B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: drop
 reference to legacy BR2_PACKAGE_QEMU_CUSTOM_TARGETS
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

commit: https://git.buildroot.net/buildroot/commit/?id=01ce9e95eb4f7fb731b20f3973edd582d4640084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 44be514b21fd9409 (package/qemu: refactor target emulator selection)
dropped BR2_PACKAGE_QEMU_CUSTOM_TARGETS, but didn't remove the reference
from libvirt.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index f0687cd5db..3f4fc70e62 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -73,7 +73,7 @@ config BR2_PACKAGE_LIBVIRT_QEMU
 	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess
 	select BR2_PACKAGE_LIBSECCOMP
 	select BR2_PACKAGE_QEMU
-	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+	select BR2_PACKAGE_QEMU_SYSTEM
 	select BR2_PACKAGE_YAJL
 	help
 	  QEMU/KVM support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
