Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895EFF5139
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651A9816FE;
	Tue,  7 Apr 2026 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSvcUuwhaCrw; Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89535816FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592162;
	bh=qIdB3wu863CloJyLX2+vHTD/SMTIiD3KN665hsCKGcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNymoGIopcbBSYhj8EOiJgxHUCADhwaXH6ksddgw/pL50mxQb6EwAHwtDOTCGozrR
	 d1rIQdoi+ZtNugVJdWLhTzdktIKI14zWJriX/bWw4x0wGe2SwMpdNJmBq0XEy4eLiw
	 1j6OUM5YVYU0mqC9TFRvh9H5O4bvzV+ieNkErXyhlik7tBRpa7cmEV4gl663gDQMVd
	 RaKGfUS79Jx7Omxa8gRTJlHwL3TBxxOlPtF1MmCoN4E8ZveEqlvH2EUSLVjh7VvwMj
	 dnzBPdq96ID4wcVhGdl5CW2Ou9jCZABTi/nBfm8kDWPX3tYP+dCBK4crzIG1Xs9Pqi
	 EQoqc1fE0Rw/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89535816FB;
	Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 892BF2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDC0816FC
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmktlK5duKXE for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B07816F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B07816F9
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4534A807EC; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 21:25:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6d24b6170d7d7c1b629495fd5e70a4c35c84145
X-Git-Newrev: ed283567a84908562bd7b46e9875b9129512b0b5
X-Patchwork-Hint: ignore
Message-Id: <20260407200239.4534A807EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: increase x86 default
 CPU from i586 to i686
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed283567a84908562bd7b46e9875b9129512b0b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 arch/Config.in.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..548bef9226 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -35,7 +35,7 @@ config BR2_X86_CPU_HAS_AVX512
 # https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
-	default BR2_x86_i586 if BR2_i386
+	default BR2_x86_i686 if BR2_i386
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  Specific CPU variant to use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
