Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D180606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cF8Y1zNF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D728A81675;
	Fri, 20 Nov 2026 09:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hw9EBBy1lpqU; Fri, 20 Nov 2026 09:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C13738167D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168703;
	b=s7ye41hnYQqAucKAAk2UJR3EmNS5ts2s7xAR4G/I7QiYJIJLsQQXMfoMyx7vvUrAHpnP
	 G0x1abTdFioB5R/g7LGfpEPvXYpwGdJ652yeHGA7ck1RGB+eZ2jwcKmkU3lmYeEJdcBoC
	 +E7DwVBXJ3pXUp/+36jRG3hLr7bcuoqUunU1dli5o1ROhVpRwBZhO+GpYIUQ1xqvcWxHH
	 2lOQzJTUEN1YBTbPEWpMMHporXYA5eonqD5mC2nSYNFjsWzln5XlmotUquu5HopyxVlBT
	 5Sz1JTFf1VuB+0UwG9zcHCtGWUkQnLsp8v5ng9zYNoCdSBRgylLZOnROmibSBcxvzxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6y9ZYW+V7jRIJ2qr8CbS/nhoVApgBFlabQA/lLQsilo=;
	b=GdqRXQ16eobBr0NdfbPHXqLFAN5iwy43No9m2/TYHEpHL6T3nhPMtO8qEZbbkEu2gdwx
	 B9Lqb0Pf9/0HN3c3StqWZVCIpTcAkYj/RleWMu+FfYhcz+FV38HV1JhnqNlFwNcPin0m0
	 6sx7HlQCnhItNy1h/DQ/2ZzQmaLrSWgLESJWWqCRn83jm0YZXBZKFwBwdimHlEDNtK9L3
	 nPlLLT/Bu5pJK6yS6zkdUBB4x50sTUrmwomfGPqAybVr7P/1MarHcwIVr6OwjMZxbDFzR
	 n/RnbZ5ctIhYv/plEt6rRRGwvDsDNCsvK4sTxYvN7n8+ig02G0D9r/FVxBMAXQM/q3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168703;
	bh=6y9ZYW+V7jRIJ2qr8CbS/nhoVApgBFlabQA/lLQsilo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cF8Y1zNF/BLht4qk16u6s33qDFRgWA+SkGS60hpwERrMrKHTIIeTYFPDCxWhGVviU
	 stT9QmVIGfYeso9sreuvioV9c8Fyey5GW8lInvPT0HsEPUO3RfEsGwiaU3ZOb7KTzv
	 f+bC9C2dhNY1IgeF7K1RMjUWSvEIpEcXOti6vNuwDiJxSPOxbKduJwVpAKCOrbDao2
	 hIkq4oCmemL4AF2L+I3NM8S0O38ayUi2A1q4hVw9HmUWl53/+0HpHfDeriD8ttlfj7
	 qhplZlm6y7cRRgp53S+dtz1sP0O8QCT7JIbOByZd8RlirbhvqAj/LOxnQoQsiV834U
	 3HBgy+TQdUAEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13738167D;
	Fri, 20 Nov 2026 09:58:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 951B4E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E7E60E42
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SoCj0A_UCkE for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E75D60E57
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E75D60E57
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso7464215e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168699; x=1795773499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SLzgW4l3UFZaOFS04PTwzW/wKTUgV+WEFBTuy2zNtGc=;
 b=cN18wwQoCbtunxJ3hS9J3jx8qf9gmST0QKn3L+Yf86C8lUNBruec+QPSOtLLEHmDYY
 M69bX+e7ig/2CqDKAUSjwJQno9EQT+ZsB114cGDUnpY7RB0y5hbYrOV7iGnU08f5dOpb
 AtBBHi3cpKWQfGMkKtIPbsFS2Wgrt8oE8Tx0vnLuDpgvevbTZD8NHljQexl1obRxnXDl
 5gnT/AqPXVSFrRNpjOZBrS1cGOr8ilvCcl/sEaN5c1MdIoB+c+3IX74L+JHDGCCMMXVb
 rApUX/HHTAdVMHM017I6J2nE+Ow1PoO6GAY4VmYYEqrHP7y/7GFDcyEG2aHMaOOU6fnZ
 IJzg==
X-Gm-Message-State: APuU4Z9N98vkLSYF+n7vzIAqgSy0/el9EnWxohbWoyizq/gIhRQogvrT
 /RHxPw1Vhi2/SriHUf3onss7+sPC/OQF8j4oPDHtENTy+W+FReyfpQLmCTxKoYys9IrpUKARcvT
 C/Jsv5O4LwA==
X-Gm-Gg: AYBFou3jd/lGTiAORhsj2vPDqb77fq6bw4glByZR/31DxUV+Zpt9VVDWD9l87ITsM74
 2zpJds7ywC0+QuDLRyAGQ+FrGVWI8LVlUBteqH3ftNB8I2egeSJSwtjwaeSjDXN8+Nz+8zK4r4u
 pP6uIrBojui5CXr/tfFkrugzGvYVUG03/fHGTGneaSAfsrK/ZWNYaB4l2c0HwczYuaM5XcsoIUq
 DetVQSB6Ox4pcGir94FPN4nPz+zlHOKD8qSR+thqUCkbCwnW5G8GmL8mJnL/13+GKhgzRYMQwqt
 wjQKfM5cRPKJXPxkEWVYM/ccCxQkrd4YwYY5fJL7PRGdEOGHefyn0cZfI35tA1LMERNqCs951vy
 /NChNkL1fJ+KjmfRYY3FtvxJg0Cs7UdKQQ/Gb8x2juqZHPibT5IYPWU5kbWJOMwi5fwN6yg790T
 FitNeTUa4qC49hKsCrehSe10egL75RTNBxSW+MlEPMV11d8hwR+JNNhgH+Y94rAGTafLDDf8pCm
 RpEj/h3Er+qC6ocCm/joE8BttoKVgOqDGJ81fe3/yHxb6zBA1C7ulVVCbjs6po5qnDEwlagsQVG
 hyA2Klk7pxKKMlK7+Ab7E++xbNWiqp0VfSfCpeJZqHtT
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id
 5b1f17b1804b1-4bb887fe7e0mr58171035e9.9.1795168698950; 
 Fri, 20 Nov 2026 01:58:18 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884ab091sm103071385e9.11.2026.11.20.01.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:18 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:13 +0100
Message-ID: <20261120095817.537362-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109105509.1176524-1-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti for
 swugenerator runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index febf03773c..848307a0ba 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1372,6 +1372,7 @@ F:	package/vim/
>  F:	package/wilc-driver/
>  F:	package/wireshark/
>  F:	package/zlib-ng/
> +F:	support/testing/tests/package/test_swugenerator.py
>  F:	toolchain/
>  
>  N:	Graeme Smecher <gsmecher@threespeedlogic.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
