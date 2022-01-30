Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2ACC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 23:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6427583ED0;
	Sun, 30 Jan 2022 23:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZK3lz7SKsi2; Sun, 30 Jan 2022 23:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A985E83ECA;
	Sun, 30 Jan 2022 23:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9E91BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B39C83ECA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECDtCExsuWvL for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 23:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C2383EC5
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 23:11:00 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p12so23113165edq.9
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 15:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=9yFOuFyApqAWHz6zp8T/OPVSHTV0Jpx5DgcuEVAavss=;
 b=oxbLdbPT7Ku2/qOSuiKhREKuK3AMT47f/dAHH6qYHbfCgJghx/KCLJf0Bg4EGx9aL+
 Z59OYUwDSprTj5oXCrac3fe9djVqbpLOdvhM20oJMRi0wX4LjAbU/hB45GAVVE5CnDPP
 U202Z5ayW5YEAQBU9UE3PgXqFa+dMJZBw6qd9VuKIMN6khSMFh5DRsgzCF4xzucJ2fM2
 4FExEPLuhjJp8wBKz1de/jM063ER5HMFuNR2tbrd2a1EpJxCDW1u8eEwh1OLcNM7et/U
 iySMOonWaR/8OyVDwoUGK38tvogsyazPX7P+6zdRnxfkC1eiNpOT+DCp9uo+TAysbCb7
 C/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=9yFOuFyApqAWHz6zp8T/OPVSHTV0Jpx5DgcuEVAavss=;
 b=vlZP1xFVgBvoMQL2fsuwVxJOfnxwK4IKbcWRdQy2IjZZBXl5Zg9MWrvrD16XgORD+I
 eFkX9o2aDoV6bM8H1C4uhSZV9pI/1bHqBVRDyu68IVbCP0Szh72F9afSjJNQ2PfPfYdy
 J1hcIGofs2dc2MbHDyHSbyK84TXhKJ9V9I562DxjRVCwHPLe1sGK5IAfFGDH/A56jH9U
 +QPnOoWhvnIHqp936CE56ZHXVi54uIuH4TbReRvw9x+fcAvnAOHBZUdrvbobfowv7pgH
 a7Ix+VC4JgbHaE4DjNA3/3b4zLRjUVT3qEC45KBsWBc/UvEwP4ZsNZmaebwvLCFPjQlD
 Tg9A==
X-Gm-Message-State: AOAM533RNgiJXmQZhz26DFcYuFjRWHuUzZQEi09dLKkMybqVws5FtZzL
 vE0yJA25IvVrfHc5RtWzGKU+vg7Dum5AxYuN
X-Google-Smtp-Source: ABdhPJxrblC1Vtl5X8CBLI6tW2M+uoTLqpEFvo45nZerwDOuAI0CAza1jd9RBkbUf96aC94zymvc8Q==
X-Received: by 2002:aa7:c793:: with SMTP id n19mr18436599eds.74.1643584258698; 
 Sun, 30 Jan 2022 15:10:58 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id q23sm10249558ejz.30.2022.01.30.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:10:58 -0800 (PST)
Date: Mon, 31 Jan 2022 00:10:54 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Yfca/lLi0G+ANQph@pevik>
References: <20220130215729.2653219-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220130215729.2653219-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 5.16.0
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
