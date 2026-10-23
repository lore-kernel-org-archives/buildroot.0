Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2E606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fdPrRP4B
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 126C160873;
	Fri, 23 Oct 2026 13:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZrWuXr8v-p5; Fri, 23 Oct 2026 13:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1610F6089D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761676;
	b=JokxqfDqfpjNoHfEFXTWT5a/YLwKPBYB8cSV4bluStLS1pXFPkufHomWq8nGgxSpXLCI
	 8b/qwfbutZ8BHc74FbIo2miRAz53qgicdosrwOrOaXZYqkGjkrlVNQcNBD3U8xMBqErco
	 5EtY9MCQ1fRQQTNTH6OnSEAsRF0L/R1CI5LCazy4EXLg5ak6tPWeTSA1x9UUJl0GQoR8K
	 IBFcht2hq2F5x7xpb/xy+dtb37EUN/iijmnyOdoSuBgXQ+exJwH0v9mFgCBkXwOgvOEF/
	 fpRyspf1LP0wpiXYZVbCYYr3pxMRC+uSdUYjsH83M3CJ9UMMuQYWkhQ9GBBrNYmndsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VZ7Bm0oIQYWgn+xRc4Te2bsTa8HROGE9veMJLU9qr8k=;
	b=f7PTrkBBucIrGKsFX8n6M7FfO9xcdv7lF45FfDP3CNpArm279Lx408RhKYt3rJzwnCHD
	 V0ifYfo3J6MZEvwzl9cvq6wAs6YZJP9ybsJdzheVyOYfxitOndX+VqBDBru5GnRUqXWjT
	 XfOqMLbsn4/jvtnp0io4LgwW2/da4CbUD7V/oMTm4yPAcmUMtfhxio+l+EqeJ0qmRQaoM
	 SgFr+ld0kJiYvhP3hK0MWeYWtjKQ1Phs5RF80XOIJKoMWpSivZst56CWfIDsNMtnzQsHc
	 lmoPEgksLx3K4Y3qSl8BJi/CE+LEMc5BR2c3BwCrbPA3XjqsJnKKL3kqGuPVYv2ifHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761676;
	bh=VZ7Bm0oIQYWgn+xRc4Te2bsTa8HROGE9veMJLU9qr8k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fdPrRP4BGNakcwLVpROYlurHdnbpJWARoFZX5eodRGd4nSk7+7slVmrf7QeIpjk4O
	 nVgkazNzZc3Ih5XYdU8KSKIjNE+N60zV+lx0Z6PwdAfiLbk+kj0zM4cos/zfKLVwc+
	 fJkSix65XkswK+0ZTMcGViYxHOVqUiUk7gYCXjV3RtZ5Wrihfuc1YQZZV468h+z57S
	 H0RTvg9dVTjyZO9FGaW1nBKKJGWnpWqcLC78piuaBCKZsumMAGKop6/ELosupwjS/b
	 43Y1oCIbC8hClml5uhjPY8fAEWQbC/wuGUlAGGFvzGc4v3Dg4RKyhWnx/ut5SPeAB+
	 4bE7JhZa1fmnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1610F6089D;
	Fri, 23 Oct 2026 13:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5500B356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472418148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RiuFu3OBbsT for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 109E181496
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761674;
 b=b2dL0/+VUNYzOoyFPOh/BxV8eaKJyH4xOwmSoYPeifvrOwNJN68acPkEKguflI/JgblB
 LctHQNbjSqZEfzneBZ/zpqtPciQyVFxbAnVUto28OssxgR/gzQXYtXHRjxFEHNlHaqdtn
 lnrtXRc/J3EG3cgHrrpbZHvjMwXK1ip35Ntqfs4dcyiaLUSytomKbWnd0QIM1t2LcQ+h9
 oJt0mlFyHxzqT6ZqWZqMpsEGbQb0Y46OPdkji2EW6sfuJ9D6Rg8G1I73ujqd9qETrMokK
 dm8IfFa01H9I39mFR/rEZ7UVuQzFki1aEFFq85AERBir4HFKCsyYnInLXM9dZUcoDbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761674;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=RNf7KluOFI7e9ehot11n/cbcvlxnBG1JGK7JLTUYVTM=;
 b=Gxun6iMLB9YfzxPCp4D5l/NcNEW/Po3AmwtJpQBhg+offjkWtdR4qbbqfe02IkBIM1EL
 4RUbPY38K3MPyngqGDumhCLfX8ivnyBv2ZiwKtA9zeKqrhxbls6tkKbDPOcehbTgvk5nq
 W9iZVQz9i6CSQTlQZcWz1r9v4amDp+coYOxaG/H9qvr8aHsZlQkJSY0hjtghxiMHp3S2y
 5zJICanMQFAy+lVprhqelZGdQUT9PUE6bK7SBJnNsuiyFIXINhynoWkHIhzW2NUqVQ6MB
 fFm9NtB2pHdDUIkEhfKuHK3edrx6rRpi5vW5XXwy/8ze8JV0rCeXdpQ4rW5oE6ikiIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EOgpCWpm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 109E181496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1ec92f655so9021865e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761671; x=1793366471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RNf7KluOFI7e9ehot11n/cbcvlxnBG1JGK7JLTUYVTM=;
 b=Ps6JN/Zeww9VI5TvKd/xozJZk3NbOsntuU48NSSD1kb4viNN62iOEiXwjrpPRWscwK
 GKAUjdRn6horaavmBI1nwVAEc6Tj1gGpWA/U/1WGeqykd+HWffc+tUaarnA6KA7aoVYl
 zTpC8dgvNU/HhwpVwmnGYSE3Ms1v9PvwlVEhVTAKsapzChcbqRzEZj6vF8xHGN9U4NSh
 /8yqaDsNcosGDBRVQ99dNKA5l6o0+/PsBf7a4YKVYRQ5GTg67k/eqScVUW/j9iA4hXB2
 MX8oRUr6a/59dpCtaWeBZgaqnHpZVh2j6O4bHR8c6VPkYcAvKqiT0SzT/E8FCIU+7zSs
 tPmQ==
