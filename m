Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237A4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64BB408F1;
	Tue, 14 Dec 2021 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jg1GkvgP_Pn; Tue, 14 Dec 2021 20:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40154402FE;
	Tue, 14 Dec 2021 20:07:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01A0D1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3C5D402FE
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKiuZnXd1R4F for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7EFE40261
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:07:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b7so7784201edd.6
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ikamFL7gNdA+BAob78Yj1Q3ygA6YAzhN/Z9xDAI1tio=;
 b=N1W2k1yGAoVpUYKHQYyRKB3c5eE1eXSdr83RppJX1ny1SN5YFenUinGxSTSX0y82rZ
 piNAcTgMGFw7+sz3atz5umwADvZy9MGWpxrStc0PTIJziGjD5GEySY7qoOR2J9/dnopz
 R7njIe2ETcMv+wexm5Yk58JLudVAhCY6w49SvAM/AeHO/7uksg91fAMDMPsrkzhvUHtu
 XD1r7e0sssy747ztTHcTN6MaUPGcVhSHPrhwxZLx5vDe0p4srTooKGL5GvO+rYaFFgZj
 JwwUTtkvk8r57H3Plf1Q14lVvhlanusOhiil4F1/7Mv0p6Yi3iNcYHvgix6N/ShD5cay
 j1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ikamFL7gNdA+BAob78Yj1Q3ygA6YAzhN/Z9xDAI1tio=;
 b=Q5+I6dW+9Kyx1NwvBNbhpxx32WXe51vulv6ljGiTiX6xWLPTjIugW1vUQxqrpMrN2D
 M1a/2yAOh4CbfSXibTmC3EXkIJt/ZiBcimJPK7siV3QZnAzfJOq0TBwIubs2dEtEx5Fo
 ewCZjd5u3IH4cNYnYRjoUyuuKim+kcGY3mj5xcPDtg6x9pNpDIBEWkFVnYOqQBvsqzaI
 n4ij944Lf8axkexYVJSn43Cjknr7EYjNYIt/Kyk1M93bUHEplfyJ27vxK7mK4pq0YopT
 v2adZfJOyiF/tflCxYx+XzfobSYm9s8m52QdO+yMQ+TzzFCkgXnlhDXEnLgxETq2M4b6
 it4A==
X-Gm-Message-State: AOAM530ADgo2aUntzrejV/WsCRHpyGGQL5JZmyoNL7QnM4qQ5FnoMHtS
 n4lvK9FGhhT+Vr+n1uWHSDlbaw==
X-Google-Smtp-Source: ABdhPJwVTgSKJdf2kmyCDHkfLpAZvLaj2l96Oh6To1lM6lgOMez703L9iYPDdXL5eubAoa4iTEy5pg==
X-Received: by 2002:aa7:c902:: with SMTP id b2mr10867488edt.320.1639512468167; 
 Tue, 14 Dec 2021 12:07:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n25sm313891eds.9.2021.12.14.12.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:07:47 -0800 (PST)
Message-ID: <9a37395c-c760-7c4f-9c58-acfa12080c8b@mind.be>
Date: Tue, 14 Dec 2021 21:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211213202115.21705-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213202115.21705-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/iperf: bump version to 2.1.6
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 21:21, Peter Seiderer wrote:
> Changelog ([1]):
> 
>    - fix tos (-S) regression
>    - fix --permit-key regression
> 
> [1] https://sourceforge.net/projects/iperf2/files/readme.txt/download
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iperf/iperf.hash | 4 ++--
>   package/iperf/iperf.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> index 924d10b3e0..2e1f433dc7 100644
> --- a/package/iperf/iperf.hash
> +++ b/package/iperf/iperf.hash
> @@ -1,6 +1,6 @@
>   # From https://sourceforge.net/projects/iperf2/files/
> -sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
> +sha1  41bd049625cbecda2bf5b6a6cc12a6c5baec549b  iperf-2.1.6.tar.gz
>   
>   # Locally computed:
> -sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
> +sha256  4a43e44439b95622aebeee55754a17d1c94076032e90620dfc1ab9908cb9e080  iperf-2.1.6.tar.gz
>   sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
> diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
> index a3d95535b3..f999ff4ac2 100644
> --- a/package/iperf/iperf.mk
> +++ b/package/iperf/iperf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPERF_VERSION = 2.1.5
> +IPERF_VERSION = 2.1.6
>   IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
>   IPERF_LICENSE = MIT-like
>   IPERF_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
