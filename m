Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1852DC10DCE
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 11:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C016340AB9;
	Fri,  8 Dec 2023 11:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C016340AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFilICNYz1Or; Fri,  8 Dec 2023 11:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112B840915;
	Fri,  8 Dec 2023 11:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112B840915
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C08D71BF37A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 980C443603
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980C443603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEE8TcmAI9d0 for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 11:38:19 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E648C404B1
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 11:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E648C404B1
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:38:16 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2023 12:38:16 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:38:14 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 12:38:14 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.04,260,1695679200"; d="scan'208";a="76672971"
Date: Fri, 8 Dec 2023 12:38:14 +0100
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Message-ID: <ZXMAJq84X14w97J+@tl-lnx-nyma7486-2>
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
X-Originating-IP: [10.115.27.50]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1702035499; x=1733571499;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=xCeiJfHSkb+M/IM6Drz32NX8cVsMoLtnA15gNI2BjRg=;
 b=XyxlJO2YZBt/trks9aUbujybdluyjP9uFmQTqwExR4w9fkvXlEOGj8JN
 u9A+pm76p9Drf/YXij8nRF+tZj7f5q3rz5jKFkx/dEKXVzXphYRtxPbZh
 aAdC8NUSrrXT0302CILnCvwq2MsYblQ+/MczyxMbPai1si40eYUPS/VH8
 kHKwZwtS0JuZilcebH8zK+ZRO7fzQ4+IIB0cKro2hpiH2b5g9Aden3xaR
 NtfV6SflIXfJnjt8JjheQ3iE7F84mwu9kuVE2H9fpTXkUC2nO99fCkKdA
 IETcJ0UAfD9jsiF/PuWBeCaTNJ255J+ObonF8rjx2Jf+vOb1oJyzaXs+6
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=XyxlJO2Y
Subject: Re: [Buildroot] help - custom user not working
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

Stefano, All,

On 2023-12-08 11:45 +0100, Stefano Cottafavi spake thusly:
> I'm trying to add a custom user to the minimal "raspberrypi4_defconfig" build.
> I'm using Buildroot 2023.11, following the manual I've created a "users.txt" file (in the buildroot root folder) with just one line:
> pi -1 pi -1 =raspberry /home/pi /bin/sh -
> The config file contains:
> BR2_ROOTFS_USERS_TABLES="users.txt"
> The build is successful and looking and the "full_users_table.txt" (output of the build) I can see the user definition above.
> However, when I try to log on as "pi" I get "Login incorrect" error.
> If I login as root and check the /etc/psswd, I DO NOT see the user pi
> Can you help me understand what am I missing?

Be sure that your users.txt is a proper unix-style text file, i.e.
lines are \n terminated, even the last one (proper editors, like vi,
will include the proper line termintaion).

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

____________________________________________________________________________________________________________
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
