Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85714C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24EDC61AF4;
	Sat, 23 Jul 2022 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24EDC61AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiVBrhiXykot; Sat, 23 Jul 2022 17:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDD161AEA;
	Sat, 23 Jul 2022 17:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDD161AEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA7861BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F9540515
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6F9540515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmnKyB2B3RQd for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:23:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A756B41676
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A756B41676
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:23:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE84A1C0002;
 Sat, 23 Jul 2022 17:23:04 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:23:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220723192304.4a222ac9@windsurf>
In-Reply-To: <20220620211606.772454-1-fontaine.fabrice@gmail.com>
References: <20220620211606.772454-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658596985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3r0ipvGb7GK7KyzzacVlEuZ2h5559bqNKa8RKa5xyo=;
 b=MnEY/BiuEsHBcK5+P1d+QIAE/8Lq7R5eDdismcHTCLKCHD+s5c/Vnl8ZAnFxljMQiB7KEq
 koYdI1Qge/wjqrS0dvoZWfQNM2v8t79SvMkkUqdtbGU4Cqp4lLOJ8cpCmDK5aiBYfuU9Ft
 Z+LVX+W8Uw03lHGUdDoKuM2gHp+3DwlzxiRondcjllCz93DQKJaolEj6jsq3uTUf8pUaLQ
 r5pAqEKaF0PoZD6tL03PtjMZZjen6Aqkdonm4yC4VSL07Qb0XO1CLPru3K++4wudqwMIWH
 lq2nNGA0KBb6yvxsPx86c+cgmUkApnWYXd37QyAZydrKBKAFQJbITvsKpWwi/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MnEY/Biu
Subject: Re: [Buildroot] [PATCH 1/1] Config.in.legacy: fix 2022.08 entries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Jun 2022 23:16:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 7763ba7007172ceb5e928ae5902735d727aaa90d wrongly added
> BR2_PACKAGE_RTL8723BS below 2022.05 entry instead of 2022.08
> 
> Commit 793ee1011e84bd79fa3d146dbe6c14c7fba39648 wrongly duplicated
> 2022.08 entry
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
