Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108B9C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8E040248;
	Sun, 12 Mar 2023 21:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8E040248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_pQHZdmqFFL; Sun, 12 Mar 2023 21:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C40415D9;
	Sun, 12 Mar 2023 21:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C40415D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6706B1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C3681450
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C3681450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1VdJSlaQYur for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:33:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F8B80D1D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1F8B80D1D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:33:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C92EE40002;
 Sun, 12 Mar 2023 21:33:05 +0000 (UTC)
Date: Sun, 12 Mar 2023 22:33:04 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230312223304.03f88adc@windsurf>
In-Reply-To: <aa37db434d12b8c216cdcaff5c24a5fe624ecdff.1677568759.git.stefan@agner.ch>
References: <aa37db434d12b8c216cdcaff5c24a5fe624ecdff.1677568759.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678656786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BY1LlhdZ7kP7ls7yv8CK0OmrV6T7Ad4yeN2m+O6py8=;
 b=lOGrEztOwf/Ei2EAr+614HvtW7Ys/1pn5Nnh7MowH6iSHPzPdcPo0HrGEt7xUJv7amxPhn
 EAwKm2kWYxXg7iKEkMGfB0sCizWC7j/pIyAF/g8C8SjNFA5CW4ivxqlk+nr7k6Us6A5qFS
 bhLNM0P7m7jRpOGPIctEFInszqZOZJmLByJsA3OusmW291T/11uuCFb/yZKvTC+OIWHhez
 ZP0n61nHiFTbNJCvdq4iYwyBA8QnP8lTi0r9slA1in7XV1uZ7AAjhzHh/twGhgnX4mQJWE
 FxtvhH3vqUdP75J6LthA688rcnGsZSUDCAnfbDySiC0qWI3/LBl2Fj19xURHMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lOGrEztO
Subject: Re: [Buildroot] [PATCH v3] package/dbus-broker: bump to release 33
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
Cc: Norbert Lange <nolange79@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Feb 2023 08:20:36 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This release contains mostly a bugfixes, with some improvements around
> error handling for unimplemented functionality and resiliency against
> runtime changes of dbus service-files.
> 
> Also update hashes of license files. There was no change in license,
> the hashes changed due to copyright date bump and additional authors
> listend in the same files.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Changes in v2:
> - Update license hashes

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
