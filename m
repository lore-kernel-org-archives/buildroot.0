Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA76C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACB84231A;
	Sun, 12 Dec 2021 15:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1Zaxxb4Oecj; Sun, 12 Dec 2021 15:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82009422FE;
	Sun, 12 Dec 2021 15:13:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44DA21BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4263480F91
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PluwUVn9etLF for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:13:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57AD180F8C
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:13:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g14so43744987edb.8
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=b6qv99XbGBlLaWGeplQCyoYgOs9r7CRhOtHSMnzbcFA=;
 b=b0ou3vK3xNpkpyEHusjUOHc1ill4FP5h5eduChx6D/wKj/mei5XIiZdVOF7V5kinAm
 1p9NMZa34toauKvKNJjmmPHB1KIxzQWORcFCXSNDkDh0ZDxWa5Fhz2yn7d/4CyxKwWRM
 na3dyiL3nqbOpUFB/t8uuTRdYDkuCJlm2vwiAEyjLT6f8gWKfr/fpjfrl6i++4B3mtPm
 52TnlEJWXijXYMuFHrvLFwVhHzJRXyZA3i0qq2Z2w01eQi+wqvlWREQew3TZIvoRPinz
 x4MpncwqFvzB+qQyh4SBsHZ5VF1qK4N9pdfrIGRDvBG34AFuEpFQXjOTk+h6VIM4iQra
 73Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b6qv99XbGBlLaWGeplQCyoYgOs9r7CRhOtHSMnzbcFA=;
 b=g+obfy7U6Yh79FsrUj6qMGD+lEiQCAjLp3IP8/cTAviMrEJXSIt8tFO/IX3nNUau3A
 hbRZwDmJJ3to26GJp5Dm5p+1uDYsvNHC6rDl9gNgBOyy0iRHagNQZ1n7wa6VPYsYdzai
 bGmxneLCA17BTpAPSHcJLYWnN2IHCEP97BgyYYiT4RO0BS1wf//7l9kByKp3PtEhuksF
 qki5QTkTzfKZUmeW0cMPUBXzzpj4wCXIUIXGtr7Bdrre3PpyOok1Q9RvSREJ+6kG+TjP
 lnRaInQFc8KLXoopmiBRt0I3h3e/K1bGE/kHqGVpjg/vvmXTVnv3m0AOi8M7ZJzBb5Ia
 v+QA==
X-Gm-Message-State: AOAM5313PBi7T64jmNG+ynkO8S1x4k7uHgdg6B7BSXQzAAi6aXGjSvDd
 uEfHzaq5ElFm53UgoDuTg2RMQQ==
X-Google-Smtp-Source: ABdhPJzbhmPyUhpn+tSZWRLgo3da9voWjxb/hlVeu4gRbg+IlPzOyrqvK/BA28jyrWeufr8QeZV30A==
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr56544905edj.31.1639322027611; 
 Sun, 12 Dec 2021 07:13:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id oz31sm4629034ejc.35.2021.12.12.07.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:13:47 -0800 (PST)
Message-ID: <8468b393-e426-ee41-e536-7c82c70346bc@mind.be>
Date: Sun, 12 Dec 2021 16:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211212091026.482903-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212091026.482903-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/dovecot: bump version to
 2.3.17.1
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



On 12/12/2021 10:10, Bernd Kuhls wrote:
> Release notes:
> https://dovecot.org/pipermail/dovecot-news/2021-December/000468.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dovecot/dovecot.hash | 2 +-
>   package/dovecot/dovecot.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
> index a9043a2d83..0363b6e922 100644
> --- a/package/dovecot/dovecot.hash
> +++ b/package/dovecot/dovecot.hash
> @@ -1,5 +1,5 @@
>   # Locally computed after checking signature
> -sha256  224412cd77a23a3ffb857da294da200883d956082cff7257942eff2789bd2df9  dovecot-2.3.17.tar.gz
> +sha256  1c67ccccdc81a75007c01dedc02ad608c4d856c60a6b89b9cd246e79f72aa2b8  dovecot-2.3.17.1.tar.gz
>   sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>   sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index f8d28081bf..fb299a8e45 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   DOVECOT_VERSION_MAJOR = 2.3
> -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).17
> +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).17.1
>   DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
>   DOVECOT_INSTALL_STAGING = YES
>   DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
