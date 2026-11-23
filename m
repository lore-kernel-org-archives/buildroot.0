Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D3606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XR/g1iHN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9D480DA8;
	Mon, 23 Nov 2026 09:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-LxpgdgoCTa; Mon, 23 Nov 2026 09:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9623080D80
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795425400;
	b=euPZ7pDj+rM39k0wWRdgjYrOejvkbJ5JYWqtEEBzrqQCQjmXnXMAsQUgrTvUBxz3YOv7
	 L6ekU/OAcncE2kHQ+BHq4X9hXb/4SWnAOY2ukW7FoGoTCyvamMFek2zSuvPvzlTbslCjK
	 6ed1a0TiHH+S4DTRmnDaSfKixLklKPdbp87BUn7hKFmHovQaCED1Uw1T0u+z1aiFTO0jF
	 QelczRtIca7/V+7WTQNcjuXvJ3dgxzGG64t/M4sWm2EXwERyfKND9YoN975waV4pEkvRz
	 HNLqJ2LWqdMgMMyGtUMXKvpzKdKZ1zHOohhnbRd1xT5w2jqfQFXKNcE+3t3dB5Sphvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795425400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bvbK1ojQV8pUobrIN/i1Bu16Yne+hr3hqGJ4t/cmh4A=;
	b=RHMec5Boikbedv99DxG45EGfX+e6igMdqLYkkTmNwD+burR8a+MfojsFCHgdzDONNQzm
	 Pra4uscM/jbF5kX3Zw0G+JxW/cSD1ed+UGWGIfmt/3mkILtK6OMoEeuv+uFXU9yeVluFd
	 aGbBgjcs1iZpTnCcCEBt00c2xxFmP2pOmJmBB/Xv5WeDP3RWv9pqSaRdadn9M7wIHzo/F
	 op9yt4QMPej5DcsSWqEBaOmokGSLbT+rxZYIkeVmTvzR3gOgIoeFNNgbQOAJDKEZnlH2a
	 P01zxQQoQKuTcv2UvDgp1+ZeerPbEItBNE1dGo0YM0HHDX+iJa83/EwojBTmRRDgHNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795425400;
	bh=bvbK1ojQV8pUobrIN/i1Bu16Yne+hr3hqGJ4t/cmh4A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=XR/g1iHNjIpg5QKrcijU4a9d1gVuEAoAZkR4WZv4TQNpkpwYsHYtHiIEkcln1Qu85
	 1rKuMiR4urOLhbotWo1Hr0OoA9D8SLE1DaXqboA2vrc4kBVaIWpExM/K+gxECBOv3x
	 fEOPzriIsxovavdj9dqTsX+sGuazRaNI6a9S/4bEJTfRcuokbj7elx6lZHZz+a8KB7
	 nZX/WDvmBq+1BMJHlJCnmxGFT/N4OTMuHfhUdeb2gE8QpHmSv1oB5/BVWL2zkCxLbq
	 lIOaRcX2XpAKQvVdk/Y7lwb7Dt8e0reG9Pz50va2oc0uHXGTslA1aWhPZuy+uwkKbp
	 hUpyGTZwqqTgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9623080D80;
	Mon, 23 Nov 2026 09:16:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 052B9759
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF43340674
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3Uu5yOdyAMu for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:16:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 79FBC40672
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79FBC40672
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:36 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795425395; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:e6lXuvYY+hQowfKnwMowFvxAqzpz
 pNGaz6UaXbsS5S1nsQXNjR5fo50aSRmDdwD1Z8BaDv9E/Cq9woUSN4+li5ZDgT0tHW+7eR5g9ge
 MHxKKJ1RryeA4uOfzyqnLMiCu9JBM3haj5eoTCfBStNylWfYlZtuCpF+R7dj6YOsLcpUaZ781gy
 yj7S2dUJH6cakiuvAbe38Y8Xd8FfUVxBH9SNf/bKVUw3mIvEWzB4FKweFNpg6SMDBSXPj0VRz9Q
 2gZhjC3XlbXGZq82LgbcCCDotbKfBFJqPGvyiCtqJXoqZ54GqcaMwU5dHuGQEElvJoyZiRdFpZt
 vVv5i03nNE5j+Q==;
Message-Instance: m=1; h=sha256: K5ukE+5eAVDIzh1IP6/+t8GU91Wp1P95+GTNUCkmFd4=:
 DbjLB4IPXBynPB7TYzpQUxff48oFw/rOiyDs9C/Zxxs=, sha512:
 UrmkHkJl9ntSJZULzg8hrgWq3sn2crCFiz7MHkeGj38w6BuYa4POfB+irwT0WBINPFZhvBqvBLPC4vZHMcQmRg==:
 1cD58U3MJtN7t3yiaxsJRg2GqKDfamofEbAWAlf1nFM2uoD+GSVL5O+3Shl//5FN1ARC6VOcqwAFtTgeQNIh6A==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1xuolR1aBo-00X5Sr; Mon, 23
 Nov 2026 10:16:33 +0100
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 10:16:23 +0100
Message-ID: <20261123091624.1331936-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Z0/o96svcuDFzDa1JFw10F7s+WMMgrVXqlO4z6QxYMSiHlSbyx+
 r6VSfGEMqKyGfWHxZ0bB2o9aXPFQEImj2kBryKQnel/IwHuM4K8VfHQHBLYVpVWyzGRVd53
 FBJBTC9PrnXFD8Bc+X7IpZWpB8qSWxECZ3CQyM1yMrpl3Ul/o6EgOMB1J0SQVh+7T3mOB7V
 OEnWyLlPC7VcihrFzhlwA==
UI-OutboundReport: notjunk:1;M01:P0:hTNC7oy6SGI=;Ph9byvyUkeu6PW+KTFoXNsbo6xw
 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
 xfOzjhaCU2/VCwtkUA==
Subject: [Buildroot] [PATCH 1/2] boot/uboot: point at official U-Boot
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The official U-Boot domain is u-boot-project.org, not u-boot.org.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 531301d0c5..691087e9ef 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -176,7 +176,7 @@ config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 	  configuration variables.
 
 	  For more info see:
-	  https://docs.u-boot.org/en/latest/usage/environment.html#external-environment-file
+	  https://docs.u-boot-project.org/en/latest/usage/environment.html#external-environment-file
 
 	  Requires U-Boot >= v2018.05.
 
@@ -377,7 +377,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
+	  https://docs.u-boot-project.org/en/v2026.10/develop/package/binman.html
 
 if BR2_TARGET_UBOOT_USE_BINMAN
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
