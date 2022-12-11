Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE22C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B604052B;
	Sun, 11 Dec 2022 13:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B604052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PY8LzjxBpURz; Sun, 11 Dec 2022 13:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C9C440520;
	Sun, 11 Dec 2022 13:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C9C440520
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4381BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A150606DC
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A150606DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4h2TU41jJgJC for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008B16059B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 008B16059B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7DE9E240004;
 Sun, 11 Dec 2022 13:34:31 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:34:30 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211143430.27e692e4@windsurf>
In-Reply-To: <20221208212429.4112736-1-christian@paral.in>
References: <20221208212429.4112736-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkM3SuQC7GumJDENa0jG3lSvBrjoMrzHZzjjC0qh/zk=;
 b=iFGhSWKNW6nfbjnzOZkm2BL2ePKPmzQ5i3l5YcpBvH1T2UrzQmV6hijjQZtn1GDqs6E83L
 KnB9ZytVY0jqRNEcHnOacrywFrnbDzJZg2mf8OyvsQ9Cf3waAXv2kkQ9n/Vmoi4WeJzi9t
 GlKPHYBMu/VJhn/YSP4MWfGtgbKcX5YujafNISoyeEmjrGF7pKL2JHwu7df80aeIyoqjIn
 XnQwW/wOZBINy3VQHah5+iQKYa+Wt3+G+qJQvqAF7o4XTlTYdwwwu7LKmw551ywAP066Lc
 ImyZMUvCMxIUYrO6Ps00Kni8yQ3Wvka7qzAhlz0V1+ODZxUcIHX/zSlpQgIKaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iFGhSWKN
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version
 2022.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 13:24:29 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Bug fixes and code cleanups.
> 
> https://www.open-mesh.org/news/110
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/batman-adv/batman-adv.hash | 2 +-
>  package/batman-adv/batman-adv.mk   | 2 +-
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
