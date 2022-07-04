Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 06:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC73F403B8;
	Mon,  4 Jul 2022 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC73F403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teRbgFQp3Buc; Mon,  4 Jul 2022 06:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B309940112;
	Mon,  4 Jul 2022 06:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B309940112
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E38031BF399
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 06:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93F540112
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 06:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93F540112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytemUF6VPH7A for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 06:46:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F957400F6
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F957400F6
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 06:46:02 +0000 (UTC)
Received: from opfedar02.francetelecom.fr (unknown [xx.xx.xx.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4LbxCX1Zkgz2xVD; 
 Mon,  4 Jul 2022 08:46:00 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 08:45:57 +0200
Date: Mon, 4 Jul 2022 08:45:57 +0200
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <5037_1656917160_62C28CA8_5037_313_1_20220704064557.GB2889@tl-lnx-nyma7486>
References: <20220109110736.3963-1-nolange79@gmail.com>
 <20220704064121.GA2889@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704064121.GA2889@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX202.corporate.adroot.infra.ftgroup (10.115.26.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1656917160;
 bh=MRcSUshqsqIQU2ef8UFBtJ7HIWkmn8+b59+fGXtkUC4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=hgr73DMpjOxWtRUwPMqm/a+mRujILDmJpzjtu233Tvmu74N760ifZmBvXO+vssIPE
 zI13k2MDTyHcij6GbnJsUz27UU0/D+CNkvP52NPEXLpGXzxgeZaTDZryaRZdMdo2xx
 nPWGN8ZEahPpD2GQqLUtBwEk7slKIE1YDlITQ2bUtU4n7Kx58cuvkHU0XZEqbmj+hX
 BXh8P5yJ3Xd9nNmToSVAnM8ARelX9NuiJMhQ+6gKPRcS/hSYp31lZsiEdA+Lcw5ubQ
 RWs+oOi6DjTAiV5+0K6OVSmUwkYNWfo3FEcvRN2/bJrDk79sMd2RCPveK4RrSv62sE
 q7j64eCmeAkyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=hgr73DMp
Subject: Re: [Buildroot] [PATCH v3] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: jeremy.rosen@smile.fr, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert,All,

On 2022-07-04 08:41 +0200, MORIN Yann INNOV/IT-S spake thusly:
> On 2022-01-09 12:07 +0100, Norbert Lange spake thusly:
> > Especially for read-only filesystems it is helpfull to
> > pre-create all folders for non-volatile paths.
> I'm revisiting this old change of yours, and I have some issues
> understanding the original issue this is supposed to fix...
> 
> Indeed, for read-only filesystems, we do generate a factory for /var.
> This code is guarded by a condition on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
> so indeed, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we do not
> create the factory. But if it is set, then we do create the factory:

*if it is _unset_, then we do create the factory.

>   - move /var away to /usr/share/factory/var
>   - register its content as a tmpfiles.d:
>     https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L37

Note: this tmpfiles.d is currently stored in /etc/tmpfiles.d, but it
really belong to /usr/lib/tmpfiles.d (to later allow for an empty /etc
too).

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
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
