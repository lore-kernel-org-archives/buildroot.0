Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FCBC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 11:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FFED60EC4;
	Tue, 14 Feb 2023 11:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FFED60EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c78MjemI7txl; Tue, 14 Feb 2023 11:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F2B60E8F;
	Tue, 14 Feb 2023 11:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F2B60E8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5061BF5A2
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3329480F3D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3329480F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aje9Bu9ZZLq8 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 11:18:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0359F80E48
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0359F80E48
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 11:18:51 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4PGJcT3SG1z5w3C; 
 Tue, 14 Feb 2023 12:18:49 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 12:18:46 +0100
Date: Tue, 14 Feb 2023 12:18:46 +0100
From: <yann.morin@orange.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <16600_1676373529_63EB6E19_16600_354_5_20230214111846.GB3487@tl-lnx-nyma7486>
References: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1676373529;
 bh=A0kaYIIBAzbMbuNkr4ZCYNybuyM+jNc7idegI+F3GFY=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=EbIlEyZo5joAYy3udaxlSSjvn/doyhFvaY86e+EFtU7CJCPZ2g2HILHwFYWmfntPw
 P3D/Hh0739SupAfGSpYts8xMMYYFjst3HvrzYsXAptIWNJoONv5QJzoW4F+BR47xPT
 IGDYp4vbcNzNctD5+n3P+EEqZd3tlzCjv2Bkell5M34Ls0PNEU6j7VOsGVrGvrDJU5
 gUJdFJQDnp+5iXzVcbUAEevJt6S1KT2PxaCDp65rTJRiuXmx/I/nuMpQihvEuEFJZc
 CdvBKRJmqGN7FBei9wYqS8ELuQJZAubLStM+cTDr48wvseaVAH8CZtz92R9PA0GJlp
 TwYiCsYhlVKgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=EbIlEyZo
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: disable package for
 s390x architecture
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-02-14 11:50 +0100, Giulio Benetti spake thusly:
> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
> package for this architecture.

Instead of fixing each and every rtlXXXX packages one by one when there
is an autobuild failure, can we just exclude them in bulk, since they
are all wireless drivers, and thus will never be available for s390x?

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8821cu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
> index a5a7b9d255..00a41b5196 100644
> --- a/package/rtl8821cu/Config.in
> +++ b/package/rtl8821cu/Config.in
> @@ -1,8 +1,10 @@
>  comment "rtl8821cu needs a Linux kernel to be built"
> +	depends on !BR2_s390x
>  	depends on !BR2_LINUX_KERNEL
>  
>  config BR2_PACKAGE_RTL8821CU
>  	bool "rtl8821cu"
> +	depends on !BR2_s390x
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  rtl8821cu wifi driver
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
