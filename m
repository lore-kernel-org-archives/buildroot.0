Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D3AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 08:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7514560EBD;
	Sun,  8 May 2022 08:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-1zHWuTc6zw; Sun,  8 May 2022 08:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8910D60EAE;
	Sun,  8 May 2022 08:24:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B59001BF2CA
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4771827B5
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9kProUVYgbS for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 08:24:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06D7E827A9
 for <buildroot@buildroot.org>; Sun,  8 May 2022 08:24:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6D85384D1E; Sun,  8 May 2022 08:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 May 2022 10:24:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 688a79620513c9781c4151c23686bcc7a04230c4
X-Git-Newrev: 21ab3e720c0acae2332454cf0ebdb992ac65b644
X-Patchwork-Hint: ignore
Message-Id: <20220508081356.6D85384D1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: Added missing dependency
 on threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=21ab3e720c0acae2332454cf0ebdb992ac65b644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpulimit requires a toolchain supporting threads, see the following
build failure reports:

http://autobuild.buildroot.net/results/55e1af96f01a0786b4a95665736453db72be9c13
http://autobuild.buildroot.net/results/2e50face429553a6431ba5e8cda9527e5c876699

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Fixes: 9e8e80d1e335 ("package: Add cpulimit")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpulimit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index 6ff24f8381..7cab152fc0 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
