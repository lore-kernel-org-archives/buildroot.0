Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F97C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A0840147;
	Wed, 29 Dec 2021 09:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prrOB8H-S7QQ; Wed, 29 Dec 2021 09:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 985F8400C7;
	Wed, 29 Dec 2021 09:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A448C1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1AED81313
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F50iZFOYs9RQ for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:12:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A35581310
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:12:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AC3F1240006;
 Wed, 29 Dec 2021 09:12:24 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:12:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20211229101223.50fe1f67@windsurf>
In-Reply-To: <20210928195533.1736944-2-mmayer@broadcom.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <20210928195533.1736944-2-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: set HOST*_NOCCACHE variables
 only if unset
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
Cc: Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Markus,

On Tue, 28 Sep 2021 12:55:33 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not set. This
> allows recursive calls to "make" to work as intended in the presence of
> ccache.
> 
> Without guarding these variables, a recursive invocation of make would
> re-define
>     HOSTCC_NOCCACHE := $(HOSTCC)
> and
>     HOSTCXX_NOCCACHE := $(HOSTCXX)
> at a point in time when HOSTCC and HOSTCXX already point to ccache.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)

I have extended the commit log somewhat to give more details, and
applied!

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
