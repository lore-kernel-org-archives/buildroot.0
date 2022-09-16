Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5AFC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 09:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C21A680C7B;
	Fri, 16 Sep 2022 09:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C21A680C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYYva2rkktD1; Fri, 16 Sep 2022 09:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8D383F25;
	Fri, 16 Sep 2022 09:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8D383F25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE34D1BF398
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D36C183F25
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36C183F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YezRQQCiwlXA for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 09:28:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E5983F24
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08E5983F24
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 09:28:21 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr21.francetelecom.fr (ESMTP service) with ESMTPS id 4MTTJg3SZlz5w6J; 
 Fri, 16 Sep 2022 11:28:19 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 11:28:14 +0200
Date: Fri, 16 Sep 2022 11:28:14 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Message-ID: <21295_1663320499_632441B3_21295_461_1_20220916092814.GA22820@tl-lnx-nyma7486>
References: <86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663320499;
 bh=X52zo70Cjl1MgTqwuEnJjlqB20FsHDgXhXwFJF0VGVw=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Wd5Rmpji0hz+H2bVyyHOGazgDfHKPX7PhKh+qQnSL6D/ofcfrck76azdCNhIW94Sx
 LjTbON2mjSPEPoCe0CNP9YoSQi4OiQv/a4h7jqoYwKTtKIZUbEoeulCXF/CoKY0dSb
 ldMKl2OplFA+zhnVeGhRIHoD3sV8aFU7lcaetOZlsbwbLmwz5A1asWaYIwqpCXqOAa
 k8ZpwD65v8uNawVYVntEhNI1sVgT3KbBgtSzFRa7IIQzBayn8OcBgBo5dgzQ8KwNsE
 rNIk7DYs4laXGQ2OarQKmX+e5xIDEcfC4DCaS3mFoCUcJgszUGHhn+BxUEvXZ3xZ5l
 t1aHTd+V6RfEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=Wd5Rmpji
Subject: Re: [Buildroot] [PATCH 1/2] package/gpsd: bump to 3.24
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-09-13 16:37 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> In 3.24, the NTRIP and NMEA0183 drivers are now always enabled, so the
> configure options ntrip and nmea0183 have been removed (upstream commits
> f8cf4c922 and 838220fee respectively).
[--SNIP--]
> -config BR2_PACKAGE_GPSD_NMEA
> -	bool "NMEA"
> -	default y
> -	help
> -	  Generic NMEA support

I just noticed that the MTK3301 option has been removed too, as it was
an alias for the NMEA one.

I'll double check all the other options, and will re-submit an updated
patch soonish.

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
