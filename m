Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D859CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A8C60678;
	Sun, 11 Oct 2026 08:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpDsZusjkJkB; Sun, 11 Oct 2026 08:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2798860623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791705813;
	b=UF3CkPw8ueb1GBjNmfCe57Z3laxZZhnp5BI3VfahoJFwG/N9a+TWUQc6C8hg+rxtN32t
	 DEVgTMM/6eSqrJrSjmHNCyR2AEjfAriQLe1n7c1iS0lFqZz66mXm1pGcdjMhjzAhYsG3K
	 o19LksLqrP20cTjIylX46EI6oIMbLnuKr10BBj0baF1Q8944cMBSAB91Y08XjpshUq3Zi
	 L/ZV1cgtoFmzgr+W6LYGgGLL1/nKA+d4pssR2P2nuN/sDRAc3vV32SzyFopqWOqev20Vu
	 ImbX415s4g6siWxgDAslVDqRh3tGbV6imbTLQac8SFEaSR4UTv0ps5ynQOxA0T95jHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791705813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QUlmHpG1IHiKlu1s/4DuI1ck/dWz6IFnkovABzBqljQ=;
	b=cncO2T94OHiBf+pC8yvEtdfnR5d4bqmicPLw8hjIVcjDM31lEkLj4w1hy4JlCbhITWri
	 HUe1YNTwccsWtwAbQRwHPH0cDGu05tPVIdtY47WN437JQa9p3MrCljM9o+A7D2V3evEt/
	 AkmCn5qEeHUbHr9H5S+CLEH3waZjsLWm01wOaEs18RHiAHowOoXKKThrSFTK/4tZsjIvM
	 BaHZDW0WyPFJPqFP2ZXCnq1fENbKWvSBIxmO84OJMBs9DWT5Aup/WLQMyPIYpGeuIjind
	 AL/bxOZpvg37x+AwbRL3DFPNty0pW8n6UlgGAakbc/oQX+fH0BvzlfAgajECRz1Ms+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791705813;
	bh=QUlmHpG1IHiKlu1s/4DuI1ck/dWz6IFnkovABzBqljQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SK/xYTw+edagSHQH7FVGMGz/f6KXDdHXPBr77pyLxolp5USHvRsBZ25lo7alkbEYe
	 g4W1fKhs01+7w+RfryYJ3EIE6GUmrGYw/BL7ta/StCsDkxhscHPOI/hQT6rkPujunK
	 rn6ph6LE3ckWn36n/8eX1E19klTcrkhp54dofJRCoRpbZSedr4RtqU+xMFNmq+cutI
	 voiTIwyrLVVSB0gcWREILqd2pO6KYQftji1DMLUoGpn5UbVBHRP1WqbBMJzE2E5eCU
	 aoVFfahcepRAayHET0Obhnp+1PIJDwRZ0nN8rEppzuF88+w7oHV+3ADiQdXng756HL
	 dXweVAuW7+78A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2798860623;
	Sun, 11 Oct 2026 08:03:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B05D81A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96359400D1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1ro_jAVXy_E for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:03:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 71EF740042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791705810;
 b=ZP43Vzgq/0CxblO8Hx9GMAbtsh1wY3EXgeqNU8puxHEix6tVkfyYUl1tvWocd97rMzRj
 jHY8BTV0JDwzsOuoEgfJOjisytc9jzHXyE+Iauf9fYZS097SWpiNOC8moN2QESeNoDcHf
 uVNcIK9SWZJGBfQ7ErmhZ45fCaXWddFoRzKXmcOQUsYWPOU1R9hc26/3cAk4U8qaRSYze
 qoXsCcGa8jqBf/Wc+jA62YLf9jhAgq8mSq+gJgrJbfIqerH6baG38wabVxfjjzj7/AKPd
 3pXpg1iDXJay54+/EebL8F6pQLP10oRll5fXsiYliikCLs4GBUHJzBexGL4gRTmWxEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791705810;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JuiYbiGwdZpJ7/0jWdw21LtXXT9o9ZAQdKFkmiT5h+0=;
 b=KCdLueFVYNJDIDTHs0ZRzgGbHeYzEllu89b8vtc/A4QS3p469WfeEJWyp+fPRcaPht05
 5XZk+FBKoIw9co8Erux3n9E1bo4ZHEk/WPMeCsRwxBpz9YLsqLHCHDwR4cyXsbU5zc668
 IVdqYexS9Eji8LvoXTdiublVzebsTMTdI5pYpzn7LtOgMGUnwKH1deEIDgFHaWRu1AkA6
 ib+8opIT0woVbYPYmTIXfdsfs8jbGLdd4Z4c6dCZV7l2fiqGKRgn1jxj6grpbtPJYKvW/
 CqiraFx7RSKz8Ohgf5uUkrxrnumCaEY+MNpH3o0IcBDntkY7Og21EDpZPB96o4oRDow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="TT/vNBDI"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71EF740042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:03:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso501454f8f.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791705807; x=1792310607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JuiYbiGwdZpJ7/0jWdw21LtXXT9o9ZAQdKFkmiT5h+0=;
 b=VXtdaVevqmLCq+UdyawVeuAwm7fm1b1TjUocHEZUSjnOTncVgIrQydwLxMMOCMjr1o
 X2qJCMcuLKOkYILawqoi3slJhYNjySfqGcJGDQMoBHtUSajFMIhzUUZudjWFU5vSwb4T
 aZlWEbyP7wB7j2RxBs5di3oZ5AGu9SHhiC9rZK2ftas7bQ3lLY+6mGbGu02gRfVyss17
 xrEiTtzXX+ZmCy8bYBkN7CqWjK5sREf+vhYHVrO/zeARi9UyuN7cHA1KAqsOvVopFvTD
 XfFp7yNbrjqe2Oj9+6RNSnvlNRKSU6jVCYsqDaj4tF8sTYUqDuXz15yminX5D95ebMYQ
 oOVw==
