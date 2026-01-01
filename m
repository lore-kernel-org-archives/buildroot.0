Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BEED615
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25AF440794;
	Thu,  1 Jan 2026 16:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRQ-isVh5IMM; Thu,  1 Jan 2026 16:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE59407D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285168;
	bh=E0xDf4OhQCvbSJkSvYIV0b7SwE+58Ni8TPtYgcLwOqQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pE3kFQMiTqfFo9yhUJgheIF6Jy7bt0qRFvbSCED/JjX6f+uL/kknjvtBOkPNOEnNC
	 W+OrwnHG1oGuu+hhz6a4LJRija5oXRR043AhAA+WFxSiZgxeKrAqP3irJSboOWd0oC
	 PlCs/1jQq6U4cV/lBmH/K0bR5Bgmqdj7zhR+Qjc8u0y6ldDNUPFHOfFB6Knn7LOExI
	 M9kyr5wpXKP4siDNw1zLQHrN/1xVSdMWommJF4Q/9stL4mPVdWopeFLjU8BdfYWWve
	 o3BQu4iSAvAbfmuOcOMitIkpFx6AAuf4E4faKPnugep5Iew/vtLWND84qjpGXEKxZ7
	 3Wa7J5ITsTnOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE59407D4;
	Thu,  1 Jan 2026 16:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46CE9351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4433680B7F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTe8fs9gyidO for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DC680B55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53DC680B55
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F2C287E2D; Thu,  1 Jan 2026 16:32:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 17:31:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73254947809797a3c2c0e421ead477fbe833d807
X-Git-Newrev: 340858ae4e005f7f2ad5312c16fb75492d010499
X-Patchwork-Hint: ignore
Message-Id: <20260101163246.4F2C287E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: fix license
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=340858ae4e005f7f2ad5312c16fb75492d010499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is actually LGPL-2.1+.

Fixes: 006aab8d64d2179d77df9a696b3fd8636f541640 ("package/libplacebo: add libplacebo package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libplacebo/libplacebo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index 67bf0f00fb..ee5a4cc2c2 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -8,7 +8,7 @@ LIBPLACEBO_VERSION = v7.351.0
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
-LIBPLACEBO_LICENSE = LGPL-2.1
+LIBPLACEBO_LICENSE = LGPL-2.1+
 LIBPLACEBO_LICENSE_FILES = LICENSE
 LIBPLACEBO_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
