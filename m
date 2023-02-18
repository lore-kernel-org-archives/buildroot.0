Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D94C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDD64191B;
	Sat, 18 Feb 2023 11:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDD64191B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8v2Yx6Q9Hs0; Sat, 18 Feb 2023 11:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FA0E418D4;
	Sat, 18 Feb 2023 11:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA0E418D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0014D1BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3194418D4
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3194418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WviCk2lxxR70 for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:18:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713EE418A0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 713EE418A0
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:18:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 945FE2000A;
 Sat, 18 Feb 2023 11:18:47 +0000 (UTC)
Date: Sat, 18 Feb 2023 12:18:46 +0100
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230218121846.306f95f5@windsurf>
In-Reply-To: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
References: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676719127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RWdCckICt/hJmqBF6i2EfN7VbwK5zevPrN0VM/YjLw=;
 b=XdUL7RILBEFT1HMIGByUspSZExghJMO5Tz2EJq7FWhQN0VmmwKoKDv7z1KOU0HiAuKKPTB
 eMiXXMC0b72FQPYQ+LADfcLHCvoXOb9OapgMZbl88SyVPoEr+3hd52EPaU05tMs4vHlwgJ
 rb607tYKeITN41pqEMUrCejvkkWITvNNF8/neGhaeqEt/4Z/Q2rYWplLvqCmR/fstj8f6c
 5X6y1mZz4lkJlncOKVZXOgFKzD+ceUN0TrgXLoSOoWY3wCyEK2NOdVpGM5Do4lhq9n/As8
 Z/rWQcXz8SQLPinMMp96dmeeUwp0gZ+VoZtXFmGraBuGt5ODA+JNWpcRC0QYbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XdUL7RIL
Subject: Re: [Buildroot] Missing curl binary
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

On Fri, 17 Feb 2023 16:52:49 +0100
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> I am trying to include curl binary in my image. I have
> selected BR2_PACKAGE_LIBCURL=y , BR2_PACKAGE_LIBCURL_CURL=y in the Config.
> But still the curl binary is not installed in the target. Can anyone please
> let me know what is the issue here and how to resolve it?

I suppose you did a build with BR2_PACKAGE_LIBCURL=y, then after the
build completed you changed the configuration to enable
BR2_PACKAGE_LIBCURL_CURL=y and just ran "make". This doesn't work, as
the libcurl package is already built, and Buildroot is not smart enough
to detect that you changed something related to the libcurl
configuration.

Run: "make libcurl-dirclean all" to force rebuilding the libcurl
package (or do a full rebuild).

See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
more details.

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
