Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D582C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056C24099B;
	Fri, 13 May 2022 22:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i711xlYg10y7; Fri, 13 May 2022 22:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FB74095F;
	Fri, 13 May 2022 22:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71BBB1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EFEF8271D
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZlcg0B8HPeM for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:09:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9519E82726
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:09:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i27so18638959ejd.9
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b9js7sXrAIb+jcb+evbQNny8mcF/HzEyJv3fwsNWhJM=;
 b=GxzuYAqbcZT7b6/h1dC3RtxZ+GOV94wML8OAS3Uc00UXCoLss0hKiMtCwHY1kzclkm
 E8w4upWU+oXnl6Tqu7a3KGyWhbvpdeotr4VM1mqqUp/STX5LiEbalnUomSvPLKLEuN7M
 GzN9vuriaYHVwhg3Gs3Sfwsm+IlpDt2Ip14BTGDw9caaqYEDthltiXlrDlzGaWhNMH7E
 1/RvIWTb0/tcQQwPz4dNzHtkXvuzfALldPDwe0ofCaoUkl9gkpYRIZw7kncvWMAlIwx/
 ghQWniuI8wJFlxY/SBGE/GFrsYKd4z+brH6i/g3DgglUNb2fSRUmF4odT1o48po9AIIr
 OrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b9js7sXrAIb+jcb+evbQNny8mcF/HzEyJv3fwsNWhJM=;
 b=shZe1yTarlm1RHfW8wd2ub7Pww1nLiKD1qHlhCXWCTALdL737nUJXnZGyOVotAMfmR
 Apt5o3gI5wvy1Q7VoImGOxS1FXUBKMxnsl0J+7NHjyqG4kHgxe1SHyT7zv40vo1cYAJn
 QUBwkkUBpgWrnCabvH7njtJPMq47OcMO6POVS3Zi6M0vDDRBy08Q+vAXjjuGKvbuxomq
 +01AkRlsHxR0Tpv75OFzREB2QtwVzzDPfApy6brb6iWKmXKH+rqEjEEiUUrCCqmwJYw+
 rHLWtWf+Pd2H2LDCTVRKwTI1TzT0QpcV6L/B77gotPrNPsfKKJNQl6il1KjBT501WsRe
 nIbA==
X-Gm-Message-State: AOAM530sgc092tQVIpr+6ppglYnzMhZEIvv+nnspgylRlJg4x7eZScxp
 I3oj2xbCU43lxtuYH9HSO4IragFQ7n5fRQ==
X-Google-Smtp-Source: ABdhPJyAXCiKRYQ6sPn6zMOU9yYusr7YvuvYBAa8NbXDNXheDuTtP60K3JgM+YiF/LeQdxQDSO9Asg==
X-Received: by 2002:a17:907:3e99:b0:6f3:d1e1:23ae with SMTP id
 hs25-20020a1709073e9900b006f3d1e123aemr6186456ejc.470.1652479755814; 
 Fri, 13 May 2022 15:09:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 10-20020a17090601ca00b006f3ef214e38sm1160630ejj.158.2022.05.13.15.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:09:15 -0700 (PDT)
Message-ID: <55be7206-94a1-d3e2-05be-d152c79656e1@mind.be>
Date: Sat, 14 May 2022 00:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220508232934.1360876-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220508232934.1360876-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 37.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 01:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cryptography/python-cryptography.hash | 2 +-
>   package/python-cryptography/python-cryptography.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index 0649207426..b51945a928 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  d7718568773810e42481f51f810919f5501ad252300f4d1b36bb5127b2f6050d  cryptography-37.0.1.tar.gz
> +sha256  b8ebc656926a88931d1822e3060001e288ecc7712feaa9fe7e1ddacd675c0a57  cryptography-37.0.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
>   sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 7714b9ad88..99eba3eeab 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CRYPTOGRAPHY_VERSION = 37.0.1
> +PYTHON_CRYPTOGRAPHY_VERSION = 37.0.2
>   PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/3d/5f/addb8b91fd356792d28e59a8275fec833323cb28604fb3a497c35d7cf0a3
> +PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/51/05/bb2b681f6a77276fc423d04187c39dafdb65b799c8d87b62ca82659f9ead
>   PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
>   PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
>   PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
