Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FB1EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E1860FF8;
	Mon, 10 Jul 2023 16:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E1860FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOMOsPhEXi8W; Mon, 10 Jul 2023 16:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3991A60FCF;
	Mon, 10 Jul 2023 16:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3991A60FCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC3C11BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 932E881F42
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932E881F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duREGCKcNj7i for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:09:48 +0000 (UTC)
X-Greylist: delayed 23:22:37 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FB981F40
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06FB981F40
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:09:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD23E0002;
 Mon, 10 Jul 2023 16:09:44 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:09:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710180943.7c1eebc1@windsurf>
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFscVIzakcV0oG4l5gf//jeqV8ktvn9/PNQIPPbILTE=;
 b=fldw/lKTTrEgitqz5JSmtVLBehfzUmd81LmBSMyOKa5ay89Xfp4O5qPoWEc/3yvfMN9ws6
 fE1JdlH5M7TPFynK3VXIAAYSKMtDxJoUm5nz65TX5yB6lBbKWL29SfSGRvrHl13efo7cm0
 IdJnRva08NgFuHoXGx6DxYfTlC+IkLqLi5PMss+HK15113DK0ltpV8RGEX7lgAXVE+8o5C
 R89A8ubFOFnO+cmlY0cRLHMVrfB/6wrt7G/+GaYdCPD1CkTJqWh11NKQ2F+MY9CCsChsEJ
 g0Re6MHkOUWRMFxFViOH0uouC40DdE2I2JI1yXRNNZzwmiBBuyxixyscXr3REA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fldw/lKT
Subject: Re: [Buildroot] [PATCH 1/6] package/perl-html-parser: bump version
 to 3.81
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

On Sat,  8 Jul 2023 21:41:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed md5 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/perl-html-parser/perl-html-parser.hash | 3 +--
>  package/perl-html-parser/perl-html-parser.mk   | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
