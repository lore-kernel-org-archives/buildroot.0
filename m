Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8084C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637C04174D;
	Mon,  7 Mar 2022 22:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56OaRpwNGJF4; Mon,  7 Mar 2022 22:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D12410B3;
	Mon,  7 Mar 2022 22:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D78B1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CB3982835
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyP5FHMk-kOc for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:36:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96697825DC
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:36:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z19so615919edb.12
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3u3VLG6rzIYgr02ss0VkHK6Z5fGpJIgSA/WuxcO3a64=;
 b=Oh7S4fzgIiDGS09VhLeVNnWF++f6Erjm0/R9Ow/zjnscGfyXcPUargbCPLEYEeFunx
 oNErapU76tlK5ox84/GP1Of59UrdczfZo7yoyVxm0nfkij/oDnKwnPUaqFMhlU3x7y9f
 ww9Jr4jP2uBEjZnlMu1yvtenIzRcN2R+7Ty8vANUT/5GE0Qzj8H3fo2V152z7St8lpAw
 Iywm23x8UPIeqUxTwdWf0TMsHWSctxwYNvYhLMlO1w7+rm50lbivdHp8brGPFYummEMO
 ZKPvCEUADrjGuOZC9exgYJtlWRZxKq7ubSsiajMLlqTkqqY8ud5esAxeH+mlOkLUhnqD
 lqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3u3VLG6rzIYgr02ss0VkHK6Z5fGpJIgSA/WuxcO3a64=;
 b=b7Xdj7V40mLbGUWT9X4ogLUtVoqXpX4ukGgbgq3FMAKpw7JQlD80PHdxdBEh5RVloC
 7XXojxfXTytqZCWq8Hzp1LmSDmkiNgL9ro9+DlIsjWnFuH7L+P+xgVPVLhQD9V5cndpz
 KkjFIQWDIAhyUaOzbt2IJFD/R8XZjnQMtZl7AUC9iuJ8rNpM1ToRf4ESBblCWwTNwsVS
 LgTRcNeDTUob5su08vK8Auwge5IlL8q7W+gH+9Qgh5ZGDR3deWWQBHfhIl0w9ZvV0rNu
 8diDix9/XUjAbe53OnFa6EDkEEmfVyP3XguOgQAKBz3+mkNui22nyQLt8lUkCpqpZHJn
 8Dag==
X-Gm-Message-State: AOAM530ahz8L930bhIF21ytTN7MICXDq4Dserz1rpynhi0bM2xhaOB/6
 weka0VgUAheBrYUg8NKEknClXmS6W+gNiw==
X-Google-Smtp-Source: ABdhPJwtUBhE0ieUs+AU467HgDjyOLa5tOSz+N8ZGX9M4YAgxw2pmEX2sGvyVzdEKFFiqw0xZYHNxQ==
X-Received: by 2002:a05:6402:5111:b0:416:1ffb:a6da with SMTP id
 m17-20020a056402511100b004161ffba6damr12403963edd.312.1646692578936; 
 Mon, 07 Mar 2022 14:36:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm5156775eje.183.2022.03.07.14.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:36:18 -0800 (PST)
Message-ID: <6aaa39df-836f-055e-6f40-a077f690b669@mind.be>
Date: Mon, 7 Mar 2022 23:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jacques Samoun <jacques.samoun33@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <CACaKL1wxLACzdRqojEaji9p70okZ+EcBMJkUNOwYuDyvU-5AuQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CACaKL1wxLACzdRqojEaji9p70okZ+EcBMJkUNOwYuDyvU-5AuQ@mail.gmail.com>
Subject: Re: [Buildroot] cannot make the device_table
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



On 06/03/2022 13:46, Jacques Samoun wrote:
> Hello,
> despite all my tries, i just cannot make the "device_table" feature work as 
> described in the manual.
> Basically, i am trying to set 666 rights to /dev/tty + add a dialout group, so i 
> created the following file (device_table.txt"
> 
> /dev/tty c 666 root dialout 5 0 - - -
> 
> and have set the correct variable in menuconfig. I know for sure that the build 
> has handled this file ... but looking at the /dev/tty, it is clear that nothing 
> has happened, the permissions are still 600 and the dialout group has not been set.

  When you say "looking at /dev/tty", do you mean looking at the contents of the 
tarball (or rootfs), or do you mean what appears after boot? Unless you have a 
very specific configuration (i.e. device managemnt: Static using device table), 
/dev will be a devtmpfs and the kernel will override anything you have set in 
device_table. So in that case you need dynamic handling using udev or mdev.


  Regards,
  Arnout

> 
> Am I missing something ?
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
