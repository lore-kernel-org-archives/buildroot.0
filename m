Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D033EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354FC6101A;
	Sat,  1 Jul 2023 14:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354FC6101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gg6IXeD9TOH1; Sat,  1 Jul 2023 14:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 742586103C;
	Sat,  1 Jul 2023 14:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742586103C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 665C01BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9A783BED
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9A783BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWyh8nkZZ5rr for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143A883C0B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 143A883C0B
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:41:32 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C98A7C0006;
 Sat,  1 Jul 2023 14:41:29 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:41:28 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230701164128.266112fc@windsurf>
In-Reply-To: <20230619181718.456022-1-ju.o@free.fr>
References: <20230619181718.456022-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688222490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80GwloFffTekGs7KEZntWFO/w8/bu5Sn0Sn148LmZCE=;
 b=I0On9b0zpk1ZWjaqYWNfQl+1I0tPNl4Hw3V/DyLJW+CsqDhhhbCFevq4RQhc995hEXCydD
 T2RzlXS1gOx39t2AX+tXpU2LSwVgjUHCcxG7GX3+8au6k23EF6VRDrz1RxHTDcbE+vE/R6
 9qXbv8IOLU7n1vQHX4plbKJl6eYocvZGFb4DMDAuEjdJQcaSwJK+wG8E2+0QiWvrI81xnS
 6s+XW64ZvWz8F/0pm+lhQjyWoivXqRnGJ0iwWeMpEygk00cLE1A81DvaGvuDeYRl04nygu
 VWlAzXuW6uksnHoRY+E2mgFjMLjwOlmZA9CvyX9xEbcag5Z0KiyGnACSJu0uxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I0On9b0z
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.3
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

On Mon, 19 Jun 2023 20:17:18 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.2, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit d4a96ee with commands:

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
