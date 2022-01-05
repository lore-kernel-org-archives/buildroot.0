Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B813FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 13:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D77409DE;
	Wed,  5 Jan 2022 13:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xI03WV1MSVf; Wed,  5 Jan 2022 13:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855CE4099F;
	Wed,  5 Jan 2022 13:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B20021BF2C2
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A16784099F
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQsdomO-_gyY for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 13:29:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55DD840994
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 13:29:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 01EC660006;
 Wed,  5 Jan 2022 13:29:24 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:29:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20220105142924.4b11ed83@windsurf>
In-Reply-To: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thierry,

On Wed, 5 Jan 2022 10:46:46 +0100
Thierry Bultel <thierry.bultel@linatsea.fr> wrote:

> For a number of companies, I can see a growing interest in having ros2 
> support in buildroot.
> Currently, people wanting to prototype (or make a product) a robotics 
> applications, are stuck
> to either yocto, or, worse, to a desktop-like distribution.
> 
> Another topic is charts displaying for sailing. The most famous 
> application (mostly used
> on raspberry by sailors) is OpenCpn, which is great but relies on wxWidgets.
> 
> Whereas I am looking for a sponsor for adding ros2 to buildroot, 
> (because it is a quite significant work,
> that implies to add a new build framework), I am thinking about using my 
> (little) free time for wxWidgets (and OpenCpn later).
> There has been an attempt is the past 
> (https://bugs.busybox.net/show_bug.cgi?id=261) but it does not
> seem to have lead to anything else since that time.
> 
> What are your thought about these both packages ? Any ideas, or links to 
> some WIP stuff ?

These packages would certainly be very welcome. ROS2 especially makes a
lot of sense.

Some prior work:

  https://github.com/mchalain/br_ros
  http://lists.busybox.net/pipermail/buildroot/2019-March/246497.html

I'll be happy to help in the review of such packages.

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
