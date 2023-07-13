Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60207C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 182A8417CC;
	Thu, 13 Jul 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182A8417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3Ct5JNA5Kcy; Thu, 13 Jul 2023 20:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40E8141796;
	Thu, 13 Jul 2023 20:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E8141796
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29D191BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D1442155
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D1442155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVaLJiDnqkaV for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:25:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF1A42151
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EF1A42151
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:25:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9756140007;
 Thu, 13 Jul 2023 20:25:28 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:25:27 +0200
To: Afshin Pir <Afshin.Pir@gallagher.com>
Message-ID: <20230713222527.3c1166c2@windsurf>
In-Reply-To: <SY2PR01MB27786466E6AB5D0D52F21CDB9436A@SY2PR01MB2778.ausprd01.prod.outlook.com>
References: <SY2PR01MB27786466E6AB5D0D52F21CDB9436A@SY2PR01MB2778.ausprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689279928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlGEj5ydHagra5JkfldFRkcCInnUTW8sNu/y6HBPsOQ=;
 b=p1Cf3ZEd1RiFAjfy7VdV6f0FeEeBbhRFvZ+lHhkeEpvi0jYMmhVZOYsx4E2PkNnGGzgIm6
 5Bl9+hEbDu6oquy3aWZYLEN2YowAK/QsFodzJk17NJYKTCUlfma9+grOKIIbAewhubc7q3
 vm8igKiy+7wpfX/Fqm5PLTOX8tIQ/FY1UdNSkaFiBg280pULO2LA8UtsooytBuQ9+4Pi7k
 wIIlXa20wvAVk9zgEx7HIwKomY9x/gs0/nHpXInJALiJmkKCbhc3RuoCfcRtsQoMbCfJAL
 6UfAVj8CVV2A1BD1ggEWXvgQrW5GQOWfKoN8cL2X3gOXGlWGIdS2MA/bgVpbFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p1Cf3ZEd
Subject: Re: [Buildroot] Accessing environment variables in Config.in
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Jul 2023 23:00:52 +0000
Afshin Pir <Afshin.Pir@gallagher.com> wrote:

> I wonder if I can access environment variables (or argument passed when running make) in buildroot .in files. For example, I like to have a Config.in file like this:
> 
> ```
> config BR2_PACKAGE_MY_PACKAGE
>         bool "cxos_unit_test"
>         select BR2_PACKAGE_XYZ if $(NEED_XYZ) = "y"
>         select BR2_PACKAGE_GTEST
>         help
>           This is my package.
> ```
> where NEED_XYZ is an environment variable (or make variable). Can I have such configuration file? If no, what do you suggest to achieve similar behaviour?

Yes, you can. See the top-level Config.in:

config BR2_VERSION
        string
        option env="BR2_VERSION_FULL"

config BR2_HOSTARCH
        string
        option env="HOSTARCH"

config BR2_BASE_DIR
        string
        option env="BASE_DIR"

However, be careful with what you're doing, it could very well be that
you're mis-using environment variable, and that there is a much more
Buildroot-ish way of solving your problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
