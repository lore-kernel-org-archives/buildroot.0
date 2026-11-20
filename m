Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340C60A262A
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g+DoFIoX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D010A40ADA;
	Fri, 20 Nov 2026 10:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygjccs6yxAtd; Fri, 20 Nov 2026 10:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E400140D5E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168873;
	b=Z+2HnjpoUHQACgiEkE+nX/ctaLH0ONxC1LneqDPnAh3C+DWQcXM3VELB+8AHSNryU2/G
	 esrJ7NuiBUr6VBCRV/5xZ2Kte31iXSvWYoKq8r47ASH7ZOSjxWTTU0VcSs2qwTDBWm7O0
	 Ow66YqOJirFmQbWAhsR8RF0eNCtfyN0jzhzX/YYSnc6+5GkaFB5RHkSZoDSw4WA4WgmTN
	 YoZ5OZJoov5chU2e9GUIJG4O+nZ2xZyMD67fmKb70BicSpcGdYC956sG5XcnWjdN64ghi
	 A18PWuw5pf5JgkszC/4hZJImxDih83LdIFCiacT+hWG4CYCTx1Ik1e0PUCMFLUZXFkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168873;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YioybG9LkPtlHVydIBLk3m0LVWnA8cQRNvr5a/aWqGk=;
	b=C+5fV2zDxaRwaKSUgyDem7Rlx8LDrrsGG//dZN7dEQgguG5hdZ7wB6V+6n3QGwte8Evf
	 nyYsjJkZwmshcGsjGG/1u+Oi5JWbxiJegUnPeMrRi845bgLsYIgyET7jKvOjjBV+fidsB
	 Kv4EpIAEU1tmIYNHZK0tTq2F5ZVSRiz3tv9DbeIi4vZYzboA/IjiutjFIQ0VjZNulC1G2
	 Rkm9kj0b54ugAq4207ISYXMj4jX0+pWK9/1ihS3ZPCa0sCzneibdg1qqoO9OMldxQ0MxL
	 Ldb5uH9WnqnDxjTXuA6K9hu5fCgDc/rVV8eX5BFZJXwW8kxXI8GbrMdbTTK20ImBr5w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168873;
	bh=YioybG9LkPtlHVydIBLk3m0LVWnA8cQRNvr5a/aWqGk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g+DoFIoXRW0phfRjEna61TWzKqrRBkv7if9WbQR+LGOD5P3Gj9rWqT0Ce5OGprnEn
	 D9QDdEsjqSr0MjK8GJbq6Z6Bw5f1Mxv9nUMyfNmJCBqSTcqpLduKpcigX/HGx9ELhm
	 NwiBB84tzmTEgqh9BxHpZPtaKeNIWrxMyPTVj7xVXNrgCGPHrCKxR/qG14BK2w8TsS
	 4USsIb56hbk2uBUnZdv9amuNpqdx4olFXTZY7GknVKPz5KWE6TlRusgLdVP5vEzooJ
	 i42uNnBlEAyEq3hLaIVqAKQrraVSmBzbVpYT6gXdJ2XL5Sp+XLoLm4YtyH/4NoIfeS
	 AXhIEiZjThnOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E400140D5E;
	Fri, 20 Nov 2026 10:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBAA2E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D949A60D8E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9z5dRVyeptz for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C4D95606A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4D95606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c445c95d553so102880766b.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168868; x=1795773668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RkLCuNRLvHHhwcsTi8Z3kCjG/VwMgia763JjtYdayCc=;
 b=j/N9JICJV7UEpKNJP6a06ji8h46ioGXTMjLUIw5tF5JBcmf7CJD2CjJ+8vo6ez990m
 Hf18GaraNHAUYJviKeaWeAbfVPjMXVi2MgZUbKPxnWZA2IOdM1uY+Jp3k/1HJzZNZ3+x
 H9+qxW6Rcw3vwbZXTdBFZSFyKI+4op1fi+l6H4lEtCdmlVqv7Hk0ENEarVMHzlU2EfQT
 jPm4gZv1rJGbV+/aNbF1gxHz+oP2gDHX2WHZFMejBjD+hc9879alJUybeQ55iEj+xbLA
 0dhjtM1KmV7ffWhTh2oJjPjkN1zc6BKmyWC1pr3E8Mhv+Uo0NAEDQy9pobsbfCfVMGBG
 ymEw==
X-Gm-Message-State: APuU4Z+IxIc8LYHWFJhBCg+Kvy8dmaTze8xA3clxJjOpGSx5JQbej77c
 mx9V2XMrhzuF3hfWy50H9zUcOruEvIt3rM2qhjAQ3aFBuKiuSgeiG1klqFW3b7kp1Ta5n/DqZZw
 Mqot6roOctQ==
X-Gm-Gg: AYBFou1hJjdufn1gGTebWms83BlRsuEabgpfBXSA9olsprAOJI78MOBdl7qnmHX7EEK
 /4j7aucg1Vy4eHCe6hCThW7hAB2F02JsrFtQI58vZ3gHR92kECPDqxAZzMpLKuC2UCi9ojUWg4u
 qdx/wU9802SgbVAIzpNKVGQjHcXXAEyJgcB6nWr4uNzrx7p0ceeH83cWGjTXXSIp1x97ia1coLq
 c5FMaOKnX802fSg4KgNhIQPkYLN29jypVEt6AhFiySlnzMgFNbspQfONOBr7m2lJqUs0Fp9BzHf
 R0BjbjIUPX4qXADD2lKSmYlX/24+6o2fkhWa/o7zP6PEVSz4ryrc0lfogEw9xOy0Fw0dQ9GSOJ1
 pLk/fprVQSZ+pzMbo9EcoujMTW4wwfcnejEDzZVIB7xcjzVl7xBnEuR7/c07AftjD4PnHokNDeN
 3KatyTjN6cDFndla3Gu9YcVWPJyhHqTkcNosQ8NDnevCmNtXP4s+QAk27/5XiND85F1kLmZkBL/
 LcLtrIxkTcy6WBQMmZrG4rRMNXKec6X926fafK/C3kou/fVQwJr2JrZ3T9gNXIJGc+8U2bMzNdr
 YZHD/XX6m+aMTA4hJDziMsXn+/gluni4XDZxJjbhOekg
X-Received: by 2002:a17:907:d7c9:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c513acdc64bmr243580366b.48.1795168868168; 
 Fri, 20 Nov 2026 02:01:08 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f204sm5203564f8f.21.2026.11.20.02.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:07 -0800 (PST)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:03 +0100
Message-ID: <20261120100106.542645-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115120424.1235918-1-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_grub: fix test by
 selecting BR2_i386=y
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit [1] changed the default CPU architecture from i386
> to Arm AArch64. The test configurations which were relying on the
> default i386 architecture are now failing.
> 
> This commit fixes the issue by adding BR2_i386=y to the test
> configuration.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158060
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/boot/test_grub.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> index 8f081f927b..92350d60f9 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -6,6 +6,7 @@ import infra.basetest
>  class TestGrubi386BIOS(infra.basetest.BRTest):
>      config = \
>          """
> +        BR2_i386=y
>          BR2_x86_core2=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
