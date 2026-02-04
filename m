Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6FDE83EF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E120F816D9;
	Wed,  4 Feb 2026 09:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccUswmatlEQ8; Wed,  4 Feb 2026 09:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04857816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196298;
	bh=MuKkqqR5bWudoZE5uuK0C9PuzdT6nwHlsQWZGLlkK1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jXpTdWCEjNVfXuGEhdzbsJJSTzuovBzPUKm/GsC9B5eu9RXA9T3tYSPjPRXQA/5sV
	 Lc1yfj+y9a1d/5DWZaY70p3XdanaRIpMyB+GFr3zwfMrN9Z9vzT5VP9IMLvmBgy1s0
	 CGvcMoL6R5ok++AmkvERKbtB3rBWoz/xKNHSIvZh9tGxrppHCqwvMIITZ0sw+ve9ta
	 AwYL9B3xjLU8gxsWO7Q6Xyo/NIJCltMEkd+tYmAWlsX+llVgIFOHadOKJOjYQPqYkJ
	 vkqHXIA1IDlWktVGUPxbLRi1IX7LNftEELg2/SLhIDCprQtGFEFf1NObJoJDnoUhl+
	 M4trQlleKPNXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04857816DF;
	Wed,  4 Feb 2026 09:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3744FF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19801816DF
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vZHi41A8lmF for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4882D816D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4882D816D9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E4C5867CB; Wed,  4 Feb 2026 09:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:11:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 574aa2cfee19c7dfe505a303dd45b17a966bbdaa
X-Git-Newrev: 22ec30b5149bb9966c6d2b67b90ad80f4ca175e8
X-Patchwork-Hint: ignore
Message-Id: <20260204091135.2E4C5867CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xinetd: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22ec30b5149bb9966c6d2b67b90ad80f4ca175e8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Package xinetd requires libtirpc rpcdb option enabled since the bump of
libtirpc to version 1.3.7 with buildroot commit
3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.net/results/4db/4db625d395f38636b67adbbf6286c6c9da155f62/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xinetd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index f509905f1c..9637016f7e 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XINETD
 	bool "xinetd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no ecvt/fcvt
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  xinetd is a secure replacement for inetd. It was originally
 	  written by panos@cs.colorado.edu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
