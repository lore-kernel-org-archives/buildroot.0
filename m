Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C228ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0F08129E;
	Fri, 23 Sep 2022 12:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0F08129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKGkXE4W2CP4; Fri, 23 Sep 2022 12:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8662081272;
	Fri, 23 Sep 2022 12:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8662081272
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9EB01BF349
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85371405A9
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85371405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id favIVGwG-emS for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:13:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012B5404A0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012B5404A0
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:13:38 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar25.francetelecom.fr (ESMTP service) with ESMTPS id 4MYrf83vrwz8tWc; 
 Fri, 23 Sep 2022 14:13:36 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 23 Sep 2022 14:13:34 +0200
Date: Fri, 23 Sep 2022 14:13:34 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Message-ID: <19862_1663935216_632DA2F0_19862_158_1_20220923121334.GC2981@tl-lnx-nyma7486>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923053057.9373660C2A@smtp3.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX302.corporate.adroot.infra.ftgroup
 (10.115.26.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663935216;
 bh=qJ6m/K64X3h0/NeSTTRb7Y/O5dmlzs7p2JG7ZRQ5TXc=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=RjR7KRxFytyDZXtYwYTciNgFK19b/6yhgVlYragl1tkdSFH2hwFxAMT+bWv7ZaDRw
 6Nl2NR8LjPRCcXpNc26gDMKaqg/uj8PtoZkL5Nn4yhs3D8A8keTrblPmsJ3tGrQlAr
 uEEvJeIA436NfQEvWon8ZkHbfp9FcxC4oQjRqBHSFdJGPPK6B/qUlPQqFnfmVhxx/v
 AplxBt54Yi7UTBUsRdD1eWsv/t5K4yDOd2/MHB5Nhd8mAzhHC6hv/G3JEEEP2PtCdc
 s74+NM4Fg9LMOi18bfP0t+0//vWqWTNufiqPwVlZP8cImN7vGHwMGaoIRWMoR7pWxn
 gtVllPhX7c7Iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=RjR7KRxF
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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

All,

+Waldemar for uClibc-ng expertise

On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
>     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     

This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.

So, I'm not sure to make of this issue:

    ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
    ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'

__tls_get_addr is only available with NPTL, but libusb only has a
dependency on threads.

However, __tls_get_addr appears in libusb-1.0.so, but the compiler is
built with --disable-tls (uClibc-ng LT).

An indeed, switching the failing configuration to NPTL indeed fixes the
build issue.

Similarly, switching the failing configuration to ARM also solve the
issue.

So, it seems that there is a TLS issue in uClibc-ng on or1k...

Waldemar, any insight ? ;-)

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
