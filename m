Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E711EEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BE3846FE;
	Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3yddS7qlxNM; Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E5E846F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011449;
	bh=Brg5EZQYDJhfen7OQV3z6MmtuI63lZW99Ps824cXb2k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XkA3R731EvPjs7EidbMqeKK19TRlUucn7cFrhnZemxbOSlfwHbVxMm4Dl2T9ufECO
	 M71CMrW1Gqyrx2uqym0Moo6bWNQNE2Wzg1NdtRlwooCCY3V7brpD7awnx+LnqKkkEz
	 QLRQce7AZ8wwESU1i/7G5LYcnJvtHyfWS06O1u46WcmVYO9QnjAQY3gn+LOESoVtVF
	 H8gm8gyjx+hpDh1UwxrEgSm9T2MlePoazXy1hM/j5b0PHB6qFPKpXytPiNpqd1iP46
	 RuaIF2poKKCRnFi1oBtHd3GqeKgn1i8hU+h4oksOTE+NS7/KddVS1KU4ctlTuyHIOJ
	 GB7WyP7kAsFuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E5E846F0;
	Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF2A31F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85515845A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ac_1vLxST85j for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9218884683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9218884683
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9218884683
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48069a48629so11739305e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011415; x=1771616215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NGiZXsrdm5S8CSi68lS3DBFIwQaLRiVd4r06aLVICJA=;
 b=dHjmSDmNkSIe+Kt12G+wY7hT+fPp585EonuBe26StpBZmHS+fcKkiU7fw71aeDW88q
 nhbFQ0F5OX0fAZC+0M4we42rn/zIGBDtsyx1ggQ7EINhcHiPuvEQJ8iITtrl53mhndbd
 nnewDoIOahRfVj9wZbhtj9BInmqADm2eQhaKQVJkNdnBejZhJwsMjIXSJbmFqcGCZLFE
 cX31JZons5hZlW7C0p+79hCzT02oweBjYyh4tirWF8laV7mvj57w+ZOy/Nh4RapEgxwl
 hgP9l29EApOJMkiAlAcW3ZF73srUStOhWWoMM1Jddosf8piPOLEszj7P8sNjKxHtRbxc
 Q+xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXneNyAalz6NyXOr8XzugrIgk19imUEJvPgBq5lB57ahSKP550cgeIrlHFjwWscpcOe820XwGb36sE=@buildroot.org
X-Gm-Message-State: AOJu0YzPLJoT3sj+LWERzdnMNHpbWCC86SdUcckHr3N1XlpCEiCFdpzv
 nLnNE8fIq91LzEyQkYY6BIlq4PMirEqGFxxjsk3LHwDafnWnbuCiXZB+AzDnic/cZeg=
X-Gm-Gg: AZuq6aJ+hmIWF7p6Wvu3nnzlB/MdkYcCeVlYtYszwJ32cjrx6znkWmnxvV2cttxdUUB
 8kkwURQnfCwozMczXDmBLBBOvECiuPcOcoFnW2yjq4wNlCnQfo194UxDyNbYSpgZX61bBd1ift4
 iriv4hlbAJxcV6pI+s9E94MAPI9IRagZQHngBN5fAoyQHTtGAlzihkZyGwr4x3VLybT/wA3KxyC
 UyJhpArLhKR/o16HiTNniQoNaEsNb5DCXhRwvojtaXNnPS9PlVOlKcjxzRZAm/UXWO2XQafUXin
 +wkwJKlTxOcLDT2R2aOOQ+b2znztT1w+4X9L7wvNSBehhUbzDpsTJVDjZd0xYtE3Tko9u8vUv8w
 /xKQfG0h6WAKuh8oeDzFAvWNHQKarRl48tzZDyztROUA+NRwbMJXjB48a1+z7YSRs43detqpEfb
 PeiYdqDtGH0/IdSdQ=
X-Received: by 2002:a05:600c:1986:b0:483:71f9:37ef with SMTP id
 5b1f17b1804b1-483739ff8f5mr57939435e9.8.1771011415544; 
 Fri, 13 Feb 2026 11:36:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm7342106f8f.2.2026.02.13.11.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:55 -0800 (PST)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:54 +0100
Message-ID: <20260213193654.38557-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ea7cef9a9d5fae4f69e8e177a54202c60b6ba13a.1770208629.git.yann.morin@orange.com>
References: <ea7cef9a9d5fae4f69e8e177a54202c60b6ba13a.1770208629.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011415; x=1771616215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGiZXsrdm5S8CSi68lS3DBFIwQaLRiVd4r06aLVICJA=;
 b=ZcpGwtFmWe15xd6k7s26aU19H528C+fLQzLG+GicRyHeCSlfe6PNoNuEs7wXZ6IcKP
 Y1kOr0HR3Gnu86miWiVi/oMD/kBO0jr/jEq6O1OhzKCpK1KWU2P0vAOlPU+6hDRic/oO
 +4R/+nwsG0sJ5VOTsiUykSpcvbnpwvEY6Y0xRTVXkwj93mL6o5+TFjNPRJZiTGM4BN5z
 kX1KN8hiK9voO4V8QiX5KjOv/t5gxzCFiEcAWRPxY/R33lbWoJASodyTqdJpBxl8FqpP
 1oTDBePz9GeaDhW1RV0f7h2dG7oJqjAmfJDPPIzkvazbNgVOrKLpmPSIilZrzPgPMYHi
 51dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZcpGwtFm
Subject: Re: [Buildroot] [PATCH 1/3] package/blake3: explicitly disable
 threading & examples
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Use of threading requires a C++20 compiler, and the oneTBB
> implementation. oneTBB is missing from Buildroot, but a system
> one may be used if found.
> 
> Even if the default for threading is disabled, explcitly state so, in
> case the default changes in the future.
> 
> Also disable examples, we don't and won't need them.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>

Applied to 2025.11.x. Thanks

> ---
>  package/blake3/blake3.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
> index 9d1323192c..1055a2c073 100644
> --- a/package/blake3/blake3.mk
> +++ b/package/blake3/blake3.mk
> @@ -10,6 +10,10 @@ BLAKE3_SUBDIR = c
>  BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
>  BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
>  
> +HOST_BLAKE3_CONF_OPTS = \
> +	-DBLAKE3_USE_TBB=OFF \
> +	-DBLAKE3_EXAMPLES=OFF
> +
>  # The package is a dependency to ccache so ccache cannot be a dependency
>  HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
>  
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
