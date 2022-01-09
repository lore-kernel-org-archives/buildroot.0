Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317DAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C904022E;
	Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESz7gAb4rkkH; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C4940231;
	Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95A01BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9771060B87
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CEKhyO3UR5q for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:48:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55B3460B71
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:48:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4179252wme.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/rlCk0U88eGnQTHPqKm7Bk3R8mxb0kvEfWZ3medOc0k=;
 b=aqeDh3ngduGq5xWtlWFsbCUnoEJzDTI+CilQmOMx7USzF9YOB7WrDM9yczMvbU6sQJ
 ROYIb8ngp9XnHrdXP9SFGXQBemV39XlL7tDCbugDV6LXTRtjBv8PGSEzFFHxaKaZnCDq
 DqXP4rGW0pMdJaH9DXpVTEV6my1iAi6vguiRe6tDX+QUKgHXTg9pevgBAC3XnFH8reLu
 DE3RYoKBqcwQE5UNHFqQB5X17sPFY4npnd+HFPfytrqSFkRq+p/9CdLtJYByqHE7N1Pi
 4kWDSZbichbtByiwwyuNAvaQ6nLkCizlkE+kf7A8zRCf1SK/Q/FDSugHk9u2WMXYMKoY
 GMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/rlCk0U88eGnQTHPqKm7Bk3R8mxb0kvEfWZ3medOc0k=;
 b=K6dKbNXtc1Qgm85BTgVD1VelvtJ5MVgV7aMSYIJ0Kd5aOUd5LfmEOPJc5gSnwW+yiW
 UJpPtblP57bLvYdlkXAiMtuaUFfxuyuncUEJ2cg+YVVy80e4YDa1HxFz85qteF9QNIID
 8u9R85AcmpiSwV32xKQW60bDrKtZwofDu1amsQdlUShucx9mtTqF/fUqC+o05cjvEoR4
 gJ2iWa0xrW8jmptRAQzPLq/3cN6wob+R08yuNyKG95krf5aVQjyMQEVPt7YF8zVZUaS1
 3zufDoxxW6y67+nS8mUUkUCw022755vvPo0EYENHJEk2MmLgZX+Z9PNrmH/O0q6pqnHK
 YyVw==
X-Gm-Message-State: AOAM530u3qxU7zKtQR/rC0eVDLdsNlpEAqvg3wh66GjwLYH7v7HYITu5
 noR/FMoxpAIICablod6azkyXBuQtYvf0pOdz
X-Google-Smtp-Source: ABdhPJz4oriK8rpBgO5pDK0aJZqXUT4uA8FDRE+SkIRbNMw/UGcNj83G1A8a+f9Tshow9gLhXJfDvQ==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr4999916wmj.5.1641768537346;
 Sun, 09 Jan 2022 14:48:57 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id n11sm4935903wmr.26.2022.01.09.14.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:48:57 -0800 (PST)
Message-ID: <34f36744-bb9d-f638-512a-ca42e711986c@mind.be>
Date: Sun, 9 Jan 2022 23:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220109035601.2483360-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109035601.2483360-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 0/3] PEP517 host packages
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 04:55, James Hilliard wrote:
> This series adds host packages that will be used for PEP517 based
> python-package infrastructure in a future series.
> 
> See:
> https://www.python.org/dev/peps/pep-0517/
> 
> ---
> Changes v2 -> v3:
>    - rebase on master
> 
> James Hilliard (3):
>    package/python-pep517: new package
>    package/python-pypa-build: new package
>    package/python-installer: new package

  Series applied to master, after adding you to DEVELOPERS.

  Regards,
  Arnout

> 
>   .../python-installer/python-installer.hash    |  5 +++++
>   package/python-installer/python-installer.mk  | 15 +++++++++++++++
>   package/python-pep517/python-pep517.hash      |  5 +++++
>   package/python-pep517/python-pep517.mk        | 16 ++++++++++++++++
>   .../python-pypa-build/python-pypa-build.hash  |  5 +++++
>   .../python-pypa-build/python-pypa-build.mk    | 19 +++++++++++++++++++
>   6 files changed, 65 insertions(+)
>   create mode 100644 package/python-installer/python-installer.hash
>   create mode 100644 package/python-installer/python-installer.mk
>   create mode 100644 package/python-pep517/python-pep517.hash
>   create mode 100644 package/python-pep517/python-pep517.mk
>   create mode 100644 package/python-pypa-build/python-pypa-build.hash
>   create mode 100644 package/python-pypa-build/python-pypa-build.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
