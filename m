Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4551E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 09:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF8280BDB;
	Thu,  2 Jan 2025 09:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhdOm0qcYG2Y; Thu,  2 Jan 2025 09:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EB380BDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EB380BDF;
	Thu,  2 Jan 2025 09:01:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC08E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02047403DA
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTm0EqrSHcAo for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 09:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33391403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33391403CC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33391403CC
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:01:53 +0000 (UTC)
X-CSE-ConnectionGUID: Z9KjCcBRQPiv7w1nM7Mcug==
X-CSE-MsgGUID: aOJErQizRlqiqR1Qgy2jyQ==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 10:01:50 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2025 10:01:50 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 2 Jan 2025 10:01:48 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 02 Jan 2025 10:01:48 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: UGaXMKpuRqqNUHIj2LYlUg==
X-CSE-MsgGUID: AgpA1NcwToaimkz1t1GdAA==
X-IronPort-AV: E=Sophos;i="6.12,284,1728943200"; d="scan'208";a="238137896"
Date: Thu, 2 Jan 2025 10:01:48 +0100
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Julien BOIBESSOT
 <julien.boibessot@armadeus.com>, Tal Shorer <tal.shorer@gmail.com>, Marcin
 Bis <marcin@bis.org.pl>
Message-ID: <Z3ZV/PANsIAWGU/x@yd-6wlzhs3>
References: <adc7c8fecb8ac3010b16178bdad062132dd0d0d8.1734713054.git.yann.morin@orange.com>
 <700bffe50d1bb2171de3695324f829f2@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <700bffe50d1bb2171de3695324f829f2@free.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1735808514; x=1767344514;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=l+nEcszcs+PCRb3XALM8VLo8kI4E8z8sZFNJYPmE72M=;
 b=OtB2rwY/+BaS6gSM7OFIrRsSbkRBUapqB2xstAEjMFiEB4bWSYBMRPgq
 QzQOiufXJnLzh7+WDBjJwUGd0mCS9k6CAZ0htrj+gyrzoQALvEajjYwPB
 1h57jBSZzAcB79AvlEQeCXiTlsSjdEZyOP3J37VacScnmulZ01RQMRrj6
 NbpxmLkGQKDgN3d69OXF6lwjHjzz7S4chcTav9FzOjZj6JSRadEr6j/Ep
 X9Y1dXZ2gYk5XQl1PWm/nnvf+wFuv2bwerfyZI/ety//Dl+zItH2tYOqZ
 MsNpZHWraWD6dOnVaUd6wXFDLJ4671JbvVokr5hk00P+ZC35umkNGmC7V
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=OtB2rwY/
Subject: Re: [Buildroot] [PATCH] package/usbip: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Julien, All,

On 2024-12-27 13:14 +0100, Julien Olivain spake thusly:
> On 20/12/2024 17:44, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > usbip allows configuring a client and a server, to share a USB device
> > across the network.
[--SNIP--]
> Applied to master, thanks.

Thanks!

> I added a comment in the Config.in about the hwdata/usb.ids package
> that is useful (but not mandatory) to this package.

Indeed. I did not add it for that reason, nor did I even add a comment
about it either: the reasoning was that other packages that can
optionally use it (e.g. usbutils for lsusb, pciutils for lspci) do not
mention it either.

I should have mentionned that in the commit log, sorry.

> Without it, usbip can show non-fatal error messages such as:
>     usbip: error: failed to open /usr/share/hwdata//usb.ids

Agreed, this is annoying...

> I also added in Config.in the kernel source directory as the
> package homepage:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/usb/usbip
> 
> I did that because searching "usbip" in search engines usually gives
> the old (pre 3.17 kernel era) homepage:
> https://usbip.sourceforge.net/

Thanks!

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
