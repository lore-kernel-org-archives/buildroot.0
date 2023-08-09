Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D124C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 22:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B1A41897;
	Wed,  9 Aug 2023 22:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B1A41897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHAwX5klySLu; Wed,  9 Aug 2023 22:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E46D4189B;
	Wed,  9 Aug 2023 22:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E46D4189B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 985371BF82C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B844064E
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B844064E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7uTwKSYAsAy for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 22:10:15 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03D3E405A2
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 22:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D3E405A2
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1qamLa1LWj-00FhWJ; Thu, 10
 Aug 2023 00:10:11 +0200
Date: Thu, 10 Aug 2023 00:10:10 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230810001010.55cc070a@gmx.net>
In-Reply-To: <20230809001212.0d61539b@windsurf>
References: <20230808180959.28091-1-ps.report@gmx.net>
 <20230808180959.28091-2-ps.report@gmx.net>
 <20230809001212.0d61539b@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9RQCg4JgA7JT1kH4RyhN0EoDkHOy1nDofPn9+Y3Oe6xcgtRuZeS
 VKcwGlcxo5di5JC7Eqwmottety6g8cnu+qJylkt58OnbxCvN4n+t65PGrx3SsAnhEwTQWRy
 s+3Bi8vFfqA/VCQTKb8WzyzhumG51iEou3m12ppLEwgEjYvugcsR+2YWp1MFeq5yT3OhhGt
 MgnbcpdVYyLUjenGvcQ7g==
UI-OutboundReport: notjunk:1;M01:P0:n6zHtznS6QA=;hIZapRp0Av8dIjKKZGLGJo9jouN
 HT+eD0am04vaB7mNLyL4PbShCrP0VDwiFkEd89C6LUeOvCUevj3aLYlLgDLFsnke5hibPaDap
 d9c4nKAuIT2Gjwg4285JQ5EC9FE4Rcga/6ZJ0osjgJO4APE76jPdXWFbbroN8telbOvsbC8Ad
 5JZnNuckkotc2yVN/FDAG9VYB9wsTc4Bu0ELAz+s4fhZ9zkE6lXPzN56T1zgI9UAyj2sLP/TH
 Ges5+3sAwCfscrYLUOxeVCVnwnFBLDaGdu9Y6DfQpF0tkyFP4CgNVZwEoMLhcndgPNPg5WyGQ
 gYTi0GoXUH01f8lDJNbsqv+jPbv1ffDKwU27dRVP8NjSf5TDu3GcBpPMkbZ2Ngp45rM3YG5Az
 MzdO7ef5nTKhPrX9uWoaIEmAr+PQpIU90F9yDTyO790cOvaXsYkAhUXb+UkQsYV/Arfodxuj7
 X6flf+7X+F/EKSq3Ky4eBaSZ9RGNRuEDXnrLodTGCrk0vQg/aD9QNseK4z9y5+tjazEVK/uru
 D3NTXS1Y0ZZGALOMTk4kq0ATO8C7jlXPUx/+4RTQCqedxPXtgfPjE8OlEMbCHIQ7KkBb97DpG
 aKYlOP17sxYQ2ZvGbJ7mfq8B0W7qAWGL+2C+/fCR5/CBi7VbWEtVmYz/ju3MStR4A5X135R22
 1gie7qtb2Y6eVn8ICxR6hAh7gMZRoXS6GhFlLewfViRLzVu3cr/Tjro93IFojhW3LdQ1HUQsx
 BHs0ommldId9GSRPmblVBJc6EUnEgK5v7A88Gf3Ijnze8Z3cyFDh2ID8OwFTHa3MFd3rc1pl/
 3zo4tJHEZYyAkQ0VIAyKQMwKidywqOH1jsN7UT45GSppAJBitCIyKMK3EoHCNb7IsWhyFWR0A
 Sb3k5ALjzTGEv9JY/Swa9IiHVFGHR8SO8+UkA3ULlJ1RAFW6Fk/wKSZqIi4jUufebnjzI6GR/
 x+bP/g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691619011; x=1692223811; i=ps.report@gmx.net;
 bh=ErH8rJV6wKb7K32LyI56+uX/3MWK/TK86oAA3T5c+qI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ln94drLuP0gOUrZ9ZsrfjwthEzdP+QcFsctEF5XghHt0/AkeoZVg1Wu3kw0C6D0C0WVJNBr
 jsHfqSq3MRLzWT5sA6jbVZdtXP5cVaM+0KKKKWNkKgVZKhw4nKAvosbBYUIAQ7+yjlcVMLOTt
 dwgchIBrZjeEbA5P039AKEqWqEdDnm6nZwVsURqn5KDrHfb/Jo1YutaESPFPu230Ykyarzbtn
 PNiH3HpT/9SvRFxxuHtpkY1ZKzxWRvx3lWgblu7yNgbFvnugck0OKFka/I2wlh5JkScaQ5EEi
 LNQQPIwRx16FbuvUuvmN+yk7568G/1ipWicMAzEXX8VGp5GxWzeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ln94drLu
Subject: Re: [Buildroot] [PATCH v1] board/raspberrypi/config*.txt: remove
 failing 'dtoverlay=krnbt=on'
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed, 9 Aug 2023 00:12:12 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue,  8 Aug 2023 20:09:59 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Remove failing 'dtoverlay=krnbt=on' from config.txt introduced with commit
> > 689b9ac439 ("package/rpi-firmware: rework boot/config file handling") [1] by
> > changing an dtoverlay option wrongly to an extra line (instead of changing
> > to an proper dtparam line), but as no one complained since 2021 just
>
> I'm failing to pase the "changing an dtoverlay option wrongly to an
> extra line (instead of changing to an proper dtparam line)". I'm
> confused by the "to an extra line".
>
> Do you mean that:
>
> dtoverlay=krnbt=on

To be precise the original was (and as documented here [1])

	dtoverlay=miniuart-bt,krnbt=on
>
> should have been:
>
> dtparam=krnbt=on

Yes (as documented here [2])...

Regards,
Peter

[1] https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/README#L2371
[2] https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/README#L213

>
> ?
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
