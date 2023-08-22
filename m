Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E77AEE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3BD8174C;
	Tue, 22 Aug 2023 10:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB3BD8174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lk14jQsS4waB; Tue, 22 Aug 2023 10:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02A88175A;
	Tue, 22 Aug 2023 10:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02A88175A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 865841BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DFA6408CF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFA6408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw9C5ljjevls for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:09:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA3E1408B5
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA3E1408B5
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7416240002;
 Tue, 22 Aug 2023 10:09:02 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:09:01 +0200
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
Message-ID: <20230822120901.41a17d89@windsurf>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC8D762350@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AEC8D762350@Exchange2013.PRIMES.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692698943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aziq3ONKN5Qj4FSPAaLJqV9t7Oe/b4Uap7nUYVKWgu8=;
 b=cOVnSLGozVqI8Elr0pHZhbxj+rj5ZrL6PL8vAQlLEZFeSkZFsD2rcTCqT80uMqjkpXHSxY
 0ZCG6BJZXookK44x0GZIKf7McXdN4YNkdct/++4KZTNE0VY79cI8N1hkoikE3JQOZlSSqB
 jJF+1QH1apayGMn4RwzbDuxZ3mreG6nHnu7/gbUCoPOAle2bi3pUbODe0dZNmQ5NUdqyaE
 taOkLgM2yaBaR6nW7Sk9d2LbtbArojEhaYymMEwMtgln7ZwoI10kMb47N9t7n/fcNNZvGO
 7N2rKK5d/E/sLgA/UFtTCyko3d/hSF+SW8TPYdCZHuJmYo76tKwC1fkkEqf7XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cOVnSLGo
Subject: Re: [Buildroot] Camera Driver diesn't provide 60 FPS
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

Hello Gerd,

On Tue, 22 Aug 2023 09:39:06 +0000
Gerd Kautzmann <G.Kautzmann@PRIMES.de> wrote:

> I finally managed to build an linux image suporting my imx296 camera
> on the Raspberry-Pi 4 (32 bit) over loadable kernel modules. There
> where good examples for building a helloworld kernel module. At first
> everything looked fine, but than I realised the camera is limited to
> 30 frames per second. I compiled a test program confirming the
> problem under the build root kernel. On a, standart Raspbi image
> (Debian) I got 60 fps using the same drivers (compiled and installed
> over dpkg) with the same settings in the boot-filesystem. The driver
> is reporting the camera to be able to do 60 fps but test program (and
> application) are only reaching 30 fps.
> 
> Are there any ideas about settings in the configuration concerning
> cameras I might have missed?

This really isn't a Buildroot-related question, so I'm not sure this
mailing list is the most relevant place to get support on this
question. It's really a RaspberryPi-specific question.

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
