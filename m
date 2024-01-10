Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1D2C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DE0F4369F;
	Wed, 10 Jan 2024 19:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE0F4369F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPBAOutBRbg1; Wed, 10 Jan 2024 19:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 720B643748;
	Wed, 10 Jan 2024 19:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 720B643748
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD511BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AE184369F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE184369F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm0KPAn1N-ux for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:58:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E5CE43731
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E5CE43731
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B603240002;
 Wed, 10 Jan 2024 19:58:29 +0000 (UTC)
Date: Wed, 10 Jan 2024 20:58:28 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240110205828.7af298a5@windsurf>
In-Reply-To: <71f2b96c764d823974a09ac850c76d58@free.fr>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
 <71f2b96c764d823974a09ac850c76d58@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704916710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvLEqGB2wMHTjp/O+xw0kggdjV9/Zdr07LGyqnS+Xsk=;
 b=C3ltD8KYl4WXMjkL8T1NLFFCi3bLLFjXrZc2ZhNmtcqBHvZhtd8BAI1TFyWWAOXzn1DgMg
 5O+6d1jplPWMwrKRkt1LardpKSzZWvRRQe4phvYWcPaSW5+ZrlGNAnrUrho1htrG92x+b+
 xPE210UO2ncYTsJBc5pW1RpJhvCsIucJCVk1iOEk/iUO5TAxA1LYxb4Jb7rvc9B5ooS7QK
 Sulbh4KolKqG6NyItXqzwv9llGDnrvBTr8CXV64szNHcKu42ere2s6zLmnrpkRUf6dGTnX
 kzSs8nGg37fIr7xYaPEqI1tuWG087TYzCzTT4ARbNlBzSoKZ4M7lxG6fczZgDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C3ltD8KY
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jan 2024 20:21:48 +0100
Julien Olivain <ju.o@free.fr> wrote:

> > Also, it would very, very good to add a runtime test case in
> > support/testing/ for this, as such Python issues are only visible at
> > runtime. I have added Julien Olivain in Cc, who can probably help with
> > this, as he is our resident expert in writing support/testing tests :-)  
> 
> I was able to craft a full PyQt5 runtime test, using the Kernel
> VKMS (as we used in some other graphical tests), and using the
> Qt QPA eglfs, which runs application directly on kms/drm.
> 
> I'll post an early version soon, at least to get some early comments.

Excellent, looking forward to it!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