X-Gm-Message-State: AFq9FYJLinp4xXD3Wtkm5CYF3wwf0KCy6vxB5NZGcREkjqsXfH/sP6qT
 3oR5cp6769UDerVam18dijp3mbfliU78AlsjF/ViOM69/PLwWDNhY9q6UuhS4yK84P+1r7WhCj1
 vV6Eg1xA=
X-Gm-Gg: AYBFou0XKeTI9XYLP4zTCYLvYdyY9rOGsbuhQiaTzQyEjaThGr36fhjocpXx/7PhlHq
 yV/YgxG7aUYtheh7BZQRFIvklObAwd8IznXtPA6UILAITi4ebaBKS39PlkTEFSov1Cfiisq8Cyg
 xy2xBnsVT+2xeemqNDAYuessoYoSfhWwvxB4K4mh/hcyWABWqJsnAI/ANQl+I2LasTLcE6mzI/j
 D3ismEn975G3T8bR88h7qECwkoOEFwzS8hiFlQ1pOQ2rdOTLwdcum9WEni2ai3sVormo0zG7OFZ
 CENcpqT3i6G1kqC9HnSJZ+quRdfQLUlJnooUnyJWbWQh6jdx1uYHilQrZzmEiiRn7aXus14tk7s
 RzwGUkH9opoZ9/LLCZSSWlQOVzk7zFfk3S5KuCxC99sAhOWwg+GFmzP1efvtmiopYOtCNxlLWWo
 zDL5lR1bItUT7n9FNEnKbr6X6Kc+gTI9LM2Wa8PEqUKVX41o4v85I1G81tXDPk65crBhBRZqbXm
 YwN/PGzazdyfilqTv7u9wt1SJofO5FDjeLAVIwdc10ENiO5VxIC5LhXew==
X-Received: by 2002:a05:600c:6289:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4a211bf040emr38123015e9.2.1792761670885; 
 Fri, 23 Oct 2026 06:21:10 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b065c850sm3622155e9.13.2026.10.23.06.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:10 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:07 +0200
Message-ID: <20261023132109.1607523-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018182507.536698-2-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.18
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index a0c24e66f3..c6e0206ea8 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
> -sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
> +md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
> +sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 17c6925ae7..5430596350 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.7.22
> +PYTHON_CERTIFI_VERSION = 2026.10.18
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
