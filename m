Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB33C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 11:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8842A80D24;
	Tue, 23 Nov 2021 11:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Gg-wc3XWypb; Tue, 23 Nov 2021 11:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F085E80D14;
	Tue, 23 Nov 2021 11:24:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3B4C1BF35D
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 11:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABCC380D14
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 11:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIHPD-meEXPy for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 11:24:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B1C380D06
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 11:24:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6565EFF80D;
 Tue, 23 Nov 2021 11:24:46 +0000 (UTC)
Date: Tue, 23 Nov 2021 12:24:45 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211123122445.24d3d05a@windsurf>
In-Reply-To: <ffad9a85-953f-0663-261b-57ffc46224ca@mind.be>
References: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
 <20211119175553.2413433-2-fontaine.fabrice@gmail.com>
 <20211121204348.5c21a803@windsurf>
 <ffad9a85-953f-0663-261b-57ffc46224ca@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/boost: threads needs date-time
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Nov 2021 21:53:18 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   So what we could do instead is to bump CMake to 3.22, and set our mininum 
> CMake version to 3.21.3. This is going to hurt the build time for some people, 
> but I guess it's better than forcing boost date-time?
> 
>   On the other hand, boost date-time probably has a very small additional size 
> cost compared to the rest of boost, so this patch is probably a better ad hoc 
> solution. I'd just add a comment in the Config.in file to explain that this is 
> just a workaround, with a longer explanation in the commit message.

Fair enough, that works for me. We need to remember to drop that
workaround at some point in the future, when we require at least CMake
3.21.3.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
