Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710EFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B4C60E56;
	Sat, 12 Mar 2022 17:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc2bv2-mH1YY; Sat, 12 Mar 2022 17:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D6060BA0;
	Sat, 12 Mar 2022 17:07:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60F931BF966
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DCDB60BA0
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcURxF6KPn-0 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:07:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47C0160B17
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:07:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bi12so25464599ejb.3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cnx/Y5xT6YOf12yxmZKCPsA7etsPK9llS3i2Lyny3UA=;
 b=UlNfZIiuUsvlEPrnvzcDZGC+awBewhi1B5MD4C8MmZuY/RytwRBQcVX8ebDbPzU9hB
 emlXGYXMqi/oocAthzRFB9JeiLTPmBRI7FSlqPn3XXShViYgIoMr/tER2EMXB4RwM44n
 VQHuvOFFqwDw3nge7vh9xhOlEe+mLbhAGcobhOHmKOuNxhiDWePpV9HeIki2gQ5hGyiW
 99KFL3pg8M7a3wrUUtpJDjV8Lopf198WsJAqI6k1KZgubfXJGehbFxK10M9bYWhbH0Yt
 IrLAnD3SJiWgkJn3Ppu/bLQwKEwSssW25fneRSy/ePxH931W9MieNzNUCKsChd9eqor+
 ixSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cnx/Y5xT6YOf12yxmZKCPsA7etsPK9llS3i2Lyny3UA=;
 b=lNVfR3w6IOdVXQSwqwr16UBC3euSlaDKoh3CX8FDGATXEXsv5JGE2vDn5cX6gYXLmt
 XTe7O6qRwpJ/3+yaT6jxMEKJXTF0cxnZgo6VRZBD63Nbvti+oMHCOgrJO9azJj2zn6KM
 yLTwIf3ICaFFal8bkSnurnnifmzLU0cFP8Xx/RbwgOn3elGO9/sQltRUc20KNX93mt4a
 0HVlLz/TvNlRRmb3YYzoww9ATlT7MeBv4ZQiuwPu2fbGMgJTLAQZX/xYjmLu3RMMN7e0
 rPoapPPYPj7/bRVn1DQ/pyUX6vq2xzFt0pN+CcN9+oRkmHlM+05e1Ds3irryb641ilEJ
 RYFA==
X-Gm-Message-State: AOAM532b8Wj9Wn2I8wTJ3EdWOlGvwr+oeaBo6XRqGp04qyq995xC3r6S
 JGql7MHcQKp9FrNJXq8Z6TYcAIE2JimknA==
X-Google-Smtp-Source: ABdhPJzrLpLosCYPAnlxrmauqtDNIOJAAvPIK8CCyLFBH78rpMSG0H5W2UX70e7pZboPK81ribJWMA==
X-Received: by 2002:a17:906:b50:b0:6d6:e503:131c with SMTP id
 v16-20020a1709060b5000b006d6e503131cmr12873180ejg.597.1647104865419; 
 Sat, 12 Mar 2022 09:07:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a1709067a1e00b006dbaee09061sm2094585ejo.0.2022.03.12.09.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:07:44 -0800 (PST)
Message-ID: <66ece35d-49bc-4fdb-fb78-d654caf0f39c@mind.be>
Date: Sat, 12 Mar 2022 18:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222113404.2609626-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222113404.2609626-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-web2py: bump to version
 2.22.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 12:34, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-web2py/python-web2py.hash | 2 +-
>   package/python-web2py/python-web2py.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
> index 2ef52b0a5c..5830b71701 100644
> --- a/package/python-web2py/python-web2py.hash
> +++ b/package/python-web2py/python-web2py.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256 44556376468139de874e9c29c9ef56e60ecd5f7536c7bee46d74b1f9d4178825  python-web2py-2.21.1.tar.gz
> +sha256 a779adc5626999c854e9abc976296c2c1059bf6988a421c0bfba923f9b08d8cb  python-web2py-2.22.3.tar.gz
>   sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 3e453282a9..b1897978af 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_WEB2PY_VERSION = 2.21.1
> +PYTHON_WEB2PY_VERSION = 2.22.3
>   PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
>   PYTHON_WEB2PY_LICENSE = LGPL-3.0
>   PYTHON_WEB2PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
