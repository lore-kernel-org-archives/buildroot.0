Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D999D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3769140AE9;
	Thu, 11 Dec 2025 19:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQ2h_Lq3n1bg; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C69240902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481270;
	bh=McA4GuG8YgTnK2NIJPzMqcLNOuW4XSPkrGt0K7ZkFPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JSxUjJL7z8smbneClIe8ndDDwh8glvqjPyf/rSfRoYbni2PPYsyXilf4U+p9vkGAO
	 b4L6XII1fxNuQnyTui3lksena6wj3YFL/hAO4ib9es16POgwKUMRIp0HJNbhvHJ9U0
	 y2ChTYoy4LlAtALCuRqxB8RTMn3M/UTYf6uTVWvF16V2l7jMz52bsZQyu3LxAB1nwX
	 OQnRizjxc3N0CY7jhTOsUaz+XFui2Giu0u1UIdIl4E6Tv4AZYZN2HqvFH5SwbtT1e1
	 yDEuNOVPMjK0Ac5ORjucLSeuFMe50JUdcjHfXF4RINFZabf48OeRklxOhyMYWrzWe0
	 bJJNpow1N27pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C69240902;
	Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4ACD2E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A801E81604
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ_xPpGv5E4x for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DFF80B81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0DFF80B81
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C398186B46; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eadb711a37c1a8c0cf5aa461f803f7706eb49d18
X-Git-Newrev: 3afaa164ff2bef4477bced31b95feee0396b514c
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.C398186B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: only
 supports ARC little-endian since glibc 2.41
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3afaa164ff2bef4477bced31b95feee0396b514c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since upstream commit
https://sourceware.org/git/?p=glibc.git;a=commit;h=4ff55d08df0e6f11cbd217f4dca4532bd7d9330d,
glibc no longer supports ARC big-endian, and the configure step fails
with:

checking for egrep -e... (cached) /bin/grep -E
checking for big endian... yes
configure: error: big-endian not supported
make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830/.stamp_configured] Error 1

This commit was first merged in glibc 2.41, so this issue is
applicable to both master (glibc 2.42) and 2025.02.x (glibc 2.41).

Fixes:

  https://autobuild.buildroot.net/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4a998f0fa1fa42d89dbd19d10c6c2ee79d3e1ab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 52752e975e..e431eb8716 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
+	default y if BR2_arcle && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# glibc needs atomic instructions, and does not support
 	# single-precision floating point ABIs (ilp32f and lp64f)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
