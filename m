Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E03C6FD18
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21BA4222E;
	Fri, 31 Mar 2023 10:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E21BA4222E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hq_tivKlPJ_H; Fri, 31 Mar 2023 10:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49A84222A;
	Fri, 31 Mar 2023 10:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49A84222A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 712F81BF82C
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5834560E55
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 10:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5834560E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTfkvqzIfw2t for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 10:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA4760E0D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAA4760E0D
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 10:20:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49475FF803;
 Fri, 31 Mar 2023 10:20:49 +0000 (UTC)
Date: Fri, 31 Mar 2023 12:20:48 +0200
To: Carlos Santos <unixmania@gmail.com>
Message-ID: <20230331122048.044d8dac@windsurf>
In-Reply-To: <CAJ4jsadrHeiTbVE=2VaxFQOg+UKKPRqii3BqbRDkuDO9sUZjbg@mail.gmail.com>
References: <20230322231511.551442-1-unixmania@gmail.com>
 <20230324111528.6fed9de7@windsurf>
 <CAJ4jsadrHeiTbVE=2VaxFQOg+UKKPRqii3BqbRDkuDO9sUZjbg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680258050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/K0p/k8QKqaUCRYe5E8wg5qsGX+fdmRm8YmLbFWme0=;
 b=o7D26ak/71mRV/4UD0YaCDLonN5NKuOmt+alTl6M6KsE+ao4cnEF7iLsPyfHccl88ffm5N
 3pykmq7Gb8Wu1vnAXytMAiCThuFg6hZZZJ5UJ0oLOZ1pATOfmte2qJIwZz+MhizVPAfzas
 SeEFPt2dmMZ1TazHLayL2HXqS/Bz+/4XKxcWfRsXLIFt3x1GgJ5J+D/BBIjtPIpInxBUYO
 A0+tramENXahR+qfsSHsOvKF+z8r6icvhBCdMPwyxcJG+2f9FR2xpBdubBhMLP151LkqGz
 YkAtb492RpVxtA2QKs0A0iaEAVTnLQFpaiPB0v7FO4YlfccbarGejy/Q/n3Fdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o7D26ak/
Subject: Re: [Buildroot] [PATCH] package/qemu: allow building only the guest
 agent
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 24 Mar 2023 22:14:18 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> Yes. It just does not install anything useful:

OK. As long as it builds, that's fine :-)

> The keymaps should not be installed if no qemu-system is built. I
> already sent a patch upstream attempting to fix the problem but the
> problem is still there:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00084.html
> 
> I also have a patch to install trace-events-all only if necessary.
> Unfortunately, making these changes happen in qemu takes a long time.

Thanks for this work, definitely useful!

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
