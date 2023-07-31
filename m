Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E06C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF47F421B3;
	Mon, 31 Jul 2023 18:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF47F421B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vf25mPPHyMDh; Mon, 31 Jul 2023 18:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66167421A1;
	Mon, 31 Jul 2023 18:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66167421A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E23B1BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1F83421CB
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F83421CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFD6mhaz7mnD for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:32:26 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 18:32:26 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB7C4203C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB7C4203C
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:32:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.221.49]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTABT-1qHtzk0TCJ-00UdUz for <buildroot@buildroot.org>; Mon, 31 Jul 2023
 20:27:19 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 20:26:07 +0200
Message-ID: <20230731182608.21007-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3vyDJ5cpkyKttLqtjworhZbYbMY8fRIWSisARcnUoSmu+Uj8pg0
 44/+eNcK5FtUKTo4LmLB733xzuGeZdKDLaXQfpWDf8n/jFIeOdWR79itZIS+b3teSi5VlI5
 w5mdEwmglv/mfzdhwFABsh31hhdRbSNYThe0bzxKP4X/7XYglgK6ZtGe0y+UB+H6wpXmOu0
 6h5W/5aJv2z/S8wUDmXog==
UI-OutboundReport: notjunk:1;M01:P0:xsKesK3tcjo=;79TE2x37ebMixw8xjx6dC8519BM
 Z0fFiVi4YJr5Mncgz0ZM3lIIlFK2XtwgTN2x+BMb9vZGs3ZBFFHJKhwTPu+E/NDxfPdBBGaA+
 KKWLd7zmmaTGU8yyBBeP9lI18YC7N3um1JmyQNG6kH71GlMaSHG468FYfmGd7b8WDCavd8x2/
 Tgd0NXJj8Hb+RkfGyQkXaC/Lp6Na+sXEca0OygQMOZVaV5Zmr9gbcPILAc+h8mS4O7X6wrc3Z
 gcB82moPCfoFmbp3I6OBP3dymRSaobFNboO4fE50CLZvZaodRS5rWV1nYJ8S2o/ANIMKQ0uPP
 blS5PwvtSmCm2Y4JIHIbUCkpCXPnvNqv2Q7CZhIMgFor3t/V2jt5q6SYLV9M0TgjZHA8Bprdy
 I2H6RGlHjwumiG127l23aRlalzobf8WgGzn+xoUUauq03twZWS9c7xG3i1P8R/8JHfn/CRmNr
 7C5k22mqTkdcu24SR6hrVXzOn0uW5bcaXIa5ne3Wn78kR009sNEvIJYPKcdx+uPqSqmMajfaD
 EZxTyL9u6tqPEJMmUUaLyBztHsGEqYSCM+XTnmKr6ieSnk/QGpbz+nPvPuCqLpaPcfwLEiyL6
 u0w4XVA8/YzqJuumBlvZOtE9YID4HXWbfyr9lsevm68PcLGmce3yAfknQ/ED+RmUcTvMXYMJs
 2P+Wj/14FPLpXWrdlNOfhkdwbicHD0+c5RjzjkQ4JAlQ1lsD1McHMZhzDYWzxTue1D+7gdbAc
 Kvrqk3GTxMXRDdZcCdRQ3eyr/VwngsRPW+q8kRxCkYb+QMvb1nsjnAwCVUHYaUAW6YV2X9hzC
 zxfrAztG95s74e0u+B/pvZYvmQ0ZN5/pDWIM9jtCfFkYvle0Iyf5j9gTBEG1CjJj9yMK+BulF
 fVvfdTh6TtStOwUq0WYtHCNJNwkHfX0Eu/mOoKqLWBsMoHMIp303rtP3X/bYy776izx4oxJpF
 2TceyUP7tdKWdfWuWrXsyRZk3DQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690828344; x=1691433144; i=dalang@gmx.at;
 bh=HyVh3IBIsjVzLU0Ahog8Mck2HRfHC2hWG0z5KvAo8uU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=AbfDNvVVhi2mUWF2CrSStU2JkFvHYKhtfFrh+Af6ApgEqo6lxt6+C/arxZoqoWVWj0RDa0D
 mgJF4UFcuYbmc9RyHTcRDMrpm23CxG4yGtjt7th3VfF6L93WMgNgxKkKGr2qqjCu6QmMKi6ik
 tKot4HV0goAPBkDl9IPCxE9xOdtFjjqCDcl705X+ntgOgwRyNruZT3ElTecYahxCSG+SJHJK7
 HOQnjWAGow5bt+UGg7OBrUgaOOLwK3s8OmU51l02ipRSExQzZ4sUlza9l4NzbXYuH1UmGhuxk
 w0IKW4bwKewYL0bxXlO5Ss6CcxQuird5iWPe6tb7MZ3pi9/vgcNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=AbfDNvVV
Subject: [Buildroot] [PATCH] package/llvm-project/compiler-rt: add CPE ID
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

llvm:compiler-rt is a valid CPE ID [0] for this package.

[0]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=compiler-rt

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 026650c7c8..03dc76eaea 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -9,6 +9,7 @@ COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
 COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang llvm
 
 COMPILER_RT_INSTALL_STAGING = YES
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
