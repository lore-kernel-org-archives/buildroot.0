Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676FEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CB0823A0;
	Sat, 12 Mar 2022 16:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8iLs_UM2hit; Sat, 12 Mar 2022 16:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C8F81B25;
	Sat, 12 Mar 2022 16:59:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCCC51BF279
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4A5403AA
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3e4cYEOpmCN for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:59:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 960564023D
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:59:47 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y22so14543136eds.2
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Om2D+wRc/tGYrNJ9cJF2+ygc5+n/1NW2IixzLpxRJiU=;
 b=h/eg0ZoyjCnF3vBWkNoPCXZ0ubOfFEUhh6RRz8G8c/sr5lkgV3KIiybFdfA/F2dw3C
 PLY3DYbKjtzk8bs/l24SprqR6QsumsB1RKwQDWCqjNhrHSDymMhC9EIkGaY0mN2UBRLi
 uQvYrIaRTqR/4DOpAv2gWPiD5RqF1b5zsbcO113WJexcUC/fhYsyCMiOv7KfwLqJaUZF
 L2AaGMwVCVfZZYGh0a5X69N+NPQ61+qVI6Uyygv31AJNVVDpvQe4eFpDlpS59Z1UFF70
 v6G02/oMn9dXw3cFJyQPIxeh9TV66QdhJXe+7FQC32awmIbbD65X3S5V9KIMr8nX9KNL
 gOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Om2D+wRc/tGYrNJ9cJF2+ygc5+n/1NW2IixzLpxRJiU=;
 b=jUHY/rAYXxXgdZGkI0Mgpn3J3UU9QXlgsTWO0GYfaecOCOHqTcX9GxsjcxPez7DqzN
 Yy0LanTgREd4grAPR+p+cdnHsT3AoTFBysxBx0yb3Rov9+aMqsZseeiKIZROYN/VbmJV
 BrmPKfsgqLeueH5AktCpWGq79artR4E8mFFjos6JrZHsHXVWadqY2DaGiQXuUySbfVtM
 D6vrFsXZnYub7+a8tI5vbEh+0TBpjCQmrWT+ERBUl8LX7zJjM+8+oFOGER+fEXRYhY0O
 Dad6WEBl2HZN8rGxlrwiJb16GxZKBQIqc0Od9xHYO9+gmrsiClTfysyyv1J6hkb1yewm
 SRGQ==
X-Gm-Message-State: AOAM533e7QGxOaVlcmv7oGzKOJ5tV9tInRT1z6Wkxc+1u2DOwroSp9of
 mA2ozFj1/AnqKB0oxr3ciJN8zkvNNjDlXw==
X-Google-Smtp-Source: ABdhPJxVlvjdqaVXLcQMmepj7xfs56BQg0KuFYqsPsOR/S7N00bIfNAplo+XLp4n7wHDrEP95blxMg==
X-Received: by 2002:a05:6402:510d:b0:416:a24f:2173 with SMTP id
 m13-20020a056402510d00b00416a24f2173mr13714401edd.274.1647104385711; 
 Sat, 12 Mar 2022 08:59:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm4506107ejc.78.2022.03.12.08.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:59:45 -0800 (PST)
Message-ID: <60962d31-05a8-5f8b-c3cd-e149d81a2eb3@mind.be>
Date: Sat, 12 Mar 2022 17:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
References: <20220218211458.197332-1-egorenar@linux.ibm.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218211458.197332-1-egorenar@linux.ibm.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.20.0
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



On 18/02/2022 22:14, Alexander Egorenkov wrote:
> Fixes:
> - https://release-monitoring.org/project/10714/
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/s390-tools/s390-tools.hash | 2 +-
>   package/s390-tools/s390-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
> index 13c68fbf52f4..6ea8f7ea2076 100644
> --- a/package/s390-tools/s390-tools.hash
> +++ b/package/s390-tools/s390-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  17dc163e6a1e940f895c64955c130058600e1df834e1ab134410be7266ef724a  s390-tools-2.19.0.tar.gz
> +sha256  6fa6add92e896541c0ef74885a4084474fc0d77049e8ac7372872a70a46ddd74  s390-tools-2.20.0.tar.gz
>   sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index 328986bcb37c..3c386af6fd10 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -S390_TOOLS_VERSION = 2.19.0
> +S390_TOOLS_VERSION = 2.20.0
>   S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
>   S390_TOOLS_LICENSE = MIT
>   S390_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
