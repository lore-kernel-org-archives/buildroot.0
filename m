Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288CBC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1C9F403B7;
	Tue, 23 Aug 2022 19:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1C9F403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTMVJ0Tb0kzv; Tue, 23 Aug 2022 19:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D3894011C;
	Tue, 23 Aug 2022 19:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3894011C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 826101BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69CB18184F
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69CB18184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0R8pQa97HqZ for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:26:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3A7817E4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F3A7817E4
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:26:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E1D6240002;
 Tue, 23 Aug 2022 19:26:41 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:26:40 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220823212640.17ee94c6@windsurf>
In-Reply-To: <20220823164040.GH2167049@scaer>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661282803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWQC+FKRM8YaYrU4HU8dYb1t6VLhTOTJNEiVGvLQ504=;
 b=lPG+Rrxb/mxe8kg2iLK1wCXUNq6Ae1r2SNT0wmhe/xIE48UraOlYgAt057QAhtPwPDNXLs
 yP3HDx1dosrrl4Ui6lTFwh6G67adZmlaXHpr8RF1lRv3/6rFBTINRoG2iQFGAVAJ+WVagV
 7B71pXM/cqgp0Y32eArSPL8AMxld8GAIaP26H76WNtQpMRlEh3nRq/uV0Qd0y5zKCXf6+u
 f0oTtpqMU1Q7U+uYsLor+UNsvjAieFZJ2zSXoJ4KDHkSzId4NKVCoNpzT46dZhJEwUA7Vk
 B+JHlir/7/j97oiwZCXuq06hfgk/XWHvgzTQUOcYKk/SCIv5aqvOJ0prmmDRHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lPG+Rrxb
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: Thierry GUIBERT <thierry.guibert@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 23 Aug 2022 18:40:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > On the hub, the latest container published is 20211120.1925 which does not
> > seems to contain python-pytest, so my gitlab pipelines are out of order.
> > 
> > Have you moved to an other docker registry ?  
> 
> Yep. And since the images are not really meant for direct consumption,
> we not longer push them to the dockerhub.
> 
> There had been an attempt at providing generic images of various
> distributions, taht we wojuld have kinda advertised, but the effort
> has stalled...

I really think we should change the buildroot/base image to be a
"basic" image with really the minimal requirements for Buildroot, and
publish this image on DockerHub. Then, we should have a buildroot/ci
image that is in the Gitlab registry, and used by our Gitlab CI jobs.

Anyone willing to work on this? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
