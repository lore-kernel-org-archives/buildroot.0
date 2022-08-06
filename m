Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F57C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8F041553;
	Sat,  6 Aug 2022 21:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8F041553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6JhKhf2C_kj; Sat,  6 Aug 2022 21:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4401F41732;
	Sat,  6 Aug 2022 21:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4401F41732
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F92D1BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 070514015D
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 070514015D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBk96LD52InI for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:56:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F27E40117
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F27E40117
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:56:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D00520003;
 Sat,  6 Aug 2022 21:55:59 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:55:57 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220806235557.5d498b6d@windsurf>
In-Reply-To: <20220805200114.288208-2-sen@phobosdpl.com>
References: <20220805200114.288208-1-sen@phobosdpl.com>
 <20220805200114.288208-2-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659822959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAdkfs3Rk6QDa4Humb5q8OGugUTl4vkNcqg/uOE+M+Y=;
 b=GDyKFpcgmw5LLhfQH/nnoEWABYfQxBVptwl4drjDWCamcw/v3A9LUUFvjr+/IkfBFqSivp
 6bMNje3VLlp/M3c+vxbxkpWbohbEvHXM+pferv2ibW5X5zu5+jMJsbmn7TFkVXr9w7XR7o
 v/MM6W9iAYnkbRR14ijtbM7Q7ZoDn52KVNLNQb5fTFTSQActCjpsw5hJapNp/iGaRe4i5y
 QlkELFEbxX3lJL201R4pyDutV8OL6rcqaNbA/yxeQeDhirv26bFpm28o8HH3q3ReIxlMhy
 /lMhslupdwMypN8pLIm/RhICRw27LFpUcLI3u1+q+lt7EGAgls4xaRXk6Yteag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GDyKFpcg
Subject: Re: [Buildroot] [PATCH v1 2/2] support/scripts/pkg-stats: optimize
 CSS selector usage
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

Hello Sen,

On Fri,  5 Aug 2022 15:01:14 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> Having lots of CSS selector declarations adds up, especially at 70k+
> elements.
> 
> This reduces the number of CSS selectors printed in the markup
> to the bare minimum, by using pseudo-classes and tag names as selectors.

Not sure how this works. Is there a significant size benefit? Sometimes
having a dumb but obvious solution is better than having a smart but
convoluted solution.

> +div {
> +  text-align: center;
> +  border: solid 1px gray;
> +}
> +#results-grid div{
> +  text-align: left;
> +}
> +#package-grid div:nth-child(13n+1), #package-grid div:nth-child(13n+13)  {
> +  text-align: left;
> +}
> +#package-grid div:nth-child(13){
> +  text-align: center;

What is this 13 magic number?

Also, unrelated to this, when I look at the currently generated HTML,
it looks odd. I see things like this:

  <div id="upstream_url__package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream" class="centered upstream_url data _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

Why do we have these crazy id values now? why does the class property
contain a value such as
_package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
