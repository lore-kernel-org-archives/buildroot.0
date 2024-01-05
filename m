Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5545DC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F21584375B;
	Fri,  5 Jan 2024 13:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F21584375B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUlamzd6nOO2; Fri,  5 Jan 2024 13:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E744374E;
	Fri,  5 Jan 2024 13:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E744374E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 685691BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42261614FD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42261614FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJ0JbNqaeG-C for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:02:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 447AC61499
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 447AC61499
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B0B360006;
 Fri,  5 Jan 2024 13:02:01 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:02:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105140201.5f417117@windsurf>
In-Reply-To: <20231227140651.1303381-1-fontaine.fabrice@gmail.com>
References: <20231227140651.1303381-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pgG6tU8mCUl0X7mtMIWJ5LNn13fgvgPnbezJgt++08=;
 b=YL1D4p7o6+lqoWCrygfZoSc8hTOiEFVNWXaYq9/OuWVPl0DVWks85XtBACP5XNLcZdXgBh
 98MD7EpvByMN+0TL6Er3IGPZuEMvqztmWqgGEiGKFLZRBi5Hh39CGx8MbymTDkx6dW59R+
 djQXaSz9gqde4Kek3Jevae/638L5iQBOJ23sPoZCCSfNf5E9R+ZKd7YaLrhGVN2BD2n2PE
 yUYsGRG+2f8XxV3LOYGzMRS6VaMR6KpYer2VulbfvpHec+7T2NBWba1CpBSE9z5xaG6kRn
 l6iznoztuH3oO1tQ6dFm8rvtEogFq75WPzjQ+drJANAGLLXciCOM7rz+Venbaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YL1D4p7o
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd-mpc: bump to version 0.35
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
Cc: Thierry Bultel <tbultel@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Dec 2023 15:06:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/MusicPlayerDaemon/mpc/blob/v0.35/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpd-mpc/mpd-mpc.hash | 2 +-
>  package/mpd-mpc/mpd-mpc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
