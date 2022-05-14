Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E3160F06;
	Sat, 14 May 2022 09:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oF58vtOBGBNN; Sat, 14 May 2022 09:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E59260B14;
	Sat, 14 May 2022 09:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35E2C1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2139960B14
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZAXtLXe_BG9 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23CE260AE5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:45:55 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g23so12512455edy.13
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ftjrfuPDW4rCRjb/uH8+wt7RvWAtKyo7nKrEw/85aoo=;
 b=CbC1IQ3egvAl1MtzJUJYFsziOVd9KX/38Tma2s1m9HhRovA0FE75gJANilGCKbnhu+
 bWHlqvX7uqjvMU29MvLeUDJAEOB5w7Bu3LfhAZzBcq7BfXkgkHiXQP9MyERPSmo5bWCx
 7vL9Bgese5wxAA+Yjb31E45Vw8/wvw8RmOqsrhgFCWmQbIuty9kic9vp+NPReIVJTviO
 1D3XRgLHs7wXffQpUuBaDxu2FAlm7gkWE4Kmc08p5iMJ4AB8THZ34CB2EAhKct1PyNkt
 aKzirWwGq9RcIo/fZUuXkFVSlJOVhCBwtbjl4DIOn7Vp4rUGVwbHs0edryPVG2/d+oI/
 WoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ftjrfuPDW4rCRjb/uH8+wt7RvWAtKyo7nKrEw/85aoo=;
 b=zx5Ew20BVDCd6vU4n7lO6sOQJY4njMy9ZszFG4dbX3rIkzXTmIjiCNOMQnh10wtdlZ
 /uObNAxvl8fqg+7rLTQzXoaQeQV5Arh2PUPBp0WJRjgfjv9HaNqB+ufKuR12SXiqVWVy
 +iBjgvO4Ji242kMpdbcPyMJHyYRe++3r26qPr2RG3i16R5DGMqtJvjDXRiU2SMNkxjJ8
 0CmnPjG9sxC9LYtBJ8RA7k8ebr+xe8Fv/vbkQwSL7KqzXU8X2baFIZYuj+pBwlkobTIl
 FXuFVpTc+1IsrzGq9dbj2NpXemRdJtIK7kN5hA7u49g9PfztlDo6gnafPUpcx7Tz2+28
 l17Q==
X-Gm-Message-State: AOAM531jUF36RRZMDqaTorvuONARr56LRG24dDN/KR3scCcrhT6MyJ1w
 Qp9DMACU18StUva5ugSaOhfT4/IF2dqXXA==
X-Google-Smtp-Source: ABdhPJwU/tjBSOhfCxTIW5wEl4dRanJr0cyBj8eLF/DtdmZRPVNCMleps7gwd7QJkrt910nTCobgOA==
X-Received: by 2002:a05:6402:268e:b0:427:bb19:f889 with SMTP id
 w14-20020a056402268e00b00427bb19f889mr2904517edd.33.1652521553986; 
 Sat, 14 May 2022 02:45:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1709070b0500b006f3ef214e06sm1584358ejl.108.2022.05.14.02.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:45:53 -0700 (PDT)
Message-ID: <91d3a296-4c11-4f31-d44c-4860ead80498@mind.be>
Date: Sat, 14 May 2022 11:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20220510163249.21272-1-petr.vorel@gmail.com>
 <20220510163249.21272-3-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220510163249.21272-3-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] musl: backport netlink macro fix
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 18:32, Petr Vorel wrote:
> 8cf87b30 ("fix incorrect parameter name in internal netlink.h RTA_OK macro")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>   ...rameter-name-in-internal-netlink.h-R.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
> 
> diff --git a/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch b/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch

  This should be in package/musl, not dl/musl. Also, subject should be 
package/musl: ...

  Applied both to master with that fixed.

  Regards,
  Arnout

> new file mode 100644
> index 0000000000..fa3057ff08
> --- /dev/null
> +++ b/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
> @@ -0,0 +1,33 @@
> +From 8cf87b3027009c0acac591d9ae80262dc25daccf Mon Sep 17 00:00:00 2001
> +From: Ondrej Jirman <megous@megous.com>
> +Date: Wed, 21 Nov 2018 17:29:21 +0100
> +Subject: [PATCH] fix incorrect parameter name in internal netlink.h RTA_OK
> + macro
> +
> +the wrong name works only by accident.
> +
> +Signed-off-by: Ondrej Jirman <megous@megous.com>
> +Signed-off-by: Rich Felker <dalias@aerifal.cx>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +
> +[ upstream status: 8cf87b3027009c0acac591d9ae80262dc25daccf ]
> +---
> + src/network/netlink.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/network/netlink.h b/src/network/netlink.h
> +index 38acb178..873fabe2 100644
> +--- a/src/network/netlink.h
> ++++ b/src/network/netlink.h
> +@@ -86,7 +86,7 @@ struct ifaddrmsg {
> + #define RTA_DATALEN(rta)	((rta)->rta_len-sizeof(struct rtattr))
> + #define RTA_DATAEND(rta)	((char*)(rta)+(rta)->rta_len)
> + #define RTA_NEXT(rta)		(struct rtattr*)((char*)(rta)+NETLINK_ALIGN((rta)->rta_len))
> +-#define RTA_OK(nlh,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
> ++#define RTA_OK(rta,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
> +
> + #define NLMSG_RTA(nlh,len)	((void*)((char*)(nlh)+sizeof(struct nlmsghdr)+NETLINK_ALIGN(len)))
> + #define NLMSG_RTAOK(rta,nlh)	RTA_OK(rta,NLMSG_DATAEND(nlh))
> +--
> +2.36.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
