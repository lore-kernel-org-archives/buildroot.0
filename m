Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A83C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C43640BD9;
	Sat, 22 Mar 2025 19:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00B5d5ihw1KA; Sat, 22 Mar 2025 19:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570C140CD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570C140CD0;
	Sat, 22 Mar 2025 19:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B285E
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 19:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43F64023C
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 19:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xi84UTQ8Y6PS for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 19:19:35 +0000 (UTC)
X-Greylist: delayed 940 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 22 Mar 2025 19:19:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E582F40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E582F40118
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de;
 envelope-from=a.fatoum@pengutronix.de; receiver=<UNKNOWN> 
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E582F40118
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 19:19:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tw48N-0008CY-M2; Sat, 22 Mar 2025 20:03:51 +0100
Message-ID: <09ac641b-4cf5-42bc-8888-a55e6254438f@pengutronix.de>
Date: Sat, 22 Mar 2025 20:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakob Cornell <jakob@jcornell.net>, buildroot@buildroot.org
References: <070aaa04-49c7-46d6-9e3b-b4cf55b0b43f@jcornell.net>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <070aaa04-49c7-46d6-9e3b-b4cf55b0b43f@jcornell.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Subject: Re: [Buildroot] How to configure Barebox for 32-bit?
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

Hello Jakob,

On 21.03.25 03:07, Jakob Cornell via buildroot wrote:
> I'm trying to build an image for a system that has a Via C7 processor (IA-32), so I have Buildroot set up with an architecture of i386 and Via C3-2 as the architecture variant. When buildroot tries to build Barebox it looks like it's targeting a 64-bit architecture:

barebox no longer supports IA-32. There used to be legacy BIOS (non-efi)
support for it, but it bitrotted under newer compilers and was thus
removed due to lack of interest. On x86, the remaining EFI support is
64-bit only.

(This is x86-specific and doesn't apply to other 32-bit architectures)

>> make[1]: Leaving directory '/home/jakob/projects/igel/buildroot-2025.02/output/build/barebox-2022.12.0'
>> make: *** [package/pkg-generic.mk:273: /home/jakob/projects/igel/buildroot-2025.02/output/build/barebox-2022.12.0/.stamp_built] Error 2
> What could be the cause of this? I've selected "efi" as the Barebox board defconfig...no idea whether that's right.

You'll need to find out whether your board supports UEFI or not
(might be a user-settable choice in the BIOS) and then configure
another bootloader accordingly, e.g. grub.

Cheers,
Ahmad

> 
> Jakob
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
