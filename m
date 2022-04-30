Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FDDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D394040C;
	Sat, 30 Apr 2022 15:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5LUEtD-jTQY; Sat, 30 Apr 2022 15:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FBBB40439;
	Sat, 30 Apr 2022 15:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0261BF28E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B374040C
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0g5tbSAxg5V for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 213E940393
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:50:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so20566038ejb.8
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 08:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JEzzTc0LpgfoqxpJFWE1xS2G1Bu3Rd1WHga6ivryOgk=;
 b=ZQxSapeio/pKjYPTermC2VmhmO9tsBnV80Qu03pdo7J3tEchfbOVAin5g3mRILt6gV
 k1CtmZGRmPpBrCTsAiXj4PiwKfGPbqL1KFAU1dKAaCG3S9OAXbxuziEGr4BoFAyG1roC
 H/yMyGLSRY8v/EYTHOaDTtum3eeUYPIgxnCB9uiaonYZVKt77xolbWUsnfVmfK5r+jzC
 t9OfvQ+E0eO3iOwpEm8O5ibLpLosGHhhiS142aDr2YTXgvvxhbJ4VTeELEDEdrMVaCX5
 BH/dOQvEYrD1BH6J/lP1isygfqX2xYbcpfqIUEF2R0PlTQuiReLStP87lbRoAE8QLfz2
 Yh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JEzzTc0LpgfoqxpJFWE1xS2G1Bu3Rd1WHga6ivryOgk=;
 b=dQEMU070rGalNQRsm+UXOkUaSoP+wCDEupDn6ZXx7dJtgMgp4IVQUsffEd2PN88MCP
 J0Ry6wJmnhd9I2l/yhhVCXdwHciA7McmuiFk65xHyauj4IaWbFBABHuu5qLkwFRjpPWl
 RsCj4v6wB5vm5dTPh+xw9eaBNLjq24utLxXyXvldfQfJwU9NBqYzJGmWqsyX2DyAEcpC
 jGueM0OSisDMWGTlZX1Ay7DdpHLZitF8M5W9ZKvyqtvfjwj2ntdv1pcCe74L82sHkyE4
 9sc4XI1vq/l9RF7I8url40yCu+cLiQYoFuZS1uHvnmeTGL5EjImhD7CTkEjyjV39GZ+P
 B0Yw==
X-Gm-Message-State: AOAM530ss1lf6euKOE7BbfdqHE6X3hiKQrqZJartnI7HZIHQcZKvWUP7
 CJnHd/VGIEsJO8xBYMm/rwaMtdHrcMD23Q==
X-Google-Smtp-Source: ABdhPJzNxJi+dVJrBXAPVA3KPBWlRZjwoYbnQW6HJlif4Dx3m1f5bxk5BNAjLhyyJrJugS6AFMvg8g==
X-Received: by 2002:a17:907:3e21:b0:6f3:bd59:1aa0 with SMTP id
 hp33-20020a1709073e2100b006f3bd591aa0mr4337805ejc.682.1651333843197; 
 Sat, 30 Apr 2022 08:50:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b6-20020aa7cd06000000b0042617ba63a9sm4225705edw.51.2022.04.30.08.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 08:50:42 -0700 (PDT)
Message-ID: <58b13027-d230-b416-a5c4-2037675983df@mind.be>
Date: Sat, 30 Apr 2022 17:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220425144213.3937-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425144213.3937-1-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/2] package/libmnl: bump to version 1.0.5
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



On 25/04/2022 16:42, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   package/libmnl/libmnl.hash | 6 +++---
>   package/libmnl/libmnl.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
> index e5bb2fa603..b3665767f7 100644
> --- a/package/libmnl/libmnl.hash
> +++ b/package/libmnl/libmnl.hash
> @@ -1,6 +1,6 @@
> -# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2.{md5sum,sha1sum}
> -md5	be9b4b5328c6da1bda565ac5dffadb2d	libmnl-1.0.4.tar.bz2
> -sha1	2db40dea612e88c62fd321906be40ab5f8f1685a	libmnl-1.0.4.tar.bz2
> +# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
> +md5	0bbb70573119ec5d49435114583e7a49	libmnl-1.0.5.tar.bz2
> +sha1	63c6456b77f7978a7b37e62c1b38346b2ef2d91c	libmnl-1.0.5.tar.bz2

  I've added a sha256sum, and updated the formatting to our current standard 
(two spaces) as reported by check-package.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   # Hash for license file:
>   sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
> diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
> index d3b33db2e0..3361d05248 100644
> --- a/package/libmnl/libmnl.mk
> +++ b/package/libmnl/libmnl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBMNL_VERSION = 1.0.4
> +LIBMNL_VERSION = 1.0.5
>   LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
>   LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
>   LIBMNL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
