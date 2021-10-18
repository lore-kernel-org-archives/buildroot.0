Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC8CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:51:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5226611EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5226611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D5C1817ED;
	Mon, 18 Oct 2021 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyqAF2LhJcfy; Mon, 18 Oct 2021 19:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C31E81CEF;
	Mon, 18 Oct 2021 19:51:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 072481BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8FEF401CA
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLsMnecrSYCI for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCAC9400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9600687712; Mon, 18 Oct 2021 19:48:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:51:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a88df3e8f3690b8f9f9da1d207dd6d578604126
X-Git-Newrev: abb13eef20aebd45aaf07e1481c5568808d35245
X-Patchwork-Hint: ignore
Message-Id: <20211018194827.9600687712@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3/Config.in.host: drop bogus
 select BR2_PACKAGE_HOST_BZIP2
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

commit: https://git.buildroot.net/buildroot/commit/?id=abb13eef20aebd45aaf07e1481c5568808d35245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option does not exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 65a8df0754..77d608bdc0 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -9,7 +9,6 @@ if BR2_PACKAGE_HOST_PYTHON3
 
 config BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	bool "bzip2"
-	select BR2_PACKAGE_HOST_BZIP2
 	help
 	  bz2 module for host Python3.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
