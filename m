Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C46C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA99041879;
	Sun, 18 Sep 2022 10:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA99041879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzKExuBYq5rv; Sun, 18 Sep 2022 10:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE6341827;
	Sun, 18 Sep 2022 10:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE6341827
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 038CD1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D236A843E7
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D236A843E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-HFGZvy0bAk for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B1498440F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1498440F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE7E84FBA; Sun, 18 Sep 2022 10:45:29 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:45:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc69061e7d36776532d4684e40aa4deadb6a8db0
X-Git-Newrev: 2e2eefd5ad86b85c312f263b59b9df2d4653aaa9
X-Patchwork-Hint: ignore
Message-Id: <20220918104529.EDE7E84FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/powerpc: Add Power9 CPU type
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
Content-Type: multipart/mixed; boundary="===============0438020735814184386=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0438020735814184386==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e2eefd5ad86b85c312f263b59b9df2d4653aaa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Power9 CPU was released by IBM in 2016. It is a 64-bit CPU
implementing ISA v3.0. It runs in big and little endian modes, and
supports VSX and AltiVec.

Power9 is supported as of GCC 6.1 and Binutils 2.26.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: remove 64-bit constraint]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.powerpc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 949995d037..765767eca2 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -139,6 +139,11 @@ config BR2_powerpc_power7
 config BR2_powerpc_power8
 	bool "power8"
 	select BR2_POWERPC_CPU_HAS_VSX
+config BR2_powerpc_power9
+	bool "power9"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 endchoice
 
 choice
@@ -216,6 +221,7 @@ config BR2_GCC_TARGET_CPU
 	default "power6"	if BR2_powerpc_power6
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
+	default "power9"	if BR2_powerpc_power9
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc

--===============0438020735814184386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0438020735814184386==--
