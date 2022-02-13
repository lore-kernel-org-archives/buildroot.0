Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDA140360;
	Sun, 13 Feb 2022 11:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFiNw8HzCz5x; Sun, 13 Feb 2022 11:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C7B4033A;
	Sun, 13 Feb 2022 11:22:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55201BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A34D181A23
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySSIAHoou6lU for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:21:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4952981A1C
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:21:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id p15so31827445ejc.7
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bRtgV0Vt3bk/7aqmC8lnb/QPefj+yv2IT8DWLf94NSo=;
 b=YxayLMNj32GisyjIviAozYpI3pcsDOdf5q1WAeAz7q1PhXhY1cSxypfC0jb8laim5m
 RCbMxouP+KsmDzUoMR3NSSBgD3hu6J6PezRlT1JOz6ZO70bYZLVsxCQTD4OAb96O/xDE
 eFMm3T2fGVpWk7FNPYQZGPfHnm+ODBTywjYi8Pz/L+w1qkA8t2oSxCqFt0LHxpEQplyi
 UvtyUJdb/QIv+GrPrxuXTOccgA3VcYMf8z0HDB8IJxoaC0emNHdZS0bSJsloSJEliFsR
 FrWqesgQBCzSt4yLXoj+9RxiM1wV2hjadkuW5KnsCPjMpEofes6lCXqTUQR74LqPUVFx
 ymdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bRtgV0Vt3bk/7aqmC8lnb/QPefj+yv2IT8DWLf94NSo=;
 b=s7udSjMmD8tGvVyn+DFqNlyJ2xviy6LeDuvLqZlCuyMVrlrCzqmEt2WySOhwtw8qo8
 pNK9XFZybmOCTGEXngzic3bLUu2H0VrT4iq6ed3IBvcd7SkKprvF/nsFwyWRbXwFxmVJ
 RMmzU6QYm2bArH/sF6XjlvVl+kxW/6Wc9a7egVX0Bp5R10RFIYswhiK6zk/5DYotjH+N
 Y4EB0C2omtndpUSFbWMsLJuVzkzChnqkoyfKk3i3wguYdqZwtqAMjqKMVnOlN7yIDpA+
 rjVkk05S8LrFBzitJDwsjci8jyX7bY5wizUtXHF0KAZjAvPAkJDf7TVZtMnJqMf3XJPU
 tvzQ==
X-Gm-Message-State: AOAM532NCLSCK8ac166uLlytF2c6+qijK7iVmplQrAq5oR4qYAUL1iTP
 k0aX8Fuutv4J5gpeyo3piSpwaGZpEaFqCA==
X-Google-Smtp-Source: ABdhPJyyyzK2sWQP0xgO+JgxHCbRhPcxf7uMatKdNGtSuVPgsp5v6FtAXc6muN4iCl1m5SbFn/4AAA==
X-Received: by 2002:a17:906:72d6:: with SMTP id
 m22mr3626992ejl.662.1644751315407; 
 Sun, 13 Feb 2022 03:21:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h26sm9591968eje.146.2022.02.13.03.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:21:54 -0800 (PST)
Message-ID: <2ff02c8e-f9bc-8acb-28d4-c4e8297b90fc@mind.be>
Date: Sun, 13 Feb 2022 12:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220201174202.286878-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220201174202.286878-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Martin Hicks from file
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
Cc: Martin Hicks <mort@bork.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2022 18:42, Giulio Benetti wrote:
> Martin Hicks asked to not maintain cryptsetup anymore:
> https://lists.buildroot.org/pipermail/buildroot/2022-February/635413.html
> 
> Also he doesn't mantain any other package, so let's remove him from this
> file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5255b096b0..555723867e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1847,9 +1847,6 @@ F:	package/rpi-firmware/
>   F:	package/tzdata/
>   F:	package/zic/
>   
> -N:	Martin Hicks <mort@bork.org>
> -F:	package/cryptsetup/
> -
>   N:	Martin Kepplinger <martink@posteo.de>
>   F:	package/tslib/
>   F:	package/x11r7/xdriver_xf86-input-tslib/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
