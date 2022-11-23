Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3058C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDFB610BA;
	Wed, 23 Nov 2022 21:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDFB610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HgMF6xJ70db; Wed, 23 Nov 2022 21:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C5A60A9E;
	Wed, 23 Nov 2022 21:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C5A60A9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 767531BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44A234040D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A234040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhZ9yYO5OCe1 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:46:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402F740116
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 402F740116
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:46:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 024E240004;
 Wed, 23 Nov 2022 21:45:59 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:45:59 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123224559.3fcd83f5@windsurf>
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669239960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88vN72Bfsk50jFfX5wkRbdHfxfM4b2DSL9tQaPmhIrY=;
 b=pk7dH0mQLa13+Z2JlresqS9e9Xm0hHEclUHYG4Vmv4JqbuWSgKgI9jozUtZVsiE550J/oB
 uAEmL+f/O5CcwTpsCwmKJllOp/L5aveyPvd3+Pfc7zc+HH+4VzsBDmf1rxskTrOErIIJM7
 k6kbns6ige8ZdO3q9x2krteISmGkmpcJA541J5rpzW7tZ5lWdyDSo1gKrc/XlqGsly5QYQ
 kfFtZl8fIntSAM9BE2HnX2VywwyNxDj2xtjONdu5QjIrrtD/UU7PCo6Gp6ygWGsErk4N6X
 BgoASGtiCj4mmoEXRjb0kICoQPC72C/BCapd4ICURJHmYW4j42RM3SR5fqe0Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pk7dH0mQ
Subject: Re: [Buildroot] [PATCH 1/7] toolchain/toolchain-external: update
 Arm AArch64 toolchain 11.3.Rel1
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

Thanks for your patch. However, you have again sent your patches two
times. Is there a setup issue on your side?

Also see below for a comment specific to this patch.

On Wed, 23 Nov 2022 11:52:51 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> Updated to gcc 11.3, gdb 12, binutils 2.38, glibc 2.35.
> 
> See https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

We cannot take this patch as this toolchain version is broken. See
commit
https://gitlab.com/buildroot.org/buildroot/-/commit/c80705452ef3c514f2c4026ee59b0ac5c02304fa
for details. Please note in the commit message "It still not fixed with
11.3.Rel1 release (2022.08)".

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
