Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5346DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 08:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D502D80AAC;
	Tue, 22 Feb 2022 08:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dHqLPQeSGIM; Tue, 22 Feb 2022 08:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6F2813DF;
	Tue, 22 Feb 2022 08:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4656B1BF28D
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 08:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 335014019F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 08:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id He8wWkGuVnJ1 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 08:33:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0F640140
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 08:33:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 990F020000D;
 Tue, 22 Feb 2022 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645518802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuG8hciQHsz8ojjyqcop85AHXIW84xJQ8uwWnGoJToM=;
 b=ELUo8nIsAS36tTHKMSECylM+S/d+2WF/CZrlB+Wb+p6ALv7pJwsqkribPGFJt5RBsTizGu
 xc3pmw+9Vfv0fV+BhEpNfCPXmAd4H4D+7EYzxv2O5T9z7OmWcA0/NJ9uckpRKbo9OEG49r
 rb2eYBiRG836/7iQbI6koT8/t8rF+qP8KbrQpicZfpehpWBqX5CGYnPxNS+wCBPhxC7piQ
 sbLPQDH1CJD6yS1PO/ai0xRQiK+jQTXpFX5Mq+LvOzUYxSJIU7F9CjqRNV+MeA1aw9li3u
 e7TJBwBQL99k1ajsgJfYMDe9WjZapbNFl00tNxrVdOKZjrzaev89piqapjOPvA==
Date: Tue, 22 Feb 2022 09:32:46 +0100
To: Christian Stewart <christian@paral.in>
Message-ID: <20220222093246.57ab1b0d@windsurf>
In-Reply-To: <CA+h8R2pwkhPn5SS-jPmXjS_gb07EsshRA5HMJewVRcY32RL6=g@mail.gmail.com>
References: <CA+h8R2pwkhPn5SS-jPmXjS_gb07EsshRA5HMJewVRcY32RL6=g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/expat: please backport to 2021.11.x
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 21 Feb 2022 21:21:16 -0800
Christian Stewart <christian@paral.in> wrote:

> Expat v2.4.4 (vulnerable) download has been removed from sourceforge.
> 
> So 2021.11.x build is broken with the older expat.

This is strange: if the expat tarball is no longer available from
sourceforge, Buildroot should fallback to sources.buildroot.net, which
contains the expat-2.4.4.tar.xz tarball, at
http://sources.buildroot.net/expat/.

Of course, it is better to update since there is a security issue in
2.4.4, but I'm wondering why you're saying that the build is broken: it
should not.

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
