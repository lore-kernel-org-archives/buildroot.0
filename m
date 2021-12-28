Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454AC81773;
	Tue, 28 Dec 2021 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMONETMAlCVC; Tue, 28 Dec 2021 21:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07F9814B8;
	Tue, 28 Dec 2021 21:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69B511BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5796960B5B
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvpfEmkhbzsx for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B94660B1D
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:18:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2B44020003;
 Tue, 28 Dec 2021 21:18:05 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:18:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20211228221804.6b965558@windsurf>
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

On Tue, 28 Sep 2021 12:55:33 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not set. This
> allows recursive calls to "make" to work as intended in the presence of
> ccache.
> 
> Without guarding these variables, a recursive invocation of make would
> re-define

What is the use-case for a recursive invocation of make, reparsing the
Buildroot Makefile?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
