Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE37EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368E460BE3;
	Sun, 18 Jun 2023 13:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368E460BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtpHf9-yYHJD; Sun, 18 Jun 2023 13:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C26560A99;
	Sun, 18 Jun 2023 13:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C26560A99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 893721BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62FEA60A99
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FEA60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9inTSaJgw3j2 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D74A60746
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D74A60746
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:27:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so351658866b.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094857; x=1689686857;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xfkzbj8+9+eXXOF70ul676/+Reuc7xA/oDSxluceyRo=;
 b=gI5PZTBSfBqYhhCRqnJodRVF4PL9sEcKTsSwXpa6TJvR9meMLA6btZOQSIImlQlguL
 xSOm6wvyg7ZdT/ctZKTRNXSd4vJLm+YeRFX5SKSoEc5y+Q1MX8FfWtln7eMH+hOPjvDY
 MhgTRwqKfkAQbXG1Jv9xQba+IObqc3qkIJISv2qgggpV8STKkh0kvpvLRCujN5JVtf1S
 C30SKtJTb8OvjfNamaVG5V/C5sZ+0/jD1Wxzp/+XqsR0Yd9M92XSZB3HibMxwrv5QlQf
 anJKVFIaNqEUo9TeX8ZULJgW/UTCyiseLJH7QgmP1mBqrUbklCcOzbJ4neQc6o5rYKCS
 g7yg==
X-Gm-Message-State: AC+VfDyBExtXfXVUxYnhS72K8cM0yJvxF8stx+lIeizBDmPdy00F8u0Z
 vZE2FsE5THwLpPWRAIf5PRBkCK56ba5CYFt7Vfk=
X-Google-Smtp-Source: ACHHUZ5BuJ4HnVYzneKP/xoKS02qT9s3iVkzqolfs9zL5aJZ9pI6oOcNp7huCyqJZelHrvOav8mrOA==
X-Received: by 2002:a17:907:3f87:b0:982:84c9:96c4 with SMTP id
 hr7-20020a1709073f8700b0098284c996c4mr6800167ejc.10.1687094857688; 
 Sun, 18 Jun 2023 06:27:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a1709061d1b00b00988017b8a2dsm1622061ejh.85.2023.06.18.06.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:27:37 -0700 (PDT)
Message-ID: <af3d341d-1f39-0651-9e3c-a67adf09261a@mind.be>
Date: Sun, 18 Jun 2023 15:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230606041819.2785554-1-james.hilliard1@gmail.com>
In-Reply-To: <20230606041819.2785554-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094857; x=1689686857;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xfkzbj8+9+eXXOF70ul676/+Reuc7xA/oDSxluceyRo=;
 b=SaBAgw9Xhya7NMHEZGtt6IHjdYbMIulJWmiDE+8gHH81pdZzU4pDCE+I4FH4RyxLxV
 WT5N2aTf1RZYXGCCQesjEe3sH928j/fcQY7iBwrHj6euxIvEYShQQxgUbWnQSOI2HW0F
 koOOe5ZBlTZ/2brj4SH/3kLNPc+V7ArA5vxMpsN/heH+lNnT+sYgFEujTjj+8Yr11CZt
 Rcf2Um3ZGhVd6oGEcxHEN4CHnUYc4TsLAtm7/AdJCcJw2WtmcOXwq65i/d984gJOmdaE
 Br/Q+7nuCv0uh/66IgSNjgmq+hlvnC9ern2i39E+OThDTbQpCRqNRx6chAJDN6SuQVgs
 GoOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SaBAgw9X
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.0.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2023 06:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/zxing-cpp/zxing-cpp.hash | 2 +-
>   package/zxing-cpp/zxing-cpp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
> index 5457ede44a..4018e95fde 100644
> --- a/package/zxing-cpp/zxing-cpp.hash
> +++ b/package/zxing-cpp/zxing-cpp.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  126767bb56f8a1f25ae84d233db2e9b9be50d71f5776092d0e170ca0f0ed1862  zxing-cpp-1.4.0.tar.gz
> +sha256  12b76b7005c30d34265fc20356d340da179b0b4d43d2c1b35bcca86776069f76  zxing-cpp-2.0.0.tar.gz
>   
>   # License files
>   sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index 1051376808..b11814d114 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZXING_CPP_VERSION = 1.4.0
> +ZXING_CPP_VERSION = 2.0.0
>   ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
>   ZXING_CPP_LICENSE = Apache-2.0
>   ZXING_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
