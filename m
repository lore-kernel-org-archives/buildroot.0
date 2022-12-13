Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2861C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 08:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737CF408F0;
	Tue, 13 Dec 2022 08:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737CF408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZhFm-H4qm-d; Tue, 13 Dec 2022 08:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A411540105;
	Tue, 13 Dec 2022 08:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A411540105
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA9C31BF3A4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 08:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62FB600C4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 08:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62FB600C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kfe4qeXNjX9K for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 08:39:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705B960B57
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 705B960B57
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 08:39:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0BA3BD11C8
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 08:21:58 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9C36FF80C;
 Tue, 13 Dec 2022 08:21:52 +0000 (UTC)
Date: Tue, 13 Dec 2022 09:21:51 +0100
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>
Message-ID: <20221213092151.74c1481c@booty>
In-Reply-To: <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
 <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670919713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3WU0qnWdBH79oxhr2XSsUwqLrJIv+0aizebTPGDwig=;
 b=pbnraqubjEnPX10QfX4/LHGQ94LZkq9BaymLf9roWyAx+3r87ALLQeG7Bg5+WodHNTeyd+
 v7+6cM5xtcFJRdrqNtczD8/yavH5fLvS7aFrCKGBQnHbxiueRzEPSlTsnv3x0+1p6u2H9t
 5PzQg//a8Jjl1zcexGDfcwNEHjbYk9gG9UpzeArxPB4R3lXNXSIh8Upf7S8qGELXjHjWRm
 2K32gcFCiCKp7ioTGfR5PrBbVfHn5toc7iABG4lmkajbJ3Rr2nv59nO1PIoRAcYm7yuXu5
 Vv6opoEVr6/sNJ/X0qn1wHBjn5M9KzaVCB5JIJlG9cdCPkcHb5/4WTnDpnUCgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pbnraqub
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] boot/uboot/uboot.mk:
 support binary pm_cfg_obj
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Mon, 12 Dec 2022 15:41:27 +0000
"Maier, Brandon L                            Collins"
<Brandon.Maier@collins.com> wrote:

> Hello Luca,
> 
> > Can you describe a use case where this would be useful? While I
> > intuitively understand there _might_ be some, I cannot find any good
> > example based on my experience.
> > 
> > Building the pm_cfg_obj from source code is very easily done by
> > Buildroot, unlike building the PMUFW. Additionally one PMUFW binary
> > can be used on multiple zynqmp hardware, while the cfg obj is very
> > likely to change across different projects, and a somewhat readable
> > text file is way more understandable than a binary blob.  
>  
> One of our developers was having issues getting their pm_cfg_obj.c to compile with zynqmp_pm_cfg_obj_convert.py, so they decided to compile it manually instead. This patch set was the result when they asked why Buildroot wouldn't accept their bin file. However for our team this patch is now moot, as I ported your U-Boot fix for building Vivado 2021.x to their U-Boot and that fixed the issue ;)

Ah, good that you found the fix! :-)

> I decided to send this patch anyway, as I already tested it and it seems like a reasonable thing to support anyway.

Sure, it's worth having it out, in case a real use case will emerge in
the future we can revive it.

> > > This mimics changes done to the ZYNQMP_PMUFW which had a similar  
> > issue.
> > 
> > That is different: we now support two different binary formats, not
> > binary-vs-source, and detection is based on the file extension.  
>  
> I meant they are similar in the sense, they are both detecting based on file extension and then either preprocessing the file or passing it directly to U-Boot.

Ah, sure, indeed my point here was bogus. I replied to your email only
after reading the whole thread and I probably mixed yours and Neal's
arguments in my mind. Apologies for the noise.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
