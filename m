Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85ECC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7647283E9B;
	Tue, 19 Apr 2022 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlYeKVtowKhV; Tue, 19 Apr 2022 20:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6634183E81;
	Tue, 19 Apr 2022 20:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D66C1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B06560E4A
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzyKtunhZFVi for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFF2A60AD6
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:32:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v4so22762254edl.7
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1A5oBeUei76yoQZDLhOABOaab2nkVRiyBeK+2ZxJL4A=;
 b=J1p3aFEL4R3rnkv/HZiPe4WjRRH8PIOJ2gjM498bfSX5SR0JN/4ayJppL8O+e9lhrC
 0rrFygM4gxEGSfbcaH0kv2M3/6TBLO89XqGbHBBkgWkB5Y/PZuRXTOnpS+oi8Z7yuVle
 q9v8pNaIeWf1iZlM9P/zNwKr4PJ4sdSyMYUGwAZYz+Og2PMiYNZgObagMYPpbEaNzTAM
 HqyniPnOTbcicW2FzxTgWifiNxd68w1MachkU6hTpccY4c2aG+gUcpLLyVMZwE9DvJbB
 2eAjCmW1jCsf7P54nEblLifN37NjHJVBZXdOvDfh812se16suydzSmBLBxDu9dT+PFBw
 LhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1A5oBeUei76yoQZDLhOABOaab2nkVRiyBeK+2ZxJL4A=;
 b=QYoLplMGo6XaUIISWJiEFVAT+64D4R0q984jVrz3hpSBmMrrU+fMOIoLR1MmJnBI+t
 MGtIsLNveYhSm8Qtp5szrYcGR6QzVk5096tbHYo+kdXIq4xqToarWF6z6QujJQOqwVUr
 zscXdG/ptMLbGQhiyee18oyGfpfI09GFSp7boRV+oGyHudbNc77TH0YS8ncoz/k6JTq1
 oor9WhuU7ux4aY0HD744We82k71MFACdYr8Tqs33HfoCevOqyBoBHAVXVumJ9tt6vVNQ
 yXPIA5kabN/6biA+JjmqhyIRRHW/qJEY718Q984N84ibCOVzw0hPO4i3T1Yot+dA0VT7
 ioAw==
X-Gm-Message-State: AOAM530MSTjECrJeH9Lgt/26LElXGeW5MFbFfzbXzHitAqrDkw+00E7n
 XMpLXychqUAQfNn7fyTNCAGeSA==
X-Google-Smtp-Source: ABdhPJxZpt/xrUf7syfaFwTBq6CANaw/TaQTHSQZE4Mg/OsuM5NkWEvGdkGNdBDm3NLwIItN+G4FIg==
X-Received: by 2002:a05:6402:3492:b0:423:dfe4:ec43 with SMTP id
 v18-20020a056402349200b00423dfe4ec43mr14139958edc.401.1650400336708; 
 Tue, 19 Apr 2022 13:32:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a1709062bd900b006e8766b7907sm6003566ejg.223.2022.04.19.13.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:32:16 -0700 (PDT)
Message-ID: <50abe40e-e466-7e16-1f11-7b61d1bdfd3e@mind.be>
Date: Tue, 19 Apr 2022 22:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220419113409.1008586-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419113409.1008586-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/xz: add upstream security fix for
 CVE-2022-1271 / ZDI-CAN-16587
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



On 19/04/2022 13:34, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2022-1271: Malicious filenames can make xzgrep to write to arbitrary
>    files or (with a GNU sed extension) lead to arbitrary code execution.
> 
> For more details, see the announcement and advisory:
> 
> https://www.mail-archive.com/xz-devel@tukaani.org/msg00551.html
> https://www.zerodayinitiative.com/advisories/ZDI-22-619/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xz/xz.hash | 1 +
>   package/xz/xz.mk   | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index 3dd0cbe459..9577e98e80 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,5 +1,6 @@
>   # Locally calculated after checking pgp signature
>   sha256  5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df  xz-5.2.5.tar.bz2
> +sha256  98c6cb1042284fe704ec30083f3fc87364ce9ed2ea51f62bbb0ee9d3448717ec  xzgrep-ZDI-CAN-16587.patch
>   
>   # Hash for license files
>   sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index af611975a0..cdb01e06a9 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -13,6 +13,10 @@ XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
>   XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
> +XZ_PATCH = xzgrep-ZDI-CAN-16587.patch
> +# xzgrep-ZDI-CAN-16587.patch
> +XZ_IGNORE_CVES += CVE-2022-1271
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   XZ_CONF_OPTS += --enable-threads
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
