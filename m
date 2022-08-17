Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E78C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF49F61060;
	Wed, 17 Aug 2022 06:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF49F61060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQiPlbxLL8RV; Wed, 17 Aug 2022 06:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FDEF61059;
	Wed, 17 Aug 2022 06:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FDEF61059
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A37361BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 033A182437
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033A182437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3OyA1T_EQYDJ for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:38:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D80081B7B
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D80081B7B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DFA7487942; Wed, 17 Aug 2022 06:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 07:58:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ca6058a44076c1b658c4b7603fcef2ef64a53a8
X-Git-Newrev: f7904e30e03bf109f0f9a89e0a231523b22246c8
X-Patchwork-Hint: ignore
Message-Id: <20220817062421.DFA7487942@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/runc: fix typo:
 OCP to OCI specification
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7904e30e03bf109f0f9a89e0a231523b22246c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The Config.in has a typo: "OCP specification"

It should be OCI for Open Container Initiative.

https://opencontainers.org/

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8382574d589ecab2a6c3877a9eadf486eb20fd10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 66203896a8..fe527b1954 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_RUNC
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  runC is a CLI tool for spawning and running containers
-	  according to the OCP specification.
+	  according to the OCI specification.
 
 	  https://github.com/opencontainers/runc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
