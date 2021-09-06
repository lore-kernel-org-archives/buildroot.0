Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3759C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B50C60EE6
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B50C60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B36819ED;
	Mon,  6 Sep 2021 09:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWMtUWDGVKsU; Mon,  6 Sep 2021 09:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CD781947;
	Mon,  6 Sep 2021 09:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9491BF315
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CED240410
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDNLFiZuiq2s for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 09:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1104C4040A
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 09:07:34 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0FB2A22234;
 Mon,  6 Sep 2021 11:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1630919247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEBW+hbDItkIjYq4rkkfcnDGTI4IsCi4AwMes8HATCU=;
 b=ppf+JEv8woQd2sGmxMgV+4WhvJGOsT8bEP6ORyDAqEn0ZhgVhYZ7/rxskIqYoQzjwmAl2W
 lm8s/XXo2jGOsQBObOBvtIceZIr8jv9UHJLMt+4bRsZ+4++0ebuy/rx2fBpPy0qNY5+CSd
 Wab7Rl7gdqRkAx9GIDkLxptyPwR5gKs=
MIME-Version: 1.0
Date: Mon, 06 Sep 2021 11:07:26 +0200
From: Michael Walle <michael@walle.cc>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20210905173446.44137-1-yann.morin.1998@free.fr>
References: <20210905173446.44137-1-yann.morin.1998@free.fr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <468214090e2bfb87ce68073a2794ae6e@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kevin Tomary <kevin.tomary@hotmail.com>, Leon de Rooij <leon@exquisip.nl>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Am 2021-09-05 19:34, schrieb Yann E. MORIN:
> Version 1.46.3 had a regression, which meant the file that would store
> the filesystem image had to pre-exist, or mkfs.ext2 would fail to
> generate the filesystem:
> 
>     mkfs.ext4: No such file or directory while trying to determine
>     filesystem size
> 
> The regression was fixed upstream, and is now part of the 1.46.4
> release, so bump to that release.
> 
> Fixes: #14196
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Reported-by: Kevin Tomary <kevin.tomary@hotmail.com>
> Reported-by: Leon de Rooij <leon@exquisip.nl>

Tested-by: Michael Walle <michael@walle.cc>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
