Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AB1E7316F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D4460B0B;
	Mon,  2 Feb 2026 13:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbs0YrfAd_7K; Mon,  2 Feb 2026 13:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22E560B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770039016;
	bh=ZsgX4b7MFwyZ927R6R/XhmWlZ1HD7W2J7U7VCeMifv8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oPY1t2GDvnWlBC2FOvp0Lhbqfg7hrRQRkEDJl4k9p21U87Zop2POP6QjAj+xzmTsd
	 e/qHaRRwr4/Sru4kPU1BTfVVr/erLLi+DHVH+cveIzzXH+bnP9aKoxg0gnlm/V54Pi
	 BA8u0FgoriuNw599qVM0S1LQ84/JcFUw48TIdXKkoXdCTZEYd/0ih00oqvJnO1E3RP
	 m518vDTfzwf0mjC0/9XYh0y7D+/8errZvCpqPe4MDJSV5W197MaULg4LlSoIFLLGgh
	 NwWnSIPUJRMb+bubU9/n7tk2Ng3rkwPg/ZEVBFjlK8zwa0r4L3lLF3FWRWSsUCLLEN
	 AUJxE+lx84qGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22E560B46;
	Mon,  2 Feb 2026 13:30:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2D4134E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDC08400D5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mycva908UKuX for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05EB0400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05EB0400BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E07FC83956; Mon,  2 Feb 2026 13:30:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 14:25:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4c9aa7b43bbe3bd55e0aa2fc2945ff7c9622bfe
X-Git-Newrev: ceb800d3c63fe91628f42ce749c211ebef278628
X-Patchwork-Hint: ignore
Message-Id: <20260202133012.E07FC83956@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico-sdk: Add host-pico-sdk
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ceb800d3c63fe91628f42ce749c211ebef278628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a host-pico-sdk package to pico-sdk.
This will allow users to build rpi pico applications on the host system.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pico-sdk/pico-sdk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 3f242ab06b..5bcf71650d 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -19,4 +19,10 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 	cp -r $(@D)/* $(STAGING_DIR)/usr/share/pico-sdk
 endef
 
+define HOST_PICO_SDK_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
