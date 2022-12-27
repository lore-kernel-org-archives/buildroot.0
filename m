Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF1CC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFBE8139F;
	Tue, 27 Dec 2022 21:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFBE8139F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsrJ4ajIWy1N; Tue, 27 Dec 2022 21:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E6E8136C;
	Tue, 27 Dec 2022 21:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E6E8136C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24C941BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00EFB60C26
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00EFB60C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpInYnE6mM6j for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:44:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29E060C24
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F29E060C24
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:44:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 366F8240004;
 Tue, 27 Dec 2022 21:44:48 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:44:47 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227224447.67dea6f0@windsurf>
In-Reply-To: <CAPi7W82v_acXo1qva_7No-_0+zm-k79PyZ2k28tfi8sFP=EbrA@mail.gmail.com>
References: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
 <20221227223514.503ad1c2@windsurf>
 <CAPi7W82v_acXo1qva_7No-_0+zm-k79PyZ2k28tfi8sFP=EbrA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672177488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3r8iy+79TlRpIgWmHbYeVg4/v2/HS4PWBkkTCHzK5eA=;
 b=eWLtM7AHaVQD1yHCPf6jUkxDqlB6ffvM3clGcc1y3ct/5m8JUAehhjNgVyNi2+TWupY1op
 hybhGKC71JeRysLKiWdei3ggwv2EqP/e7QKMKiMWbajQcXpv+XBxtV47fDk6S7VMtbHrny
 WWOqeynwXN9odTsjrJya/kR4ajMSM4t2XHM5K3XEklhE5MqVd0Kp/3ZnKizPRfQMVI1DHK
 yq3vHmppSsZl8+0YgylVUVhJT9cJwqJqGDAdDVGlbcYxR8oHO62RaWw12Qni+wsMWhRnav
 YsOFk0bo03EeKV5691EfZRlYPiV2gXN+0DVXfYUFpM/FIZAIJ0Y68FDRHzqlIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eWLtM7AH
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: add libdeflate optional
 dependency
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

On Tue, 27 Dec 2022 22:40:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I see it's a policy that has not been really applied to the tiff
> > package, but I'm wondering if there's a particular reason to not apply
> > our normal policy to this new option?
> 
> I decided to enable it by default for backward compatibility and because
> (for an unknown reason) most tiff options are enabled by default but I can
> send a v2 if needed.

Could you expand a bit on the backward compatibility reason? Is that
feature today enabled by default?

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
