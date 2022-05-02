Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3649C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7878482AA9;
	Mon,  2 May 2022 21:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8jA00-DkUUj; Mon,  2 May 2022 21:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF0782978;
	Mon,  2 May 2022 21:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8986B1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768A8404E9
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIavKXR7gUPq for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8113B403BF
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:50:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id i19so30090312eja.11
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b0UQ6oLXPSROJk+fbICQo45Er5CrWLJSBjbmx5SmcmA=;
 b=CdccGLdDKcJbrO6yVa/JcPebYpfX75+qqriFfONpT/L/POcA5BfU26rMneI8VeLckM
 Xdv/DdM4a8Yagla9EC4pzmOIjci9u6SFuHCFxbnw30IfSACOJlNHxgrmb87kCI0y7Rxk
 GaGF6uyeDKn2VL3X9wJdpTIWo9RGUYGj4Wf2f6jN2VfuXLzXFBVttbysN0V/dOwYqrMZ
 ooehWxby7eOeQSsiVbKBA13cJC58+thPO9n5rqFymVn+DAG8utSMir10I53nkV6DLZjG
 Is0di2o8e2cHSjs7/ogCcMFnwBlGQYL9KWo0x9nG3F9FriU31mr25XfWzRiQY96/nANQ
 Yhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b0UQ6oLXPSROJk+fbICQo45Er5CrWLJSBjbmx5SmcmA=;
 b=J5RBem5O5OZwBVG0IuY26g+PGmToNpQ8MxPx5QxXa4PQ3eU7QZLM0tlO7gGdTxMwi5
 Ajnp9kdas7r4TnAGSNQyw9XLamPMeknXFRplP/5f7F9EpdN6FNZN5q3mzMdjjkVV1Zj9
 +0lgWDF8G5p7jnLBHhpVnqL5/LlPKaOh+d6DTr+yD3QdW2uGsWOP+cTfVy4R+BBzxnWe
 wmZSE5ImwCcSHGEe0YdSEmkfTZcslufdIf/JA3LRiYJVCPKZF29xJw7IXfAiJGxZ+drW
 vzts0spXXEoxYcc5QQNYJGkqF7bfyQNJfezCDKHxM9CLfLdqkmzR1JE3uFh1I2hNlURV
 Preg==
X-Gm-Message-State: AOAM532dj6NN10VvixDaeOsAuJLX9JunEQDZfiMsdUzd8lCDYkpJ7tVt
 F1eZO6QHj80W0FLozx6e8vJ7/w==
X-Google-Smtp-Source: ABdhPJxAGtf5j22Q8BQ7CFWc7TOOKJjjvUWhLNJVkKgFDa+3fIyzpkM9/f1wp9atG7PeJjABg++aWw==
X-Received: by 2002:a17:906:6097:b0:6f3:ee8d:b924 with SMTP id
 t23-20020a170906609700b006f3ee8db924mr13083092ejj.536.1651528235837; 
 Mon, 02 May 2022 14:50:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa7c55a000000b0042617ba6392sm7016419edr.28.2022.05.02.14.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:50:35 -0700 (PDT)
Message-ID: <2f808cca-95c7-0b0b-0d0d-c4465f9642fb@mind.be>
Date: Mon, 2 May 2022 23:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220429230412.788645-1-james.hilliard1@gmail.com>
 <20220429230412.788645-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220429230412.788645-2-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/python-installer: migrate setup
 type to flit
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2022 01:04, James Hilliard wrote:
> This package is moving to flit and will soon be dropping distutils
> compatibility support.
> 
> We need to use flit-bootstrap as opposed to the normal flit setup
> type since host-python-pypa-build depends on host-python-installer.
> 
> We need to add the src directory to the PYTHONPATH so that installer
> can run from the src directory when installing itself.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, with the explicit dependency, thanks.

  Regards,
  Arnout

> ---
>   package/python-installer/python-installer.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
> index 862a251415..5bb14e315e 100644
> --- a/package/python-installer/python-installer.mk
> +++ b/package/python-installer/python-installer.mk
> @@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
>   PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
>   PYTHON_INSTALLER_LICENSE = MIT
>   PYTHON_INSTALLER_LICENSE_FILES = LICENSE
> -PYTHON_INSTALLER_SETUP_TYPE = distutils
> +PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
> +HOST_PYTHON_INSTALLER_ENV = PYTHONPATH="$(@D)/src"
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
