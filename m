Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A671D41992;
	Thu, 21 Apr 2022 19:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOa1dnK9jo1r; Thu, 21 Apr 2022 19:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CBC41987;
	Thu, 21 Apr 2022 19:12:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF1051BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB5EF41987
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeWg3YzTjieh for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:12:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EA4741978
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:12:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 883DE83FF5; Thu, 21 Apr 2022 19:02:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 21:11:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c435d4ec60432f96abbc58cd1daf190528fafaa3
X-Git-Newrev: 798a4983eae7217281d84b76057fe61401e0f71d
X-Patchwork-Hint: ignore
Message-Id: <20220421190206.883DE83FF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udev: add the missing sgx group
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

commit: https://git.buildroot.net/buildroot/commit/?id=798a4983eae7217281d84b76057fe61401e0f71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-udevd needs this group:
  /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: udev users/groups go to udev virtual package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/udev/udev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 05b35b21f0..ce93d98431 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -9,6 +9,7 @@ define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
+	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
