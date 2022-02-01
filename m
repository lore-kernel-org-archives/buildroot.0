Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BCDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B7D82496;
	Tue,  1 Feb 2022 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ye1BiqSCHOYH; Tue,  1 Feb 2022 21:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F073824A4;
	Tue,  1 Feb 2022 21:44:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE23E1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D41D8824A4
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwuUgaMxPALP for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6314682496
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:44:00 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id s13so58596652ejy.3
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0xz+B2cphJtriD1R19Fhk72mx8fTG7SrPqA5ys5mbJg=;
 b=OPiPS6sLeyhIPMG+JgEdhP89Cus9wh51rb2Yjiwnd/sUH8nWsuOAXkLxn0w685qoeM
 LRiHlUEQxui4nsE8ulUjejnYeCdOSHPaWK1d72cN6wmzctjxm7ugudu6BAcKA37MYCMg
 v0p3GcuHwWgq7fWrAt/2XZ1SimRq8ygRr73veJ5eMdfBRQwSkCRAm2Ybg1mwsZ2ZzXCU
 LKdydfcHKkTEDUqlQ0puwnACLgGJY7UJ3DrG6ejcCCH+p4jik4NdkXZ2df3mHcTvLDfh
 Gg2vN0lo4VHy+HJNaYyn0HGZnLUB9Xiae5Ny+yHSX2sV0h7rg9j2+p3Y7+is98lzqkVm
 0rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0xz+B2cphJtriD1R19Fhk72mx8fTG7SrPqA5ys5mbJg=;
 b=QD7BSfxJuTXCvZOXsjfUSSuHpHnDgu5kTF7dL1a1jPXuLXuxaEFG4//h6lySvXvubH
 25BvDykiuARNEs5OZahLm21RPlS6fE2e2kdgHnOm0sFFVp4319a4F3ZGmwuTWwx/WweL
 yfQVdDg5AlYDrFEiaBDA3SjQtZmMh97MPcUjfZBL+CmUx48PY61J6yVSj9x/mRiVmJOX
 6Ta2hfnU8SFVENCmhqjQjfHG5fChhv8vdHJhHbRQklY5Vf/dW8VUyNcHyNgw8CfVpAWm
 24hTewOBbpe6OvLVVm3weu+LEVd6oyqTlHh1K4TTn/pPMj/exkoAvKInqxelLPjoXGTb
 GBPQ==
X-Gm-Message-State: AOAM53116AL5wNZ23XhtLWpjdFR/xuB0lfsQLemvjD0pvUTA6XFqNyDq
 18I44rnu0GUH+5k/aui1Vh0g6g==
X-Google-Smtp-Source: ABdhPJwky04q+Jvq8r7xOolHVp+kEzwXLCRUmM+Mkf1zpOvB+qdfm6s+a/4VZ0doym2E1hQdWCaNiQ==
X-Received: by 2002:a17:907:1b21:: with SMTP id
 mp33mr23255939ejc.523.1643751838472; 
 Tue, 01 Feb 2022 13:43:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j26sm11866558edt.65.2022.02.01.13.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:43:57 -0800 (PST)
Message-ID: <05ec3e99-2839-b04f-6ff2-82cd693a1bf3@mind.be>
Date: Tue, 1 Feb 2022 22:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220114175614.963475-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114175614.963475-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/hiawatha: fix build with gcc 4.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 18:56, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 4e36e8f2081a66f477dd038793082045876d65ee:
> 
> /tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c: In function 'self_test_rng':
> /tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c:973:5: error: 'for' loop initial declarations are only allowed in C99 mode
>       for( size_t i = 0; i < len; i++ )
>       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1befc1552af91f34c600229138910c2078c2fdca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/hiawatha/hiawatha.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
> index 14d3c9f1ee..25da98a43c 100644
> --- a/package/hiawatha/hiawatha.mk
> +++ b/package/hiawatha/hiawatha.mk
> @@ -15,6 +15,7 @@ HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
>   HIAWATHA_CONF_OPTS = \
>   	-DINSTALL_MBEDTLS_HEADERS=OFF \
>   	-DUSE_SYSTEM_MBEDTLS=OFF \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
>   	-DENABLE_TOOLKIT=OFF \
>   	-DCONFIG_DIR=/etc/hiawatha \
>   	-DLOG_DIR=/var/log \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
