Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E09606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SnGHqnQt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F2740564;
	Thu, 22 Oct 2026 07:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8S0cWEWwHgFo; Thu, 22 Oct 2026 07:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 264FF405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792654726;
	b=Po1BWMXwe7eiOfOQeaKDSBXGtrw8E+JqyVGwdS3GLkEIMqt6ZH+CUs0rG7E2zVz7plXj
	 pgrQE+/eLNn4rasEHshHwh08Wq2pE+BpxcfDSCVFvIJM8nIarZwxTLDsCMyCEGcj7bQ4O
	 WJrFRI++hDs/VEaWFBuZMV8WONwWzovG+pNusVmA2qZH4K3gFKsmIxhTPWuMtdWpk6fWL
	 JKAd8oo7hrVBPSnhanKU4UttuTw/eBgOuBrs+f+mNc/g9jjIUUQ8g9/zIqQgopZjbsqOa
	 KXz8bTOQHZkGvCXFmJxLOSFd1DKEjEmJQ7QeyeSvuLMZwMW5Yf7g9bYmsAyBk9pA+vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792654726;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ra6+X+0BZoLBF7TYMVtl6UcXpkY2vMDHte50Pt7TVx8=;
	b=L5M/V3CS3Df3830EGLie/1ZQQlX35ZOOYSQZ279p1B9WxrYC6Jz377hsh0pKJKq5huhu
	 xiJLNm0cy+wRTjTO3XYIMlRmH9acsICusKwuaYLjogy6OheR31xXx0is9lhzwiblTsTni
	 C4hnU0hNeiF7twFxlELk+cmdlo3j8tIwEABCIR+lgYrHaXkaWY/cL/ANSYhwiLumq7s9/
	 DNLxS13vW/g8vJbVqbVY2MFCpStjpQqhp3pyFGA/NdJXcxiHmQixUxcmiqtqKxEOeUzHT
	 TmZtLAdPyIPTsTQJvvKxCE0nxiM4W8oCjwtq9u+ST/c/I1kiLlWqUAzbi1QO8q8Y4rg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792654726;
	bh=ra6+X+0BZoLBF7TYMVtl6UcXpkY2vMDHte50Pt7TVx8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SnGHqnQtKf8T5BAjnzXUAYY97yY0XmDK+fFpF/UbKlR4AB7yTfvWss0u46hgzMyyK
	 2Bpq0BSWQJjFeCer1BQ46CO/ndYbE33VlXxm6GSr5u1FTCRM3lnEAnu+fcLOawTMwz
	 egq/xvrWkoO0ROXHjlt6zYhna2/jOEackKWSMjKAEomVoZag4XHrsE969TuKWzFhZH
	 XDL2tZEOOdYZ3ENAeW3gqcOhoO88b0gXzRSESsqKFnEBeNi97JC+KRSsqgnY2Ec7Jl
	 T462fe37pUxVOvVQl+Jl1ISXztdQuCK+qRobqRG8lsQ5Y2/j6K916m7rBuS9JYqHUS
	 QAZxqNsZsNK9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264FF405A2;
	Thu, 22 Oct 2026 07:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3553A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A470880A87
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWxHplt1smPp for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BBF3E808C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792654723;
 b=l/wH8wSy1CgFMYi1FUXdjtwJg0GeoJN1voRpjPRfU1zdcAHpQ49lg83ZuE5R2q510ofk
 a+cEvzVvITVOiCaLeM7KPedHhutGlKcCIqbH5LqPsSlu3XG0IglIvyvNEb2mQ93IXOhYb
 ns4KAD7l8Rt7Q6thA2oT0Z7edcJspTCR2jctkPU7n27DzsJx7kd34+5WU1z5DTHaX47OK
 0q+yskjSP/OZl//6HCLovZLwVB7yd5MrSHuFePq0HHe9P4nm3xMrLiS28pAK9eP09Ejs8
 mwQobTs7F0ofp/yLhH4fPz3yjwBJc78uvzOzsDROphIH2h+sTrmSMG1K+yTGBSGvDxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792654723;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=udkYCNZbm/Tuq2klV9xhbSYqv8+jpMOa2I5OgTq/rJE=;
 b=l6Jh86aewHEVq+2mTJBmcLnz+NkXg7D0beP1uQyqvSCe6PHsAVpxIJQyBRwlczC1jsgI
 THR+28vZgPjRhZAqs7po2jYH6N+D93ltbVxkYSzfee97p7Ax6FQlzH98DmIH1PF57rpJr
 /bUGA8XRAoS3G1q0E4znAFkWP1y5o4FXQiup+o/o3LExd4iqf/Uc8FhSnaDG8Apd5UH2N
 m1pxebjsDCptCrH9ihO/vyhdaLwLEOrP7ZikYFQll19QINWcxkYphjts5eQEZ6bRGo+ob
 sOJUly4N6sZJw1dclfqlw8hGAwmj7Kfzs7tMm/knWPhd7eQlXyprTDBU+PsBoAQM+1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Zh69VdPo; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBF3E808C9
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:38:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 520E04E4129B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21ADD60360
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:38:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 478081032854C; 
 Thu, 22 Oct 2026 09:38:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2026 09:38:35 +0200
Message-ID: <20261022073836.2751161-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] utils/genrandconfig: disable rtla with older
 kernel versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 5e8705263cf4592d8c02fac71803053e17d4f83b ("linux: add
first-class support for all upstream linux versions") we are now
building older kernel versions in the autobuilders. Some linux-tools
do not exist with such older kernel versions, causing build failures
in the autobuilders.

This commit handles the RTLA linux tool, which appeared in 5.19.

Fixes: https://autobuild.buildroot.net/results/e0a0d415a50b29cb503b800a859c4de9baac1c29/
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index e6655fe189..bd1b1dbfb5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -296,6 +296,12 @@ async def fixup_config(sysinfo, configfile, skip_secondary_configs=True):
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
         configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
 
+    # RTLA only available since 5.19
+    if ('BR2_LINUX_KERNEL_LATEST_5_10=y\n' in configlines or
+        'BR2_LINUX_KERNEL_LATEST_5_15=y\n' in configlines) and \
+       'BR2_PACKAGE_LINUX_TOOLS_RTLA=y\n' in configlines:
+        configlines.remove('BR2_PACKAGE_LINUX_TOOLS_RTLA=y\n')
+
     if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
