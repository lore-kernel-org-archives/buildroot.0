Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A90606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PdsKPtmk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABA94056A;
	Wed, 25 Nov 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTeXgM2sZGu8; Wed, 25 Nov 2026 19:49:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 312BD40533
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795636187;
	b=AMZBU6I20LPraRSjzAYQlWN4PmA+ydqknTQzIaX0LIlFyB0QCAwAzs2T1k4GSvFs/9rV
	 dCcPvOFrDS1iz36WSW0kswgpJf7HvWQIv+Q6DmizyCN4m1N8LR8W4xhY8aNb1uDlQjb4Q
	 Kg5Sxkc2b+eaRWEzeabFZyCx/F9sYBMIvDITvpPVM9L+i+cAmS78yhSEBf00c7i98Q3Xa
	 PautUIIRSTgYMFN2z89Ii7YLebjPWpKzf0/12/lgUYwkhQv9VnR3bNg4iSI149WA/9SSb
	 YvwuBQyj4qDNU40XVTeBMeRtXEFMa0DlWxK8RUoy7mVHBVFENaFDIa4s3/aqsDTfI/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795636187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=V4HTWyOGHVRhwqevFUKEEMMS44gm581+OlKbQ4B/V3A=;
	b=jq4mmK1rY+j6nrWmKIS4pEEe2JZ/FVImn7mLrlW7J6AFvqQlwP1hCJ/hDurQ3rshWUzy
	 gdGaEjaCycbfDAmPd1lxbGwJafXBfqWdZdHIHgR8rKZjTaY/1EshCCI4PO/PF4bSks+Da
	 /U6HZ52jkPo8X9MXsr/dsYkW/oLcIAmUncON1xfCmF4DsKP4uFL4tNFfe4RIL4Bd5vj4e
	 OXaHbO5StGRpEh0ctPTKMPh70YA8XogQVA9Vt2gAEc2uHi/fx3qMAqqEbxkuJP4uqbXzl
	 lzw+hZ+kWOAWdpuYwXNkTf97cRk5/O446npd2AShPChNFW/RmCPE3pJu/7YxKkrNaSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795636187;
	bh=V4HTWyOGHVRhwqevFUKEEMMS44gm581+OlKbQ4B/V3A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PdsKPtmkcOjxUdtuzFaOcEbHKCVrXLlrhuhI8DaoQ9OO2NimJWoYuI941iHrKl9ye
	 ri8DC4u0lGshgLBu1CvBTrSoLKfotFZcHCJCUBVVDfdcAdL0czjjjXgIOPo0UF79N9
	 hQenHe87FPPOjO+fONCsJAaUtfMnuLxHGrMN416Rq3hViN0q8VKNA7BdFbz3bXG9BV
	 Zr9Da27A+rTilkHCwQslhN2Ju4HT8jkn58NS+CuFKVsTdLrZBgk1TYn0IFCqCaxOFk
	 zybEFzfcMOb5BnIzLL8FK8BDOtGmT8Hy2WnzAJLUjrAQsKwGvft8Tv8P2KJQEqIsgO
	 m8jwm/1440oNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 312BD40533;
	Wed, 25 Nov 2026 19:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7910526D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 762DA40087
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TfLtH-M3sRo for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 19:49:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DD50240050
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD50240050
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:49:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4125813F861;
 Wed, 25 Nov 2026 20:49:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 25 Nov 2026 20:49:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 20:49:39 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
References: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <5a76e3f3c5548edac56a032707a0bc0a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libfutils: fix build with gcc >= 16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 18:24, Giulio Benetti wrote:
> ATOMIC_VAR_INIT() has been removed in C23, so with gcc >= 16 the build
> fails with:
> 
> src/random.c:338:31: error: implicit declaration of function 
> 'ATOMIC_VAR_INIT'; did you mean 'ATOMIC_FLAG_INIT'? 
> [-Wimplicit-function-declaration]
> 
> So let's add a local patch that initializes the atomic variable
> directly.
> 
> Fixes:
> https://autobuild.buildroot.org/results/819/8195c40c826e1b85ced2aec5d1e8705542a82c93/
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
