Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C520EC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E19E40B6A;
	Tue, 14 Jun 2022 21:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWFN9vgmKH-B; Tue, 14 Jun 2022 21:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3592B40B27;
	Tue, 14 Jun 2022 21:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAA4F1BF28C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B42C640B27
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98J2M_kL9qm1 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 21:41:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B207409C1
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 21:41:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44A9D20007;
 Tue, 14 Jun 2022 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655242890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bv9sfLfO3rw2MwMUnlgbRGhVLjF+0HeBpN20uXp17Rc=;
 b=OMMCgjQayGbTnbs3gvotOnHHnr9i7begftsTvpr/k5J8iLW+2m5JT4F8aFvgwiPZaJhEpo
 pxkmg/yrMfpVbPs4wMBOAph45VJWLRg1/z1oXaO5i5AS2g+olsRgL+l7rKTwtYIJlGVEml
 FC0AHWZsMUxFDNuwbMBMI//jXTe7aWiBtZiVp/mO3xMCkAkj+HHr25urGMoU+RjveRX57O
 VQo2yOlUj3Ul3i+KCS7sdtQQiyOxDEgs17856M0d8ff5c6Ypl92UogykCgOcsntvtNWoAh
 3ta7+wORNUXNySZQE+OyDOLqOpOdzbVddRWyuk74XcMYhoAxVUSEmvpyWSZUzQ==
Date: Tue, 14 Jun 2022 23:41:23 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220614234123.61e3d674@windsurf>
In-Reply-To: <f780e253-f0da-781a-ffd8-e3381bf2d190@mind.be>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
 <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
 <12178427-e595-be4e-5da5-d4cf1718b9e2@mind.be>
 <20220614175844.45509426@windsurf>
 <f780e253-f0da-781a-ffd8-e3381bf2d190@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 07/14] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Jun 2022 18:56:03 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Yes, I thought about this (should maybe have written it in the commit
> > log), but I thought: external toolchains can very well rely on patched
> > GDB versions that could potentially have support for an architecture
> > that's not supported in upstream GDB.  
> 
>   I wrote exactly that in the commit log :-)

Perfect, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
