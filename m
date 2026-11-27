Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E1606A326
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q/y0X30s;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOKfAyL8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B9C80A06;
	Fri, 27 Nov 2026 15:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RB1tsJN3tt6p; Fri, 27 Nov 2026 15:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F9348118F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792307;
	b=EqzYtXXO09dPyNaMNdp6QDXJ+/zF1J64Sqge/l/UIzEXJBErBeXHGM7CIa1P8XtGdPnz
	 5hmR7mhWw0hDljhFJnTvshsUbPD3ugnNIqUqlockLFPu+x2zNC/RWBsFeY4pQ/DQyAKeJ
	 o8Z+14k5Ov+X/i7uovF918wBdoqmEoAt8kDoHwD5bZlngWcRcbbsjUmzKpQFxuC8mNUnp
	 M4+FMA9Cw7DMGe4PsyCvCFQVH2Y5fjuLk2/TUzyJkbyJJDchZ9mDjy+xXFCa1EQ83cZjo
	 SZuTxihVfkSSlVBLF1Q3u/fyzztTirsYHoAEsVIVuDz4S62i9f9q/OvCxIQjXPBUwng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ebJE0M8lJvUtI15ZMVXOTV6pF3Hqflq0PmvLiIRuR2g=;
	b=llRUVItl+NR/0eTOOmXad5LaX69j1UKfZWc4NfPKzCoJZgx5kqvtN5GJJBE7YAWeLmhM
	 aQoBXyedoSMyehAr0QhTP2FLjTK6bqrrfKm1gpCKhbkFjIyyBHaWsuhsuEt5lwSRjXGcs
	 p+U0Iv/J5xFesKsS3MqJlsOTdF/+Krvv8ZwZULs4t78q5Nrd5Cy5zr+woXczTchjqQEec
	 frT3UnoyZz1TyZ6Q6FBp57AOZxVUIOZCHpKAmq6tSPpnrNLp5RL78+W34VBVr8rQw653+
	 GCiS1jn8M/7hn1GoHHk+86eYFYT28at/GF7SW5pEjFWFuiLCPUXV7IYASx3Rh0ZR7Dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792307;
	bh=ebJE0M8lJvUtI15ZMVXOTV6pF3Hqflq0PmvLiIRuR2g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/y0X30sj0T6JCIxwtzxMt/FWRshN/skE2MAS0clswaE4xHC1MI8PSiQw+itXJsmm
	 F+qXRXStzuGRau+4XxvinEmutI3KMnOmizJS+So5D4HQGlSxQQD9RAucFhMlCNNNLw
	 uoU2sUXyYgYX7lKS7vjUdAqh3JfXPtDHXeXlBGc+2KRLn6SZ4AZpLtCqPmaZVXvwGS
	 jWJ3MbDQ1Za5ycyXzPYyPlBal1M9D8lm4JBHticd6AVEfPm7wZ9aqMmmk8TYjft08p
	 icetY6Koefj5H0G1OIoawP3dBWRVhpWOdl01QF5lFk2GJezV8snpbh/HizBj676ynY
	 0BRJMWc8T7RSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9348118F;
	Fri, 27 Nov 2026 15:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6682BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731A460B01
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbsquGwRskJF for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:11:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C8C9660B58
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=dOKfAyL8
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com
 [IPv6:2607:f8b0:4864:20::1333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8C9660B58
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:11:44 +0000 (UTC)
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-38431138772so10705735eec.1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 07:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795792303; x=1796397103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sQCoMkzNXxKJfClEkCd9DpaovCLLCDvkl3W2PL8QAls=;
 b=dOKfAyL8qEPSUR6tAXz75ConKGzQ9/st1itgrOtESZ9luG5svc0H9owsqf/f/rTPlJ
 QGwIqiMRFb1tHWIMm5vf6KjIM8C0fWHWKCTN8XbPSiax+vQ2R9XVNQ5odh20OyWyIbq/
 sLpgCb2FFWGLRi+QJ3LgHZAn8skB7Rv4ccDrfrjCRJu7w5naBAodkRUEVVTyO8EY8gYV
 hEdCi2GMdb0uoflbTPxEnsTPvRINoDh8qZSvEws5M/Bdh1jGsjeYSCApovXlOVuMQ5bh
 lv16CtYwk+ydgOje2uq9pg2naBfefXcFJK8wjuwPGJKmmzBf9gQfVPtd636Cw4qVsfcv
 wsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795792303; x=1796397103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sQCoMkzNXxKJfClEkCd9DpaovCLLCDvkl3W2PL8QAls=;
 b=TAca6begpaeH4QXXU+Y8Oq8jcAsavNg1n/dLtYq7kHHbmoGjzWhEcLDhTwae+ml/lF
 5AHljESIThnGG8LShRT2QxvXP7IOrovNyi0ttmTY3bzkaj64pXELu1ySE/Qoq89ucEWl
 Hks1xW53RW3woBwmuQDjTB9Y04WbapGextmd/pnZTZwziHwogk+3h2rgRP2NcYmE9f5+
 XMNf1tNO68GirjEqFgPpe6LUx7ATICWoOZhQQkUak8A2AkfQdfSk1h+CJ2NA6QCjRxxe
 Sk8vmOFf1LlgEGtEhVkBuU/O6g+nyfpTfeKlvmjV36S1ZBW5CPiuDKhlwmNe3dwoWSjF
 jDuA==
X-Gm-Message-State: APuU4Z8EO/TWDBwsOkcov9GTj/HcLAOgJH1/RsxBDeBF16d+Fa6dRg2g
 ga+mqA+kF1cG9+OkuVXbLCmllULBSvprg3V2wxFPfzsWvFCfBTqvrRjmEpFr3g==
X-Gm-Gg: AZFdTZd5vxiAyTybsLPpRxzYG/cVBbkjrZ6qctCbn4NBKAcPW7k7CREcdv8cRSLqzKn
 9FrBiUjkRZknc/WuzQt5De/CeQqYy1z8sBJA7O++Vbw1IuMjGo5zmGg7k7JKX/BFSiBW6nKjCAY
 Y5WeihfH/vGKwkHNYT3DRknV3JXU4zc7F8LDs1VEdzwMk3GsUwp1buwRnMzoLeKOFvPJBiU+8XK
 jiDwgig7m2EwOXvm+SluLWJlnO+59g8TfUC58fN/kg2yzAtvPxAuzq/73r+Mk/VuHr9Zo1aWoqX
 MnNeUNBSyGvv9Fw+Z9avifaDBayNuV/aMxnnmT/V7HhOCAQ4feqDVsHz1P+9R2snBgrqy1aq8ZX
 TlYw1Y5YZXI69+ymfYxkWGB5DBEVFXZfJquKqcqOkDbzyEZD+SPeXc10WJZi8McCBy08vliZkz+
 puxaVIwzIQcMdIbd+JgfG5IDdTzZ5x/VIf8xqOM44mEXWkeI0WvXsVJDxW5y/NQVqHLpE+KRwFT
 pee24wSV/GFiFGSrcFGXSwGDZfKV4j9+kVSIrhTi97VOWpjYj6IspEkBuaS8cg3hZMxnob6RmX8
 7vEO7psATuWrslU1s0YD9WpV+BL44E6JPjjLWFyXej2pst4aXgk7X9XZq7w=
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id
 5a478bee46e88-386636fc6f9mr29618407eec.12.1795792303183; 
 Fri, 27 Nov 2026 07:11:43 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:be15:fb2f:b58:26f1])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385677c349csm78042668eec.22.2026.11.27.07.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 07:11:42 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 20:41:32 +0530
Message-ID: <20261127151133.2261076-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127151133.2261076-1-chakrabortyshubham66@gmail.com>
References: <20261127151133.2261076-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Shubham Chakraborty for lsof
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..693171c62c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3124,6 +3124,7 @@ F:	package/font-awesome/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/libenca/
+F:	package/lsof/
 F:	package/pv/
 F:	package/screenfetch/
 F:	package/unrar/
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
