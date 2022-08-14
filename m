Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33026C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B69A410C1;
	Sun, 14 Aug 2022 10:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B69A410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtBGNryr7m47; Sun, 14 Aug 2022 10:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A3C8410A5;
	Sun, 14 Aug 2022 10:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3C8410A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31A521BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF2B54019B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2B54019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2vTK1UxXPEl for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:02:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABE2400D8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EABE2400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:02:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B7E91C0006;
 Sun, 14 Aug 2022 10:02:21 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:02:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814120220.03c5b28b@windsurf>
In-Reply-To: <20220814083949.2781340-1-fontaine.fabrice@gmail.com>
References: <20220814083949.2781340-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GITaVf85vD7EgdjXfxxg/OEj6P58SJGpFz/lfElzkTM=;
 b=KP9IVbwwmDQ8UerWtH1VDlfMXtqRt7o2eUmlecMNshD0NCjsOFdX1S2LAI+OIKYQkOwYf5
 Z416iLoSJIbaUjPD231CRJ8ocAmOCGWsCzngWDJ4r2qcsq3pvDHuXC8LcRyp4ulCfYshsS
 Q2KHth8EQELgSu33JT61DyH6leRPeUecMSdqZMQFHL99yiGDPrWGTJMJwxCq4/m7bDLqmG
 bmnuUPHzeQlb938QLpjRfuX/QbCLTIWb6Jcvc8Stu5/FGZ/rgDfI4wNrvY+8L2jgQsRV6p
 2NSvAXGrwJ/f2m6oW2AC5h8NkFgLVvS+aOd5DWFfG1NnnZ9pAT+4gBfLvUS2AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KP9IVbww
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libvirt: fix libvirtd dependency
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 14 Aug 2022 10:39:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a dependency to BR2_TOOLCHAIN_USES_GLIBC to fix the following
> libvirtd build failure raised since commit
> f81242ae4fb64ab85af5d38e70246222276552ae:
> 
> Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> BR2_TOOLCHAIN_USES_GLIBC is only needed by netcat-openbsd, but a
> dependency on BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_NETCAT_OPENBSD
> can't be added as it will create a circular dependency
> 
> An other option would be to revert
> f81242ae4fb64ab85af5d38e70246222276552ae and to always mandate C++ even
> if it is only needed by nmap-ncat

My opinion is that it would make more sense to always mandate C++.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
