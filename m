Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF701EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6893C612ED;
	Thu, 20 Jul 2023 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6893C612ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZlGeb_CC9tf; Thu, 20 Jul 2023 21:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06F660A69;
	Thu, 20 Jul 2023 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B06F660A69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051C61BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D0D40C21
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D0D40C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aswqqnTO3PO for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:15:23 +0000 (UTC)
X-Greylist: delayed 588 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Jul 2023 21:15:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16672404FE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16672404FE
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:15:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9460A40006;
 Thu, 20 Jul 2023 21:15:19 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:15:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720231518.7ee71596@windsurf>
In-Reply-To: <20230720184605.1020881-1-bernd@kuhls.net>
References: <20230720184605.1020881-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWTcHrCAYP6iAbS++bDKWtExrTj0DkdcmaIRd3V4ips=;
 b=ReLT46BpN4pLDA3APGh2bxmUZj0yevD6UMUlSPpFNMhQvVRqvlMObEIwDbi5YP3/qeWFfK
 UTb4+Rt/v+69Ao7lyxzb6+o2wnGBxRYqbPBrvvQ1ClS/yl5fkRGjeMSGSiqU2Y44fC/Hej
 Mzn+6GjjROauq4d7aAWEZ9Jn9mLzgJC3CZGq/CkR3k+nUM0vA7UivCejCQmhNPnYc+qHym
 lkC++wVih3+fqe9AD3QmUTO2w6lOnCUo7YJdqPUzx+8XPe9OrSGQ7d1AJLPstsFzNwLHYn
 EP/j68hQJ3JFCA1uUhU+Q90lMuFI/i1z4BRhWyQ5/PakSPNVOzRWM1gD39Vrtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ReLT46Bp
Subject: Re: [Buildroot] [PATCH 1/1] package/pound: fix pcre2 detection
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

On Thu, 20 Jul 2023 20:46:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Without this fix configure finds the host version of pcre2-config:
> checking for pcre2-config... /home/autobuild/autobuild/instance-3/output-1/host/bin/pcre2-config
> 
> Fixes:
> http://autobuild.buildroot.net/results/1b9/1b98078a28b478018cf60bae35974cb4033e2af0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/pound/pound.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
