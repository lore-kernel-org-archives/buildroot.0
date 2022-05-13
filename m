Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A71C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B42827C9;
	Fri, 13 May 2022 22:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjCtNS6O9lIK; Fri, 13 May 2022 22:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB8748271D;
	Fri, 13 May 2022 22:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 717201BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EDD240207
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2hztn4P54Yq for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:09:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9979A4015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:09:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a21so11497228edb.1
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BpqhnzR+EK27Ln9bLksUl58MuM4sFwzgNI6O9rgNxQs=;
 b=QnoBjJuDfwSWJo2FbFODGVMXsbfn15Lj3nVstYeYsRhTlCvY2PG9ZIafx/NolYXOnS
 1OlLocegim5KxPZC8cxVnj64cEDR9bXrGKJpQkdbHzTDZrXXoBBEgh89dCw6sv5/5xfz
 o3xU8Ue/KVXiCBgzKPe+tYUoQoCxm3cN2zu3YQF2Nuhy8c7JY+n/7yWZjc3hlEkkLoHd
 HM3zmTLhMBN+yrLMYgWixE9H0QHchUe7cwAa6z0waz1r72PGJV9LGr00n40VQXdzmPsV
 remlLvskEvlj+3EgCcoHgzDCacthWLjnJBS4x8N47NL7eXCos8LQ69+4Yi/4+fEjqrfz
 FvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BpqhnzR+EK27Ln9bLksUl58MuM4sFwzgNI6O9rgNxQs=;
 b=r0FKpXxpz15/y8cXoR3joK7UfJtDf8ZADYQv2vEZxi4pFL8O+kNdAU7doCnR11FoZa
 BaL+9yczGJtEtC/jZ8HokvZ1zJLKOFeK7IZyn/YYZFdDfXPc7PxSD35s2mFs4M/QCz0W
 Mg98oAAVqza4DunaDHml9D7Fz+Ynjg2UTNcpJXtLjDs7tglbS7nWjHpQndmRMU5Z5Ceh
 DlRESdFTnzSqwTvF+4Rrm85z496A5Lplt0VDBHzklUIn85+ekF4Nts5cO6HD78VrImnX
 Xwff/84sBoPERYKYWfIifLB0PQfH1RSQHXdMBSah+DTX/5KoDujnj7GtU26kVWz+2F/z
 WNaw==
X-Gm-Message-State: AOAM530CNbKwLHhVMLWDOfqmI2TVbjldpBa+jqTGNNSkI/tt0cSpoKrQ
 K4gB1O/hBDL142Je9a67b3JAOQ==
X-Google-Smtp-Source: ABdhPJx4rRtHNeCFl1hLN3eHc9KHrLJjGGqDdbNWbdSVVq5rJmXc6vZZ+ERzSVdfxwJ0ZJ58y+nSHw==
X-Received: by 2002:a05:6402:5188:b0:428:e77:b55b with SMTP id
 q8-20020a056402518800b004280e77b55bmr812130edd.82.1652479749895; 
 Fri, 13 May 2022 15:09:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r3-20020aa7d143000000b0042617ba63b2sm1434041edo.60.2022.05.13.15.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:09:09 -0700 (PDT)
Message-ID: <39f472c8-3c36-cc9a-c848-988e15c32649@mind.be>
Date: Sat, 14 May 2022 00:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509013417.1860755-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509013417.1860755-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.42.1
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



On 09/05/2022 03:34, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-gobject/python-gobject.hash | 4 ++--
>   package/python-gobject/python-gobject.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
> index 100a05c74e..0c14efb1d4 100644
> --- a/package/python-gobject/python-gobject.hash
> +++ b/package/python-gobject/python-gobject.hash
> @@ -1,3 +1,3 @@
> -# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.0.sha256sum
> -sha256  9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b  pygobject-3.42.0.tar.xz
> +# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.1.sha256sum
> +sha256  1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9  pygobject-3.42.1.tar.xz
>   sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
> diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
> index b0a132d040..2fa7504d51 100644
> --- a/package/python-gobject/python-gobject.mk
> +++ b/package/python-gobject/python-gobject.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PYTHON_GOBJECT_VERSION_MAJOR = 3.42
> -PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
> +PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
>   PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
>   PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
>   PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
