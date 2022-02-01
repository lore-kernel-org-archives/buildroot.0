Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1346C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C216606E7;
	Tue,  1 Feb 2022 21:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpSbDLxqpjYT; Tue,  1 Feb 2022 21:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1679600B4;
	Tue,  1 Feb 2022 21:53:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2924F1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1484A401FF
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id engMq3-p2p25 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:53:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3924E401A0
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:53:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p15so58416475ejc.7
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SeNV1cEd/1yNeDEX+/9cPowIfoZvDIZj6Pw5/zeSIco=;
 b=VpwCOJ8MKd7FEhnO9Yet7Oz+6aKFe23q+vMc2MJmX7lmgTaLIGoGDB/OFmCUVTqtLD
 5u8ffDj2xxypJQt5ltvhayHH/uxhJmbF0pC5egkWjlT7gvJr+Gwofoq3aeApWvXbXzCW
 F0sw44y8i20cEtFHUyns/+GGjrJKUfCUsJlLW4n3x2TtlOLEhpnb3eh1bwqpjrwhRRDI
 prhv4Vbjocvm39wyXoieLdO0+jgc8QKWH+nO9xfQRNOda3Wn+qn7+OjFNkeuESzgXMGs
 T4ftsdaeLjQpuGvKOwU2uZiNg4yL5MTh4+oFi0ZVDCTON4hNf9C5hwfTGME/vdJl/QAP
 hlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SeNV1cEd/1yNeDEX+/9cPowIfoZvDIZj6Pw5/zeSIco=;
 b=kYY/WJRAiuEH6pVXWHribYQ4ju8qUf9rR1V0GuGAuodzQxg7BUcQCQ0mzWvzr0RHMr
 qtS/xQ+7keD8pXJ1WcQisV1u3vMe/h3CeydS9RO0LXxQhV3nrhnlqR1cQdiSynXjmtKc
 Tmc2gci1zT0oVxl0QBHxjtEzsg4uxnbGNgFlM792QPzcZpLaBStIRSvAKZu0dqZXmZwb
 Ss0xhFEyL6wMngSmzu6J75scIRs0/b0Ewzdq3FZhBwSG+zMyNTF7CsAs7BQGSbJTBgAo
 LPWbzNUc+Yygk7X0atPWAzG4FlIzI6C3hwWyAQ2Q2RW1L9c5+bjr0WinHcuD0nhY+mVH
 rWPg==
X-Gm-Message-State: AOAM532jckFLpem1fTGUAF1b7Z3Fus/v5x7xAtDi1HXFyiWMLgDwZ2jt
 4dPsE4WmhjAt3C3sTs2zECnVjg==
X-Google-Smtp-Source: ABdhPJztvcrnyFhThC5shiK1IhRt9j5/cHEEWNL7MChpm7CXQUjOtfaWR5yxfgn7UZsj2xrgSjwfZw==
X-Received: by 2002:a17:906:a002:: with SMTP id
 p2mr23027264ejy.129.1643752399431; 
 Tue, 01 Feb 2022 13:53:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l3sm19636266edr.61.2022.02.01.13.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:53:18 -0800 (PST)
Message-ID: <168006d0-d098-07e2-7203-489d7573a3ec@mind.be>
Date: Tue, 1 Feb 2022 22:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220124100920.3005564-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124100920.3005564-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/efl: fix build failure with eeze
 disabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/01/2022 11:09, Giulio Benetti wrote:
> Elput depends on eeze, so if we disable eeze we also need to disable elput
> by setting the option "input" to false.
> 
> Fixes:
> https://bugs.busybox.net/show_bug.cgi?id=14531

  There are two other patches that somehow deal with this issue [1][2] in 
addition to this one [3].

  Could someone choose between the and mark the rest as Superseded in patchwork?


  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20211230221904.3064022-1-fontaine.fabrice@gmail.com/
[2] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220129224651.1282263-4-romain.naour@gmail.com/
[3] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220124100920.3005564-1-giulio.benetti@benettiengineering.com/


> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/efl/efl.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index ed0a8acc1d..c93961475d 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -65,6 +65,8 @@ EFL_DEPENDENCIES += udev
>   EFL_CONF_OPTS += -Deeze=true
>   else
>   EFL_CONF_OPTS += -Deeze=false
> +# input(elput) requires eeze, so disable it accordingly
> +EFL_CONF_OPTS += -Dinput=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
