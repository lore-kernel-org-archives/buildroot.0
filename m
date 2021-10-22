Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942D6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 16:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EEE60F9E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 16:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5EEE60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ACEE4027A;
	Fri, 22 Oct 2021 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wf0XvxMxQCGW; Fri, 22 Oct 2021 16:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 752E0402D2;
	Fri, 22 Oct 2021 16:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11DB21BF36F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F119837C9
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 16:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtbYBjf6LkNH for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 16:27:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BFAE837C4
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 16:27:23 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id E5A90C6A9299;
 Fri, 22 Oct 2021 18:27:20 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 16:27:20 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Pampolini Matteo <matteo.pampolini@leonardocompany.com>
In-Reply-To: <mailman.345.1634903501.103149.buildroot@buildroot.org>
References: <mailman.345.1634903501.103149.buildroot@buildroot.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3233cc87f80410664ac65f8f4690994d@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] Please help me on kernel configuration with
 rt-patch applied
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

Ciao Matteo,

> Hello,
> 
> 
> I'm facing a strange issue on kernel configuration with rt-patch 
> applied.
> 
> 
> I'm using buildroot-2020.02.8 with kernel 5.4.78 and rt-patch
> 5.4.78-rt44, patch is applied through BR2_GLOBAL_PATCH_DIR variable
> and custom kernel configuration that takes it into account is passed
> through BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE variable.
> 
> 
> Patch is correctly applied and above configuration file is copied into
> kernel build directory. However after this the following message is
> displayed:
> 
> 
> Using /home/user/buildroot-2020.02.8/output/build/linux-5.4.78/.config 
> as base
> #
> # merged configuration written to
> /home/user/buildroot-2020.02.8/output/build/linux-5.4.78/.config
> (needs make)
> #
> scripts/kconfig/conf  --olddefconfig Kconfig
> #

It looks as if you have a configuration fragment file configured which 
is big enough to overwrite everything. Check 
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES directly below the kernel 
configuration file and the content of the file.

> And then my custom configuration is overwritten and rt-patch config
> variables are not present anymore in actual kernel .config file.
> 
> I also tried with BR2_LINUX_KERNEL_PATCH variable, but the result is 
> the same.

I do not think this is patch related; you still should be able to 
configure RT settings when you execute 'make nconfig'.

> May you please help me? I've used BR2_GLOBAL_PATCH_DIR variable to
> apply other kernel patches since now without any problems.

Kind regards,
Andreas

> Thanks, Matteo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
