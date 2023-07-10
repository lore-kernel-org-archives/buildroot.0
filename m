Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B0FEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44685417FE;
	Mon, 10 Jul 2023 18:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44685417FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hgkvAjtUlqA; Mon, 10 Jul 2023 18:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5206C417F5;
	Mon, 10 Jul 2023 18:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5206C417F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0560A1BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE3F40B5D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE3F40B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43Tgyc_DixXB for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:25:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4C4B40B66
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4C4B40B66
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:25:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 167F11C0005;
 Mon, 10 Jul 2023 18:25:04 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:25:03 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20230710202503.0219463b@windsurf>
In-Reply-To: <1d33ec42-4e85-70ed-b93a-18eeeb6ff0db@mind.be>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <20230626070536.311268-2-gwenj@trabucayre.com>
 <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be>
 <20230707105851.0a3f3244@x230>
 <1d33ec42-4e85-70ed-b93a-18eeeb6ff0db@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689013505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbYvNvaP5r8qrHLApX8GQzQFA9X7PExl5YXgy8ttXaU=;
 b=LMhK+hq80t9rmzfhM0OGTD6WgPJhLuCTfm9w/d6pvcCdymikn4j4VH6Nsq3gmQS8/2PCEA
 5fn52sDNyxtpZx8mLd4FDvbfNpHIpw3+yxFTSTh5jN2AmmpMTSfXO4u+eJGQQEb7r0xvkY
 c5GY7kTE0tDHbYfZAIJkjcxwpsxKGv5jr76CoJzSI9t3I25hVKfQq9fSb4w9zbJEGqK8iM
 qE11Y+QLCQAyhtpK9gOmxqMCDC/IXnmUy5kFboagLETQAP+mGo6y7Xtbdb4MLcDHJBPCN3
 pWxOJ2OAwrTtfMuMPHSALal3ZIjCeEv/1ixQeV0H0yZiqhkqanXkROQASJ2XZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LMhK+hq8
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio
 python libraries for cross-compile
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gwenhael,

On Fri, 7 Jul 2023 11:44:21 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> > In fact I see I have missed to explain in my message this issue is related to
> > pybind.
> > If PYTHON_MODULE_EXTENSION is unset, .cmake uses a python script containing
> > sysconfig.get_config_var('EXT_SUFFIX')
> > This one return .cpython-311-x86_64-linux-gnu.so, because host-python is used.  
> 
>   Ah, in that case the environment variable you need is 
> _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)"
> This will make sure the sysconfig that gets used is the one for the target 
> instead of for the host.
> 
>   It's quite likely that you need all of PKG_PYTHON_ENV to be present in the 
> environment.

Have you had the chance to test this suggestion from Arnout?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
