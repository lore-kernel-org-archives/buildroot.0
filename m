Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D687C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEB1402C5;
	Mon, 14 Nov 2022 22:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEB1402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRi1bpuO3nYy; Mon, 14 Nov 2022 22:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9694E4089E;
	Mon, 14 Nov 2022 22:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9694E4089E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0AB1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B1880BC6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B1880BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdsR5FrOxjNq for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:43:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC98880BAD
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC98880BAD
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:43:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E23A9100003;
 Mon, 14 Nov 2022 22:43:40 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:43:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221114234340.4bfa2f55@windsurf>
In-Reply-To: <20221107022458.3448020-1-james.hilliard1@gmail.com>
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668465821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HchAApN/J5OptJpbZg3zdWhcIpLTwtHVLgtFUTtEjfY=;
 b=dfHlK2z9KlD0E9Cqp2S1ECmHXYEkSY7xxYCyNiGJLP0BQn8vca8jMjatkozbNufxRCkbI2
 zWGO0fObFq042JzmNdTm1DYmh4ng3B0tymtK7W9YzHUYvb+tN18LHkb7TKjj3aD0v/8juE
 DZvmK3JqL3fDCFwzArNWa+YRUF1Fs6ETPdOX40dHPp2WLQMcxEQjmmQ6PK/kDPIhqe6l3V
 kUWSHsqaHS00uLPfCKNV4RfZMa9RPUJZ1DqapUSZ9yAVSTw/3t0Ql2VyJVIcm1Te7EMVXd
 RXSafvXm+tng9x8TtUwAzCS/iS3MNJecB6KRN6l2/QLbGlfs0LRDmZb7iqi1yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dfHlK2z9
Subject: Re: [Buildroot] [PATCH 1/3] package/stb: new package
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

On Sun,  6 Nov 2022 19:24:56 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is a header only library which is required by the latest version
> of zxing-cpp.
> 
> Include paths and pc file are based off of debian libstb package.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/stb/Config.in |  6 ++++++
>  package/stb/stb.hash  |  3 +++
>  package/stb/stb.mk    | 21 +++++++++++++++++++++
>  package/stb/stb.pc    |  8 ++++++++
>  6 files changed, 40 insertions(+)
>  create mode 100644 package/stb/Config.in
>  create mode 100644 package/stb/stb.hash
>  create mode 100644 package/stb/stb.mk
>  create mode 100644 package/stb/stb.pc

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
