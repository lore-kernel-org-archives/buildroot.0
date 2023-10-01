Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FF0E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D67381FB7;
	Sun,  1 Oct 2023 16:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D67381FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS1yBb-kK-tD; Sun,  1 Oct 2023 16:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27FE81FAE;
	Sun,  1 Oct 2023 16:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27FE81FAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 663A81BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4F160E17
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4F160E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0b-w6nZ1aL7 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:05:25 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04A0760A8C
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A0760A8C
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40652e570d9so34728885e9.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696176323; x=1696781123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AKutPbWK3RKl6ZdwhM4zsUEWtgKQs8lf8KeK5hoiKl0=;
 b=qPU0CObh5B/PtpW84SyUpqn8YEe7gZIsB9FWQaBzayNMMdnL3jXBeel7C8l1caO36B
 C5F+HCS31jOaZJGzT2raMmU/E8nzJL0vEJbfAMnk9DuqXKsRvuHKaelixXf8aOh44Z72
 yUOOz+yABcsvoGEnDpB90gRtNb+Qg4P9hsmwyX+sSdfKqio5ylVdJeph8T3MZyrVA81i
 zIWZpPEw25U5e29ev/C3H2w8MeLp8QpZpa/Ekv5mK/jjQDNgnjTICUGcg3R3K2iEeV7e
 5xRxlysKDFmeYxwCdgkPRQMsIn7+17HFUf11zIgY8kGOZ3+MzDQ8SdnYFYvTijI/DeLh
 8TnA==
X-Gm-Message-State: AOJu0YwKVx+5ZDrIGWdhITynfsoomHOIJ2Gbs8KpI0B52do/ivizy4vR
 wJeTIIOdwP5JoHsjSSBy3cLofg==
X-Google-Smtp-Source: AGHT+IEkOUaVNNSkK3d3lM+MQkg6FDd1/75kSmdS5QAZ5Jef2gjqkjSD9iPo7GMx698JOKDw6PnESw==
X-Received: by 2002:a05:600c:5118:b0:406:599f:f934 with SMTP id
 o24-20020a05600c511800b00406599ff934mr6519246wms.12.1696176322611; 
 Sun, 01 Oct 2023 09:05:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c22d900b004053a6b8c41sm5505372wmg.12.2023.10.01.09.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 09:05:21 -0700 (PDT)
Message-ID: <dfe9844e-5208-4d19-3af9-0faf8c0a5abf@mind.be>
Date: Sun, 1 Oct 2023 18:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
In-Reply-To: <20221018034605.800593-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696176323; x=1696781123; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AKutPbWK3RKl6ZdwhM4zsUEWtgKQs8lf8KeK5hoiKl0=;
 b=SNTumhL3xDiUZu+Yta57D78u/4g531S2w9CmJa5+OSyozQwrVzrItvhbC2/bC94pR5
 KiGntZYFEDEvivWqVUDRdOgj6/DlI51o+uAs282KCWfRcw2PZv/iY6r9F7/BAxXzBhFf
 v5GD4RM0KFrzBgz56jfNFr8vb2bKqOl+KvjYAPki5R3/QMlQf7V4ocga7EX0qS5oizMW
 08/fo38h6qBt7UdQkof8TqExD16d9x83WUpRQ2w6qLzoO88O1xOxVV6JGJdI0nz/Vynw
 5GUU3mwXgaNCe9Gtw4R2og/thO9I6yLq2TG832DAlwwgfvlVpuT51WorE04oxpch3CeZ
 /Vpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SNTumhL3
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 18/10/2022 05:46, James Hilliard wrote:
> These command rely on the clean operations being first so that the
> stamp files being deleted will rebuild the targets.
> 
> The execution ordering of the clean and rebuild operations may
> change, for example if --shuffle=reversed is set.
> 
> To ensure the evaluation order is always correct use double colon
> rules to make the evaluation order explicit as per make docs:
> 
> The double-colon rules for a target are executed in the order they
> appear in the makefile.

  As noted in earlier discussions, this feels a bit hackish and it's not clear 
if this behaviour is going to be kept in future versions of make.

  Since make 4.4, however, there's a better solution: it introduced a .WAIT 
phony target that enforces the ordering of dependencies. So I instead made a 
commit[1] that uses that approach.

  Regards,
  Arnout

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/7e3105d5c8bd9ab31e728af9732a67d203c0a2e4

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/pkg-generic.mk | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f24e03a325..6cb461af90 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1057,17 +1057,20 @@ endif
>   			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
>   			rm -f $$($(2)_TARGET_INSTALL_HOST)
>   
> -$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
> +$(1)-reinstall::		$(1)-clean-for-reinstall
> +$(1)-reinstall::		$(1)
>   
>   $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>   			rm -f $$($(2)_TARGET_BUILD)
>   
> -$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
> +$(1)-rebuild::		$(1)-clean-for-rebuild
> +$(1)-rebuild::		$(1)
>   
>   $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>   			rm -f $$($(2)_TARGET_CONFIGURE)
>   
> -$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
> +$(1)-reconfigure::	$(1)-clean-for-reconfigure
> +$(1)-reconfigure::	$(1)
>   
>   # define the PKG variable for all targets, containing the
>   # uppercase package variable prefix
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
