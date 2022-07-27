Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753BEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00F984088D;
	Wed, 27 Jul 2022 09:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F984088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21fvde9tbfVD; Wed, 27 Jul 2022 09:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1C8409F9;
	Wed, 27 Jul 2022 09:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1C8409F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56EE1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90C0A81826
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C0A81826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 152rf7s0J8nA for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:55:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8658177C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD8658177C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:55:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FA4E2000A;
 Wed, 27 Jul 2022 09:55:02 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:55:01 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220727115501.00fa3be2@windsurf>
In-Reply-To: <20220727094317.GF1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-4-thomas.petazzoni@bootlin.com>
 <20220727094317.GF1085273@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658915704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCItI147iLxdMLADupYHMsABpHI/6k+3gJmJdJvG/Ks=;
 b=ITEkJ8amYnk7113BSL0o0P40CUlbknJRDGy+s+E2bu/FH/mNP6xtfFsJVM+UU1tI+U7Xrh
 rZpOvgVkd6oS/WhIhhA7tw9WeIv2nulINg95Fv/hHvI7k5Sfm7zJWJO5lHqmNVqIF/PZt1
 wKnVy6at6WEyKYkFw7J1K9uCLQ1EmUEKr54RO0A8hIqjxQIscri7wrA1JkVq4qQcU49dmR
 pxQoZv1QJcdW7R6s0KzSi3HFAxebo7VitWgxeZj+hg9E0dz1P3fBwbU+Xw9Lw5t1nEuR+3
 KXSN/YO5pkhIlk+sKIhVDNpgn5Rd4OuyynWVzcIeICz+fYFTmT52uXqYOME1BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ITEkJ8am
Subject: Re: [Buildroot] [PATCH v2 4/4] arch: rework MMU option handling and
 move to "Target architecture" menu
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Mark Corbin <mark@dibsco.co.uk>,
 Jonathan Ben Avraham <yba@tkos.co.il>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 11:43:17 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Applied to master, thanks.

 \o/ Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
