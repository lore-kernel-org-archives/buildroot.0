Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387AFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:08:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6F5610A8
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C6F5610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D694760A51;
	Thu,  5 Aug 2021 10:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTukZwSumXS1; Thu,  5 Aug 2021 10:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3428860A36;
	Thu,  5 Aug 2021 10:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C31B81BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9898783478
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzDzQvp6mE7R for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 012398376B
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A78868B57F; Thu,  5 Aug 2021 10:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 11:50:45 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6da85ad2e8c4257975b7d9485a2bb9d2407c039f
X-Git-Newrev: 8e5db811fcf724a0e1ef31dfc6f39e97cf827095
X-Patchwork-Hint: ignore
Message-Id: <20210805100700.A78868B57F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/netsnmp: fix
 legal info
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8e5db811fcf724a0e1ef31dfc6f39e97cf827095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit 87bef179222e wrongly removed hash of COPYING

Fixes: 87bef179222ee8a0b0f39c8f96113a4ecf813085

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dfa4a4dd2a9495ac7aabefb7c45f2c74bf1eab2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e3adb28c6d..9d196c8bee 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -2,3 +2,6 @@
 # https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
 # using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
 sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
+
+# Hash for license file
+sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
