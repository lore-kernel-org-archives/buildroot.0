Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 409A260E07;
	Sun,  3 Apr 2022 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66O-OOGkoLf7; Sun,  3 Apr 2022 15:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2E060E09;
	Sun,  3 Apr 2022 15:02:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6F8E1BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A060E832C6
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFD5xjCCPAtj for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:02:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E6E2832C2
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:02:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id k2so1002592edj.9
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y8hA13k6ZfX+CAF5KuPxl18aKFsD/hs07oUXbaqiynY=;
 b=ddFCgID9wO/jsJotf9Jh9WSYfKKQhEvIIKTU8OtAm8z5ELT5m0pJ+o/KSdKyzGx35p
 X/vHIo6fmQHDOfpvgAAyBWGzBW0jKL7VI8zdCHtetdq1W6pioiQSqy2B96dhV12KWI/v
 MECk+KBX7OJpEuZu696P7ogQ6rw41qG2tHWkAAOttP/jvhXq2nmVdPbKKkJXwCRjPdBy
 c9PKsKbcWYckGWONDhxqiOiQA3YSQbxgexwIEagWATRyXZRJ6zpnnlBkNniP7P5ck9+h
 j55xZ8fL2di3afk7Vzza5HhLWRWKIuVjiNeByqTg+79BbCj0jRQhUas8Pb+CSCcZLoAU
 1G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y8hA13k6ZfX+CAF5KuPxl18aKFsD/hs07oUXbaqiynY=;
 b=z/5nCLPmlbx+9IVqDNQXQElXVgUHvXhannSX4qUY3qJJbFMZ2W9r2Y8W05km6+mXXx
 xvuBc57Sj9iJIwtqfykBetHvMxoopoJt3JU7vtGU0e/W/D5HjVobUlHcWOn/PtIdQ1cQ
 lq96OwnBNiDV6QZ62UgZNnQlojeYD8kMnDZyWwD3uIy6fPEQh0r/wtgPkP/P8xUANI/R
 Y2rej0m5DRzi1/g80SiC8psugTPFrQ0bswx6N6su9jOQQq418MRI0d0EkDMKFSfOSW+j
 DnsYgnqn4SczkF32NFhmvmqVBRBzyCXfjUxl1j1xlPiK+w9/s0pewBEqa3xyY8/pkYuM
 DmwQ==
X-Gm-Message-State: AOAM533IkUNX/YEZzdQqk3ppmiYB8Ti8oA4peg3DSDWNLLjg6u0XQtwD
 3nWefOCMO0XWXHWnq4j1uqtcDg==
X-Google-Smtp-Source: ABdhPJyiYPNH0idtrSWTgJBoivsnoKO2PJhw/GVJ2IJgqdCf3not3/QmSJ5BxqiIyG0Wofpi93UNBg==
X-Received: by 2002:a50:8753:0:b0:41c:b3c3:5a95 with SMTP id
 19-20020a508753000000b0041cb3c35a95mr5228190edv.146.1648998156512; 
 Sun, 03 Apr 2022 08:02:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm3925544edt.70.2022.04.03.08.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:02:35 -0700 (PDT)
Message-ID: <916c0cf8-a0d5-d6db-fbf3-61601a39bf99@mind.be>
Date: Sun, 3 Apr 2022 17:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Yair Ben-Avraham <yairba@protonmail.com>
References: <20220328201521.4084-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328201521.4084-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/tpm2-tss: bump version
 to 3.2.0"
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



On 28/03/2022 22:15, Fabrice Fontaine wrote:
> This reverts commit ed13a65a08cfe315aed9344abc609f5f2b92c782 as it
> has the following non trivial issues:
>   - pkgconfig files have no version number if we run autoreconf
>     (https://github.com/tpm2-software/tpm2-tss/issues/2329) resulting in
>     the following build failures with tpm2-{abrmd,pkcs11} or libsecret:
> 
>     configure: error: Package requirements (tss2-esys >= 2.0) were not met:
> 
>     Package dependency requirement 'tss2-esys >= 2.0' could not be satisfied.
>     Package 'tss2-esys' has version '', required version is '>= 2.0'
> 
>   - addgroup/groupadd and adduser/useradd are mandatory since
>     https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b:
> 
>      configure: error: addgroup or groupadd are needed.
> 
> It seems better to find an upstreamable solution to both issues before
> bumping.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d4d6807af3493deb47951c6f11f427040e5c5e11
>   - http://autobuild.buildroot.org/results/a304e45bacb8cd7e7ea9bc49e4a8ec9359ca0a3a
>   - http://autobuild.buildroot.org/results/be0befa81e955ac8cf16f9d20723f9b9b174e012
>   - http://autobuild.buildroot.org/results/d4ebee400423f6df51613193c86db3c58c94ff88
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-tss/tpm2-tss.hash | 2 +-
>   package/tpm2-tss/tpm2-tss.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index db6b3b7ad0..b6eb3c1f97 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  48305e4144dcf6d10f3b25b7bccf0189fd2d1186feafd8cd68c6b17ecf0d7912  tpm2-tss-3.2.0.tar.gz
> +sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
>   sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 2bb1235177..f475697e40 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TPM2_TSS_VERSION = 3.2.0
> +TPM2_TSS_VERSION = 3.1.0
>   TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>   TPM2_TSS_LICENSE = BSD-2-Clause
>   TPM2_TSS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
