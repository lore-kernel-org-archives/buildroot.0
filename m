Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65936C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 08:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDC5040256;
	Mon,  3 Jan 2022 08:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guHcKi2gbGim; Mon,  3 Jan 2022 08:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5596400E3;
	Mon,  3 Jan 2022 08:41:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 974D41BF384
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 935B760B0E
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q62LkZ3C3eYR for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 08:41:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43A9660AF7
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 08:41:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x7so73657625lfu.8
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5mXbtJU1GTajuKur/3hpH8K6exbu7A/6RWh31XRzRrs=;
 b=mznVr3p4+J57YELgr+yQx+ju7SCn/cLsdGzEeq0txwtoeORagUZRn0+bvPYCEO8Xsh
 VkpTOEOGIwvDjP9PNyARLB/oVb1jtBOTkO45nITLhhiFVSKBocQZXzR1Eh7dInRdwghv
 +MwRaEV1RC6s8APz1fRDui84biRYXKQzIXpguuPq2OQ9g9w2QW8alMVrb5txLtMxsa+W
 HhUAtsqHtSkpFydEervOhXe7/YFVir2vdeEc+We+WVzOOlDOHfk5iu2nraNbwxtqbcWP
 otKVEQ61qlYjm2yby/jSOXOkQSEolJPUUWqwVDc9ML9RikL6T622z9KyvZt9IGd2gOCT
 9CcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5mXbtJU1GTajuKur/3hpH8K6exbu7A/6RWh31XRzRrs=;
 b=cYqWcN6HxzPwG5wl/KeQrOwlrtzHin22gPRXCXDYeTq64IgKr3pLHKYsnhU810gPAA
 KJuJ04ui97akhUhjU+jtKnGixwH0jU/rcrvelw2D/wLWQYAH1UHWf41F1ZJZwusOLoy0
 IMcDuDAJoORCIlHs3c1a7NLiy1PPmY08CVjcFhcBOoPHSvgg8jxaoBQnHRzDmu4O+E8t
 qKnnflGB+EfYZDOpzetkSZ2NyEwqOkzShd5b/Vcslpid79oLM+OvoZJySsYKg9egxdSi
 r4FCI8XYCdYkW9WxVCW/jEPXsYMVPajzrllwK77VKfLmcRFYy8Cd30HsRyco07D6XzyX
 bdGQ==
X-Gm-Message-State: AOAM533Uv+00/PrLSMjoCFPDnHcM6cExJNW6pvQ048mArHzD2MKQVmqN
 25q0Zn5mPEwfJecj0UEaiFc=
X-Google-Smtp-Source: ABdhPJzTkIDiBYSyH+oUbWq8ntT67fpiNGb43m48cpiO8QGW+yikTXlKOCRlDTY1Ro8g58mjXx0BXQ==
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr8731146lfc.171.1641199300049; 
 Mon, 03 Jan 2022 00:41:40 -0800 (PST)
Received: from luthien ([176.10.248.201])
 by smtp.gmail.com with ESMTPSA id u5sm2502102lja.36.2022.01.03.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 00:41:39 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
Date: Mon, 03 Jan 2022 09:41:39 +0100
Message-ID: <87bl0t1a9o.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 01, 2022 at 23:59, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> The LXC 4.0 branch is supported until June 2025.
> Only bugfixes and securitiy issues get included into the stable bugfix
> releases, so it's always safe and recommended to keep up and run the
> latest bugfix release.
>
> https://discuss.linuxcontainers.org/t/lxc-4-0-11-has-been-released/12427
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
