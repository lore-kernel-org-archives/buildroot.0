Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE55FEFB73
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E74782D2F;
	Fri, 27 Feb 2026 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xv-6KOn8sEK; Fri, 27 Feb 2026 17:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1E782CE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772214949;
	bh=SAIkEvspQf1P3JcnjJdSsnovANSGSH+WVGaRqs3Wvc4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fBHZ4d6t8ZyPjVb+EeT2XaXcKjikPbPQlbAg6FPuz2EObU+3gcnRr5+/Ci4B55DTa
	 X9xP79ChRl7RKboES2c86oo5jnNOk0btnJWGdsJTQziViqdJ5v2yKiYEEDVGi6BMn9
	 A4iGqCCLORRPBRg/77vVFjV3jXXHKX23C2JmWR3p9PWaPxBxbanDPc8Mt8S1RIZlvA
	 V0KhXq40Sc1QhQyelhFfFhhmSZHYYiIGmoLujRXsZuVpbq8askwiGZKWPySjdiD6VF
	 YBQK21HMtimAcZixjCa4/Vo5+BIsXxkd/0nUJYGiCSqH+WHx09sipu8TPqJjuxechh
	 osOR/qZYNQJsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1E782CE5;
	Fri, 27 Feb 2026 17:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D52AA48
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62797408C6
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqcgjy-2JuXP for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61ACD4089B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61ACD4089B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E8081079; Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 17:38:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
X-Git-Newrev: 06c64513668c6ccccd4c53c35f5fc141554d77d8
X-Patchwork-Hint: ignore
Message-Id: <20260227175546.46E8081079@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add
 configs/versal_vpk120_defconfig for Neal Frager
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06c64513668c6ccccd4c53c35f5fc141554d77d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add configs/versal_vpk120_defconfig to the list of files I maintain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..88a684d9ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,7 @@ F:	boot/xilinx-embeddedsw/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
+F:	configs/versal_vpk120_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/versal2_vek385_defconfig
 F:	configs/zynq_zc702_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
