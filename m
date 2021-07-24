Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9B3C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 16:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB14560E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 16:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB14560E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92E2B4012D;
	Sat, 24 Jul 2021 16:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbNlDpL0Genl; Sat, 24 Jul 2021 16:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116054021A;
	Sat, 24 Jul 2021 16:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABB01BF59B
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 16:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A58A835E9
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 16:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEPaJYmopIGp for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 16:08:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E975A835CA
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 16:08:26 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id A41A3C1EA7E8;
 Sat, 24 Jul 2021 18:08:24 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 24 Jul 2021 16:08:24 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@busybox.net
In-Reply-To: <mailman.11.1627128002.212945.buildroot@busybox.net>
References: <mailman.11.1627128002.212945.buildroot@busybox.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <fd1f0d466e86fb61844e0b1e07464031@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.2 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] building linux kernel with defconfig
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Ivan Riabtsov <ivriabtsov@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Ivan,

On 2021-07-24 12:00, Ivan Riabtsov <ivriabtsov@gmail.com> wrote:

> Hi all. I am building the kernel into the buildroot environment, I have 
> a
> defconfig file that contains the following lines:
> 
> CONFIG_HAVE_GCC_PLUGINS=n
> CONFIG_GCC_PLUGINS=n
> 

Disabling an option in a {def}config file looks like this:

   # CONFIG_HAVE_GCC_PLUGINS is not set
   # CONFIG_GCC_PLUGINS is not set

According to scripts/gcc-plugins/Kconfig the preferred way to disable 
plugins seems to be setting CONFIG_PLUGIN_HOSTCC="" ...

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
