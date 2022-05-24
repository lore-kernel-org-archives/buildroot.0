Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15393C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A5F417B4;
	Tue, 24 May 2022 08:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8F6n7W_Mmwd; Tue, 24 May 2022 08:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422AE416C8;
	Tue, 24 May 2022 08:21:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA89B1BF989
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98EE640587
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgpoVKtEqIm0 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2A84400F8
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0417C86412; Tue, 24 May 2022 08:10:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 10:17:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1268dbe131460bb82a3d6a6cdb147f7e6ab9e0a9
X-Git-Newrev: 5430ae90e5556a577333cccd8bd1998971576d88
X-Patchwork-Hint: ignore
Message-Id: <20220524081009.0417C86412@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/udev: add the
 missing sgx group
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

commit: https://git.buildroot.net/buildroot/commit/?id=5430ae90e5556a577333cccd8bd1998971576d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

systemd-udevd needs this group:
  /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: udev users/groups go to udev virtual package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 798a4983eae7217281d84b76057fe61401e0f71d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
