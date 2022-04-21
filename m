Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB55C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116F640A13;
	Thu, 21 Apr 2022 17:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOtQN6i1ibiB; Thu, 21 Apr 2022 17:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BEBC409F3;
	Thu, 21 Apr 2022 17:58:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF891BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49DAD409DD
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVparh9tCSys for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:58:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B16E4046B
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:58:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e2so1480844wrh.7
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cUg5jo80OR5FKiiBjosYmrCo0KaN4kQF8fliINZR7kQ=;
 b=Mz/knOBJputQKOmlYop23S/4EwYZXkM3LL6scJeI2lR0+ZMEmrO8trbD9virC8eX+B
 y1LfbtxH8BsGYqxJ+KWTgBbkP6yMU3GOSclxtxbcRDBLb6WjFyH/XDB80qkuy4XlJE7p
 +J+029euO1hn9sp3HOAuItMXfA++jYlm9d+4ed/IPAZcyN5f36lIpbBVRQuEM4axfVES
 C2JZXDONWJPWHeiDWpz59UVtC9TkJm27C/tugfKe701V6spqbkse4jFTjqP9XJq1hhsr
 9y2VCW5AJS8vhX9RGen/vPoDHwHrZRqYBS/Dt7V2YJqwBWusdo5kqGH3UL+yuwJ2rQvf
 OW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cUg5jo80OR5FKiiBjosYmrCo0KaN4kQF8fliINZR7kQ=;
 b=b1yFeVIh1/P0zBGG6Gm7kvKhjZuPYi7pM6YPqTgx4OUExs6VFI2TiVved8xgWVnwNo
 d1s41nsXUgjNbxPwtn29mf/NUV5MMN70RmDFlb1oYYnm+ok+ka1r+3DE2lb7XqsUyERC
 LV2GCW+AMRZ9t0Ulp9wGw3kON1NsqO5JXyItsxncrJ3DCUH1Sj7iMD6Ta/3cVQMqq2kJ
 RGc7mZ1u6JFYDVz7WLK4aauYDJIwF+0tbhfqyZWCrsdDwCvBcYA8ddnyvNAWTWCI9WwP
 e1fUxFZAsOJp8kCCuRyYoX5dY6kbTxY2quePAeKwNsN7KsBlIMZWx7VbfU9D6KTQ5+qG
 bEIg==
X-Gm-Message-State: AOAM532mRF4/QaGifxZlAR4Qzo/YdZ2a8ThbrkJCG/sE82LFbl42wTyC
 8bYIcNhNlXwC6AMHkCN9MBBjqQ==
X-Google-Smtp-Source: ABdhPJyq6kPs3aTDX7JMDFUVa2bkelnhuHwf0oBYz90o0kWyjUs5OzSAVlV8oIlnS8lhxRVkPTDA+Q==
X-Received: by 2002:adf:f746:0:b0:207:9bc7:68ba with SMTP id
 z6-20020adff746000000b002079bc768bamr650851wrp.600.1650563880451; 
 Thu, 21 Apr 2022 10:58:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e6c62f527sm3113890wmp.14.2022.04.21.10.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:57:59 -0700 (PDT)
Message-ID: <3df8464a-8780-bb42-0b9d-a0ba85fa2af6@mind.be>
Date: Thu, 21 Apr 2022 19:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220412203048.23203-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412203048.23203-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libudfread: needs __sync_*_4 or
 threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 22:30, Fabrice Fontaine wrote:
> libudfread needs __sync_*_4 or threads since its addition in commit
> c477885e3f3c31d3922af1fc0e47e6f5f35b1645 and
> https://code.videolan.org/videolan/libudfread/-/commit/06c3cb9223a3cb5ab048e42ab353958f422a8f57
> to avoid the following build failure:
> 
> src/udfread.c:108:3: error: #error no atomic operation support
>    108 | # error no atomic operation support
>        |   ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f76d475f49d525095ac0054224b50b9e612691d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libudfread/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
> index 8d42570500..c1f3f23af9 100644
> --- a/package/libudfread/Config.in
> +++ b/package/libudfread/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_LIBUDFREAD
>   	bool "libudfread"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
>   	help
>   	  UDF reader
>   
>   	  https://code.videolan.org/videolan/libudfread
> +
> +comment "libudfread needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
