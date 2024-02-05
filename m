Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247CAC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D724760F2F;
	Mon,  5 Feb 2024 13:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D724760F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Or6OAixB3zBB; Mon,  5 Feb 2024 13:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144456101E;
	Mon,  5 Feb 2024 13:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144456101E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5D41BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56AA260F83
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56AA260F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGUbbYcEcPn6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:27:12 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F06760F76
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F06760F76
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fb804e330so40237465e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139630; x=1707744430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2G+31axLe15Wh2YwgeGJEuweDFsAXB3QRd/tCMmv9s0=;
 b=uRa1kZYmZW9UdJ0tgfAQHouQSZ7JqNQppks9KaNMqDFL3z0dnUQly5G4keSy+lufCx
 ADbXD0Tr2AeMJx93aJKRZ9ewKA8ed8BX35BoDGrZvpxQeCQ+ChksfxA51T6HZeu4AJzV
 6uuCYB9Z15NKSVxynBVUB0HX60xLU39Ip6JGXfSs4892wWo9pOlE+nPd0zeChJGf58Q/
 85wBAhlojNO7UyNIYPanGSZ6kzYKsfj/9XEFDZu/NEiPgBx46bk2PGUECyQdkMr9PHny
 8SEq9u2itn2ccpeVOADv03Bv91OnN6v5W+eeVjEuA/F0bcANQhWxGYepQeDIsvAX8N3+
 pBYQ==
X-Gm-Message-State: AOJu0Yxpz+DtzbUY2ik93lmVb0LWOo/R5y4Vs6OXBL3QuaETtR7wUGTV
 WwhmP47G623f53OWngVMgqZ2eu/2Y6Ww1dJEKjfq9AW2g93cNWU532xqtb9OSu4=
X-Google-Smtp-Source: AGHT+IH1whR8iIFco+UZiMLtYJQ4HMl/DffjRnj0hHf+V+0sigBQ4KR5Ml76hTzQXAKjRIlUVGx5cg==
X-Received: by 2002:a05:600c:5128:b0:40e:7d8f:6b1a with SMTP id
 o40-20020a05600c512800b0040e7d8f6b1amr5457056wms.5.1707139630427; 
 Mon, 05 Feb 2024 05:27:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXWhlBB/QbtafCTvmAZptAgWVpwOLWB1RK2P5m7fv8Mv2V6yB4d2cx+VPtH+rxddg4KEjzGLdDo096QSi+1Bz47Gz+4fmo35w==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b0040efb445698sm8658543wmq.5.2024.02.05.05.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:27:09 -0800 (PST)
Message-ID: <dacc12af-51fd-4e73-94a8-e061fae91325@mind.be>
Date: Mon, 5 Feb 2024 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108072233.3485954-1-james.hilliard1@gmail.com>
In-Reply-To: <20240108072233.3485954-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139630; x=1707744430; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2G+31axLe15Wh2YwgeGJEuweDFsAXB3QRd/tCMmv9s0=;
 b=NiQ5M0v2vxarYr0HNYOiMGPxm9YC89nBIV78oufYSWOVdY9nBSmOQM+3W4OShArl5y
 5buyHCYXhdm6aVK69U4WRIzA8JwXddxxJzP1H0aj6Msu6Kh/Luo0N7gFUl+P+ppFc0mJ
 u4FuwCKbNP9bqxHSYMHPKi0EUQk7a2f2NDMg0gXulX1UUr9H/fUwcLyx2pDMK4UaDH6C
 xbO1x0Tt8pwABOg0pwdDbGmGh0GKSTK+j7401zWJ4HFrYvR2g0isLag4zHZn5TBAprCN
 N9czNMlZzDTUKAoXK27KfrsO4fciLJ0+Y4YflXPiIHYdVE5EezEfIypp+/Ry4xoUfja0
 nVaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NiQ5M0v2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 4.1.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2024 08:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Fabrice sent a version of this patch that also has an autobuilder reference, 
so I applied that one.

  Regards,
  Arnout

> ---
>   package/python-bitstring/python-bitstring.hash | 4 ++--
>   package/python-bitstring/python-bitstring.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
> index c2ff9a69d5..1889983f47 100644
> --- a/package/python-bitstring/python-bitstring.hash
> +++ b/package/python-bitstring/python-bitstring.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/bitstring/json
> -md5  1750c35e8e45f597725037d35eed9ba1  bitstring-4.1.2.tar.gz
> -sha256  c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf  bitstring-4.1.2.tar.gz
> +md5  3909415d89586edabd577b62b0d0c1be  bitstring-4.1.4.tar.gz
> +sha256  94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213  bitstring-4.1.4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
> diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
> index 9a5d8dfe84..983491303d 100644
> --- a/package/python-bitstring/python-bitstring.mk
> +++ b/package/python-bitstring/python-bitstring.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BITSTRING_VERSION = 4.1.2
> +PYTHON_BITSTRING_VERSION = 4.1.4
>   PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
> -PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/23/fc/b5ace4f51fea5bcc7f8cca8859748ea5eb941680b82a5b3687c980d9589b
> +PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/7f/07/0fd502a29127b968bada3d1824a8af997546d2b9ff73f00e800b3d9888cb
>   PYTHON_BITSTRING_SETUP_TYPE = setuptools
>   PYTHON_BITSTRING_LICENSE = MIT
>   PYTHON_BITSTRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