X-Gm-Message-State: AFq9FYL8feYVcZms+F4oWAfg24X79Etpt9NQ5IuJ39Q/WoNB4PHzdbDz
 ovs5/26DXZJFqQ3ktdNCTNpbv1ntEiOcT2QINkSTV3Nxc3KxSWLo6m7LSbpW2eadQkNEmD4QizZ
 WMFh6i1c=
X-Gm-Gg: AYBFou3q3BJ/Tya5U2VBvkPVeo/DBkgj1NYWS9IhdJGdfr2hLNPFrzmswfH+bCzRwOZ
 qJwIsn8FZ3tiH1O8QrrxtEyodYvbxKEwsbNiXJKJsmWFvaGjuyzTA82JI/yFQUeeCDhkJpe1hTg
 9eNKzxc6whZ24mRTOFpbcgvqVQCc9KHprFBmhNZQ4QsiKTFZYeodXHwX/oxc6gVmpY+GjatC57y
 zKEgZ2dxWPbG8nEBodwHIb0P7S0d4JovVZZSvoLdWmxgk2ee3Jui8NO0Ogo7zDH8opy8v6RYyC6
 up/xCtIn0Tn4MnExUW6trx2pp2MFXlpSakbg5SSwxwcHY9SZKgw00QyQWNsZubI52kZSwxEVdP1
 Q/A3AP6j89WVDtSzAxxSuQFbhqpqM0pVLtoU7OEeE2C4Z+VSAtODehtZKQ8wiS+t1AtWzT40wVo
 9Kkry+7TpC/m5py3z9lrjhpTmSc6VvQrPWRGgb7OKYCvrb4pELiEaBy1AB/zk7f+wKaUj+aeWqb
 D8HtAt+M8+Y00ZUnszjiCmRYBsuqJPBz5fMcOZ7SNaLocDFUciCOnum1o4kVkYwGKfhivuscQ==
X-Received: by 2002:a05:6000:4312:b0:487:27f6:a4e4 with SMTP id
 ffacd0b85a97d-48dbad489d1mr10828295f8f.52.1791705807249; 
 Sun, 11 Oct 2026 01:03:27 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9adf5e6sm12840648f8f.56.2026.10.11.01.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 01:03:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 10:02:45 +0200
Message-ID: <20261011080245.1094313-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-headers: sort options in
 descending order
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Put the Linux kernel header versions in the same descending order as they
are on kernel.org. This is also the same ordering as the one introduced
for the Linux kernel choice in the patch "linux: add first-class support
for all upstream linux versions" [1] (currently under review)

[1] https://patchwork.buildroot.org/project/buildroot/patch/20261010201508.963412-3-titouan.christophe@mind.be/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/linux-headers/Config.in.host | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3cf2cdd4f4..52b9d62b48 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,38 +24,38 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_5_10
-	bool "Linux 5.10.x kernel headers"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+config BR2_KERNEL_HEADERS_7_2
+	bool "Linux 7.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+	select BR2_KERNEL_HEADERS_LATEST
 
-config BR2_KERNEL_HEADERS_5_15
-	bool "Linux 5.15.x kernel headers"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+config BR2_KERNEL_HEADERS_6_18
+	bool "Linux 6.18.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_6_1
-	bool "Linux 6.1.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+config BR2_KERNEL_HEADERS_6_12
+	bool "Linux 6.12.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
 config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_12
-	bool "Linux 6.12.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+config BR2_KERNEL_HEADERS_6_1
+	bool "Linux 6.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_18
-	bool "Linux 6.18.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+config BR2_KERNEL_HEADERS_5_15
+	bool "Linux 5.15.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_7_2
-	bool "Linux 7.2.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
-	select BR2_KERNEL_HEADERS_LATEST
+config BR2_KERNEL_HEADERS_5_10
+	bool "Linux 5.10.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
