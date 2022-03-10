Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2A7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6453681288;
	Thu, 10 Mar 2022 21:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wWOS31RX5BD; Thu, 10 Mar 2022 21:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867DC80A62;
	Thu, 10 Mar 2022 21:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDD071BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAC58841BC
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOvltB2I4iT6 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E71C2841BB
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:23:26 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t1so8439229edc.3
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5iW0yu1bKtxQTlx5+sxS7xa0K6BJLgthxBO+fniT/dw=;
 b=SCE3etZKrkyrCd44wvGp/nbJ1byaXpglI+eM3Q0F0ALrP0q9+lFF/CdhJHATWHxbQD
 CbpWBuwIg2OQIkxMcRVI0vIoBiTTJQCXjCIpY2UISVZc0ykmvzk1qNEq5ZtN/mQ720E5
 61ZYQQYd3j/jzbZI+risXwlf90pysej/RxLW2utW0pfwx7aQHHK634mrTsjId16JDSHX
 QpvQddIRwloNJm/2fPrpvEkQkwgNJ0mddQsFtuuQLB6J/rqBg/6ilw88FVhtqHI50cF2
 svm3Vok8rBzWn7h8Db5/e48Yfha3Y6cTRerGp41KcWN+KP6CTzzOB0CAGa5O1YMavoOU
 ZNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5iW0yu1bKtxQTlx5+sxS7xa0K6BJLgthxBO+fniT/dw=;
 b=rd4L613y0AKNvAjYRHyf1QzhLgkf1BS0jAHup3GGElRI2PZJpgrF5ghvY02hjGq+V4
 rqfVO8kUT07JmNQoyNpvvuZ7ykSZzZNId8b2MgIFfRazSpXhyLIv2cI/NtT6eQjGLpkf
 NjOYoA0Wr4ybBUXtZJEWvzgt11l/CQ6TODxlPLLXzSVl3sijt5hyoxUUKrqqSNf/+1f3
 A2sL6ta/o0qifap85RuPplfLoYnNSzQtSx+l5k57OAuN2z4Nv+A6xqMU0j7+JXB+bgdk
 D7adoh6bzIe9k/ioOx8E2Dp8xMZSprxYHGOB9qRcMpWpwBSqY6RZKfOKdIotee6W1gdW
 J+GQ==
X-Gm-Message-State: AOAM531vvFT9c/LwbOekNoESW5hD7dhBaQo4XxbMisW/3+Ph3O4n8aVG
 5kEjKClZTpZ1MmKkNyW/3uF9AA==
X-Google-Smtp-Source: ABdhPJyoHe8Gnmk8u279AxrRT7y90PbZ6zSu+0VeVOxc+Bl9LThdFmGawJWx+/zf37E321O+JYbOtw==
X-Received: by 2002:a50:e081:0:b0:401:8823:c9a8 with SMTP id
 f1-20020a50e081000000b004018823c9a8mr6216676edl.401.1646947405085; 
 Thu, 10 Mar 2022 13:23:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a17090671da00b006d9b2150a22sm2199821ejk.146.2022.03.10.13.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:23:24 -0800 (PST)
Message-ID: <ff80f53a-2997-f7af-d779-c947881b56c9@mind.be>
Date: Thu, 10 Mar 2022 22:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Gao Xiang <hsiangkao@aol.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20220214152450.319583-1-hsiangkao.ref@aol.com>
 <20220214152450.319583-1-hsiangkao@aol.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214152450.319583-1-hsiangkao@aol.com>
Subject: Re: [Buildroot] [PATCH] package/erofs-utils: bump version to 1.4
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



On 14/02/2022 16:24, Gao Xiang via buildroot wrote:
> - new upstream version;
> - add 0001-erofs-utils-dump-fix-de-nid-issues.patch [1];
> - add 0002-fsck-main.c-add-missing-include.patch [2];
> - add 0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch [3];
> - add 0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch [4].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=17eb5c417bd56be4b2f7627c2d6879fbad6a86d6
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=1ca453ee89894b1669ac78d7f216bda172783e8d
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=eb255afa101b52096bd3e5e48f990576190f03bd
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48
> 
> Signed-off-by: Gao Xiang <hsiangkao@aol.com>

  Applied to master, thanks.

  Regards,
  Arnout
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
