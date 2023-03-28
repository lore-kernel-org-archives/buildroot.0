Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C6EC761A6
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 08:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DAEC820BB;
	Tue, 28 Mar 2023 08:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DAEC820BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LwJn7-mggGp; Tue, 28 Mar 2023 08:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7683B8208A;
	Tue, 28 Mar 2023 08:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7683B8208A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFC7B1BF2F1
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 08:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C94F460BD1
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 08:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94F460BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCNB7W7ExG9F for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 08:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7E660BC2
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C7E660BC2
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 08:44:39 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar25.francetelecom.fr (ESMTP service) with ESMTPS id 4Pm3C921wlz8tLV; 
 Tue, 28 Mar 2023 10:44:37 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 10:44:34 +0200
Date: Tue, 28 Mar 2023 10:44:34 +0200
From: <yann.morin@orange.com>
To: Charles Lohr <lohr85@gmail.com>
Message-ID: <9792_1679993077_6422A8F5_9792_101_1_20230328084434.GA3175@tl-lnx-nyma7486>
References: <CAGu26P-VdZMH1007cH_eTiA4BqkrYUfYgy5jexP=8dRAoaYopQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGu26P-VdZMH1007cH_eTiA4BqkrYUfYgy5jexP=8dRAoaYopQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1679993077;
 bh=bB2hW5t15ggIzajKsUCfjYnJC3cTEE461oUTmgUpy5Q=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=DC4NWU7mrwgpjwNE6KAMTZeOLDYOltk+MrbGGJpJTuDr3f2ZmXlsRCQWTXWJ828YX
 FqCZcb8vLz/lM/fEla6RTuDV7xHihoqtCn8DkFEdPAvpZ0PAcUykLf9QPiLwJd9nuW
 hjTqs8gd10WH1czk3JqCSLLqh8f8jF6UrFIWcaYHa1D9ezRv1tVyqE2nsDe6lLq3R9
 DkMojrxQgPxnZjmcZyBLYz+rvfBWrAeJ5WXhLtmXnvYZgfR301yAtARZTc0qR7aIzD
 XtcytTsdOGA/aPioaMBBukP7bmhIxJlwqQ8QnybjHXKkwIVLyoYugtPeZsexSaNmLl
 umIAK1k4htrLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=DC4NWU7m
Subject: Re: [Buildroot] Proper way to auto-login-shell-as-root
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Charles, All,

On 2023-03-27 16:24 -0700, Charles Lohr spake thusly:
> Are there any mechanisms to add `login -f root` to the /etc/inittab, to allow for auto-shell-login versions using busybox's init?
> I.e. something like the following:
> console::respawn:/bin/login -f root
> I can make it work if I manually edit output/target/etc/inittab, but I'm hoping to make it work in configuration instead of
> requiring wacky additions.

The answer is in the manual:

    https://buildroot.org/downloads/manual/manual.html#rootfs-custom

In that case, the best solution is to provide a post-build script that
does the fixup wth some sed magic.

Tangentially: why do you use login, rather than just spawn a shell:

    ::respawn:-/bin/sh -i

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
