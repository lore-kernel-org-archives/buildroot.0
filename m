Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9FC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D5D41B9B;
	Sun, 11 Sep 2022 09:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D5D41B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kthkAUyuLlti; Sun, 11 Sep 2022 09:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587F4419D9;
	Sun, 11 Sep 2022 09:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587F4419D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 588681BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54C5A6FB4D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C5A6FB4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKxw6zX3ENkO for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A716FB41
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A716FB41
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B40A83625; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 22:37:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b4b19a9a0384713933b29a03138b4ce32dbfb60
X-Git-Newrev: 4fbce4ea35a0c86313f11200f9496878f8a45d73
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.9B40A83625@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.powerpc: VSX implies altivec
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fbce4ea35a0c86313f11200f9496878f8a45d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As spotted by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20220823212219.5066-1-fontaine.fabrice@gmail.com,
VSX is an extension to AltiVec:
https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.powerpc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index c48edd3bb4..9fa0be0d73 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -3,6 +3,7 @@ config BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_VSX
 	bool
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
@@ -135,11 +136,9 @@ config BR2_powerpc_power6
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
