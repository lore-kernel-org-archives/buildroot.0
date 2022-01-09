Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EA4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8048460BC0;
	Sun,  9 Jan 2022 18:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdkDrhKmJy_S; Sun,  9 Jan 2022 18:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C234360B91;
	Sun,  9 Jan 2022 18:11:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 103E51BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F317880BFF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tKP-ULGY_gm for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE98D80BE8
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:11:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r9so20788555wrg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=P+eOvC2UZ+sNfuWfeHQcOVOYYgmK7RrXAJxHzmN9lag=;
 b=RluJIgqXx/mPwKXvvmX1ef+iV1lItcFokBa5qwS+L4Ssza2BrG/zAZhoxBief96VRG
 aDIttsSEbVPooJCl0q/ah2dnGrZDpFqbxeLQ5ul2nH6jYuX92Keozp0HRnbnGc33RMEf
 BhKEOpmSQ8QEVDlo4dwfVmNCgrBA+nYAmJ7CSmWcNVj3delpuvofG9TggPW0Q5beSsPK
 Zu4vDwkGSD2WBbUabHK7Q4cN9KheWLwuIRnzP8DBdS5XCkLbX6LEN8vtH5KGhpBVGtoN
 WjCdWQHpr56I4Vpr5AD/3bmwyq95RUCR+ry2ucUK28UY2zYFJ9AaPF5cArv9S26hPlX6
 yk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P+eOvC2UZ+sNfuWfeHQcOVOYYgmK7RrXAJxHzmN9lag=;
 b=2VLUMkZVR5YsuhwYlWmQUBDV0D9HrK9Vh4dwIGRFWdAwOx44qPQL/7mzTWyalDDN4W
 idW9BSY6CBDn9U6f9rJQ8oxdcDT6QLSS6CqibV11ufuKk4RcE21modkpnCajfU2xwHiH
 ksoT/GQcbJ9YVGs023R077SiPKhL6ghV0ElpP0aLyJxzrd1c2tgZRBQ3D3d0Zh6FDart
 5i/pVTZplm474QOFkF3cCwrAMp8j5RPYvC0Lx05e8T3k8aKkz7UtEg2M7P4n9c+qrLVh
 by1g07K0yEJ+HWvV45frOHVmpVAeuTGZidQjNPqHUMwj6qe0fnsz+kMKw5fbjTmPRlMH
 fWqg==
X-Gm-Message-State: AOAM531y3iiZEa3Fmn6FddNFLAxY2CNYYkPMox+xRtKWsYoPtBsZHMW1
 s0BBsyxcc7BiwjAVZPjGcoF39r/fEioiApo+
X-Google-Smtp-Source: ABdhPJzh2dyGUB0YXPtvTtHBfx+LzUbrSA3sPBQsk5epkIrthyhazCOo3p4oO3sf1jADO03QXOE82Q==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr63868069wri.16.1641751890313; 
 Sun, 09 Jan 2022 10:11:30 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id az25sm4562559wmb.26.2022.01.09.10.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:11:30 -0800 (PST)
Message-ID: <fe94c090-f66c-7b46-5237-cbc2ff60c421@mind.be>
Date: Sun, 9 Jan 2022 19:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220109175259.86238-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109175259.86238-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-cargo: convert to uppercase
 RUSTC_TARGET_NAME
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



On 09/01/2022 18:52, Giulio Benetti wrote:
> RUSTC_TARGET_NAME's dashes are substituted with underscores, but this is
> not enough to fix building, we also need to make it UPPERCASE. So let make
> it like that by using UPPERCASE macro.
> 
> Fixes:
> http://autobuild.buildroot.net/results/498/498b96224c8bcff91542ca3731dfd66891f4ec23/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/pkg-cargo.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 067c45a920..71f4dc4c91 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -44,7 +44,7 @@ PKG_CARGO_ENV = \
>   	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>   	CARGO_TARGET_APPLIES_TO_HOST="false" \
>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
> -	CARGO_TARGET_$(subst -,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
> +	CARGO_TARGET_$(call UPPERCASE,$(subst -,_,$(RUSTC_TARGET_NAME)))_LINKER=$(notdir $(TARGET_CROSS))gcc

  UPPERCASE already does the subst, so that's redundant.

  Applied to master with that fixed, thanks.

  With the two of us working together, the autobuilder failure should finally be 
fixed!

  Regards,
  Arnout

>   
>   HOST_PKG_CARGO_ENV = \
>   	$(PKG_COMMON_CARGO_ENV)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
