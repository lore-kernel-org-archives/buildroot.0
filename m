Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366C6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E60826D5;
	Mon,  4 Apr 2022 19:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jsF3gIcpukI; Mon,  4 Apr 2022 19:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8928267C;
	Mon,  4 Apr 2022 19:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 615851BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F91826A4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffp884Dbjmse for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:30:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A44E8268F
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:30:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a6so11192046ejk.0
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ctJUAsLXQb1RKDrk5gY+eHq7Vi/vRONJbOympdnEvEI=;
 b=UAiNeQi6Y6XJCG1YP7yq0AsLv2zlhkzeVtR2W3sWXAdTycIU1CgOp6pjZao6DXJgt1
 7QhlG/FTTMcm1ly29pJtCtdjuOCXwhYByahHpF5z1SkGovpb3xxfF0PZ1mJL/LEut6PU
 wxNniPCA9B21sdziEDuPQ4areUrcjWmBVScmjPcNRtbINPoBsLtmNjzCcpBXjbL0+fOC
 39H/tJqJKqSPPOSYxZAXUnw0qhqLgwtocvLfpMA6ZymrXPXh1tPn8w3+YBeW3eIueKSk
 BTIc01i4DSaqNa1/yFU9ohQndiVfKkY9Qp4chzIugp2yPaoNE036yjDh+Wo+/4MMkkGe
 6ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ctJUAsLXQb1RKDrk5gY+eHq7Vi/vRONJbOympdnEvEI=;
 b=sG7BhGAaZHpk62usjUL3dobLnkBHyfYUU77ZgCD/ILRDJ4iSmYgAIKiBmkjXAoUUU9
 cMYsPncqCNWLKJlr69dJ/V7I+UiCIKnCq3cJvTGzJgspRjekwTulwH8t8T40hgzfkD4s
 Kz8RtU/J+dUZ5fd0VU9/qD3ylE237RsNmkcRfBIL+UqFkIrfJzffFFOUF+1Pu2fSxpPL
 lbHFTtgmER76ADlvaRRJNpeiNO8ZWPp/xOctyX+isxqEnY6EstjuCz5RpaaZC4uy0NwM
 q8Alacwu/c4EGPORhfRQ1ACjy+nmQaoJt7m1o2nfGnZncKkEHdKnnEb4hdo4noHdHkWU
 oejw==
X-Gm-Message-State: AOAM531h9S53RuP3pfjGVWF1X0e5lN6MvuH1IsPuk0J+cB0YFD3AuSLc
 q03CIo6sc3MJ9Jz5bMu2mhNLbQ==
X-Google-Smtp-Source: ABdhPJzbn4Ihd3WlzKwIrBxL7rYXLS9Pqny5El5x0Z40+zXU/eCf+/Cl0rtgWuBPs01btrW0wrAznw==
X-Received: by 2002:a17:906:1b46:b0:6e8:4cc:b381 with SMTP id
 p6-20020a1709061b4600b006e804ccb381mr1119470ejg.563.1649100602972; 
 Mon, 04 Apr 2022 12:30:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 sa26-20020a1709076d1a00b006e6b23c8dafsm3136356ejc.164.2022.04.04.12.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:30:02 -0700 (PDT)
Message-ID: <c91e2bbd-aa76-6adc-71c8-f71250c6a917@mind.be>
Date: Mon, 4 Apr 2022 21:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403092059.2320843-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403092059.2320843-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-brotli: add missing C++
 comment
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 11:20, Fabrice Fontaine wrote:
> python-brotli needs C++ since its addition in commit
> 2f176b837bbd2eb5ab4d23b7ba0528e548287aa7 so add a comment about it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-brotli/Config.in | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
> index 1c09c26866..c31315392b 100644
> --- a/package/python-brotli/Config.in
> +++ b/package/python-brotli/Config.in
> @@ -5,3 +5,6 @@ config BR2_PACKAGE_PYTHON_BROTLI
>   	  Python bindings for the Brotli compression library.
>   
>   	  https://github.com/google/brotli
> +
> +comment "python-brotli needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
