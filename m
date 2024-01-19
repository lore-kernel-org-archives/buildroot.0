Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2DC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 12:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C2241E4F;
	Fri, 19 Jan 2024 12:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C2241E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktBICLFB3vTl; Fri, 19 Jan 2024 12:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD3A41E16;
	Fri, 19 Jan 2024 12:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD3A41E16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D12611BF379
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 12:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C836FA2C
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 12:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C836FA2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ioi94_iaVU6I for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 12:33:58 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244AD6FA2B
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 12:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244AD6FA2B
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 13:33:55 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2024 13:33:55 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 13:33:54 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 13:33:52 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.05,204,1701126000"; d="scan'208";a="94683593"
Date: Fri, 19 Jan 2024 13:33:52 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZapsMGs7sk3V0SMo@tl-lnx-nyma7486-2>
References: <20240119031503.2967130-1-yang.li@amlogic.com>
 <20240119122342.6230902d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119122342.6230902d@windsurf>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1705667638; x=1737203638;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=JLwiXJgUVj5Z4JaqhT4WU9iGpKUSbBHTrM1DVXNNWRA=;
 b=KZ5cDb79ki9SI2/muVopRc9ovxK+nDeWbG7kdBPZ7Ay18mUM5BBngtNa
 IFfEtbH7EOuRwQ2/EUWGEsU82KbgeOpmoMHMgiE/d0/QBEQ8U3/Rl/lIw
 o2pw1G8zC14scCzIM458/J2Jaq4SMV8vJy3L2lu4KYYk9QcqEp3nCL1Xa
 CuHWrjADRgjCp1Yi+VftdbVmb/voXoHkdWmDkENHWdUpgbZ/arCZg+s93
 thHIXQ2Ct8GY7N9v016AcnpLOp/pb4IfHUKdT4b4iQjsgJhJS2ip63pSm
 J4oOPKGUsByAxL1wfUc/btfDDl/NyeID7mWhjgbfSsulEEAAKa62UQ3Xd
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=KZ5cDb79
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add scripts for
 Amlogic
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yang Li <yang.li@amlogic.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-01-19 12:23 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 19 Jan 2024 11:15:02 +0800
> Yang Li <yang.li@amlogic.com> wrote:
> > Add scripts for installing Amlogic firmware.
> > +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
> This option does not exist. Probably you forgot to add some changes in
> package/linux-firmware/Config.in?

In fact, this has already been applied by Yann@home as of commit:
    https://gitlab.com/buildroot.org/buildroot/-/commit/104b0fee839d3e4885329e77d1b8d553d552fb8e

I thought the review comment was explicit enough, though:

    https://lore.kernel.org/buildroot/ZaOiZNVvO7OuK3sC@landeda/

    Applied to master with the above fixes, thanks.

> Also, usually, our options are not per vendor, but more per device or
> class of devices. Which devices are supported by those 2 bluetooth
> firmware files?

I also changed the Config.in entry for the same reason you noticed.

I however assumed that they were Amlogic Bluettoth chipsets, as per the
path of the binary blob in linux-firmware:
    amlogic/bluetooth/*.bin

The path is 'amlogic', so it made sense to name the Config.oin entry
BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC and to have the prompt list it as
"Amlogic SOC Bluetooth".

If that was not correct, we can change it, though...

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
