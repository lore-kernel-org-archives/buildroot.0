Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3558AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 23:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FB740591;
	Sun, 26 Dec 2021 23:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdC2e0HDkOSr; Sun, 26 Dec 2021 23:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F18D404B6;
	Sun, 26 Dec 2021 23:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0A51BF324
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE2B81454
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VPyEMoAu6tt for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 23:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE567813DC
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 23:14:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4492D240005;
 Sun, 26 Dec 2021 23:14:37 +0000 (UTC)
Date: Mon, 27 Dec 2021 00:14:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Horatiu Vultur via buildroot <buildroot@buildroot.org>
Message-ID: <20211227001436.25792a60@windsurf>
In-Reply-To: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
References: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cfm: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Dec 2021 14:07:45 +0100
Horatiu Vultur via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  DEVELOPERS              |  1 +
>  package/Config.in       |  1 +
>  package/cfm/Config.in   | 17 +++++++++++++
>  package/cfm/S65cfm      | 55 +++++++++++++++++++++++++++++++++++++++++
>  package/cfm/cfm.hash    |  3 +++
>  package/cfm/cfm.mk      | 23 +++++++++++++++++
>  package/cfm/cfm.service | 10 ++++++++
>  7 files changed, 110 insertions(+)
>  create mode 100644 package/cfm/Config.in
>  create mode 100644 package/cfm/S65cfm
>  create mode 100644 package/cfm/cfm.hash
>  create mode 100644 package/cfm/cfm.mk
>  create mode 100644 package/cfm/cfm.service

Applied to master, thanks! The only minor issue (that I have found!)
was the ordering of entries in the DEVELOPERS file: they were not
sorted alphabetically. That's admittedly very minor :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
