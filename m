Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF7384D19;
	Fri, 17 Dec 2021 17:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1xviTSJavBO; Fri, 17 Dec 2021 17:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0529284CA4;
	Fri, 17 Dec 2021 17:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5D91BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C95642002
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtfCChmrZcJ6 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F034841FCB
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4EDC38251B; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:30:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9e545d98be9a523c7edf3d421c977bcfc9f006b
X-Git-Newrev: 44cd33baa2254dc98d756076f96ac1fbcbd0c289
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.4EDC38251B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: improve iputils options
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

commit: https://git.buildroot.net/buildroot/commit/?id=44cd33baa2254dc98d756076f96ac1fbcbd0c289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improve iputils options added by commit
db0c2a287970a8832b59f3cf9d81aa18aced2cec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c5bbb8881e..d240bda810 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,16 +147,17 @@ endif
 comment "Legacy options removed in 2022.02"
 
 config BR2_PACKAGE_IPUTILS_TFTPD
-	bool "tftpd"
+	bool "iputils tftpd option removed"
 	select BR2_LEGACY
 	help
-	  tftpd has been removed from upstream.
+	  tftpd has been removed from iputils since version 20211215.
 
 config BR2_PACKAGE_IPUTILS_TRACEROUTE6
-	bool "traceroute6"
+	bool "iputils traceroute6 option removed"
 	select BR2_LEGACY
 	help
-	  traceroute6 has been removed from upstream.
+	  traceroute6 has been removed from iputils since version
+	  20211215.
 
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 	bool "libmediaart 'none' backend removed"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
