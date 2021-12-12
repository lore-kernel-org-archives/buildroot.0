Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C78DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B454085A43;
	Sun, 12 Dec 2021 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXa8ed-UvyFw; Sun, 12 Dec 2021 15:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29208859D2;
	Sun, 12 Dec 2021 15:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 653981BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51CEB60E88
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzcVhjkP_SQZ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF6960A8E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 93F8983472; Sun, 12 Dec 2021 15:02:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:07:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b0e3da8a47ecfb455c7f4cfd4a98626a061349c
X-Git-Newrev: 042656017682f788644c46c0f7de23a832410eac
X-Patchwork-Hint: ignore
Message-Id: <20211212150245.93F8983472@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davinci-bootcount: add BR2_arm
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=042656017682f788644c46c0f7de23a832410eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like the other packages for AM335x platform.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/davinci-bootcount/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
index 58f83bb98c..e34adde570 100644
--- a/package/davinci-bootcount/Config.in
+++ b/package/davinci-bootcount/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	bool "davinci-bootcount"
+	depends on BR2_arm # only relevant for TI am335x
 	help
 	  U-Boot implements a boot count scheme that can be used to
 	  detect multiple failed attempts to boot Linux. On Davinci
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
