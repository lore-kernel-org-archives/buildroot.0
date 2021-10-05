Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52ADC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 08:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759D761425
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 08:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 759D761425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD39402B3;
	Tue,  5 Oct 2021 08:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQfP1wZwSJK2; Tue,  5 Oct 2021 08:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BC84402BA;
	Tue,  5 Oct 2021 08:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE59C1BF574
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 08:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD08402BA
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 08:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRjWxW9RmJUM for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 08:54:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 243D0402B3
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 08:54:27 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C2057BFA41
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 10:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1633424064;
 bh=LYVGe6725KeUErmfoOTUt23RuIS2RwcqHKzpk5SCIaQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=iBIVz9YmLGQfym+kvMEN07Qz8SQfNyxgg/Cnu1335lJ5AhK88mlFNT3AKaIXdXmO5
 P+Y3FHChqAPRfi7nD4kovXynwNVxXaTFuW6V/8bXQZ2tXQ2WKRZv4mGPlwIYTqWWfB
 DG6l2CNYBPfdQ4Si4NdTJLbDYKGuk17Rxu707TZ+ilbcO9g+ivq096PE9+DM/XLBGK
 3rgrH5NQjS/jpPAhhp5yA/tE2Gydcnc7U/6xBQd9Xa7Sjw0fTGoZU1JXWqGGlqvtDc
 WcDqGwFDewsQtTX/5/OxS3Bp9BC8e13zFMn7v51ckKa6TMBaf1G7AbkPy0PgIqiN/d
 45xd7i2R2fwYg==
To: buildroot@buildroot.org
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
 <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
 <878rz9j97a.fsf@dell.be.48ers.dk>
 <d39a8eba-8e49-a9a2-6ec3-62c6969a0af9@grenoble.cnrs.fr>
 <20211005053351.GG1504958@scaer>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <e21124af-b549-cdae-9e72-d991ba660404@grenoble.cnrs.fr>
Date: Tue, 5 Oct 2021 10:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005053351.GG1504958@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

In response to my suggestion of issuing

    COLUMNS=29999 exec sh

to avoid the command line wrapping, Yann E. MORIN wrote:
> What about actually telling the shell the size we want::
>
>     # stty columns 29999

Good idea: it seems indeed cleaner than starting a new shell. This is
actually telling the kernel's tty driver about the terminal width. The
shell then gets this info from the kernel, via the TIOCGWINSZ ioctl, and
it uses this width unless it is overridden by $COLUMNS.

I just tested on an actual board running Buildroot 2021.08, and it does
indeed prevent the shell from wrapping the lines.

I will send a pull request. May I add your name as Co-authored-by?

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
