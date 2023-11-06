Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5604AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115C44023C;
	Mon,  6 Nov 2023 22:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115C44023C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lI1IbdtH5qFC; Mon,  6 Nov 2023 22:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE77E408E5;
	Mon,  6 Nov 2023 22:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE77E408E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3FC1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E20DB4215E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E20DB4215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hUfs6HygtRf for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 575E5417D6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575E5417D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9931160006;
 Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:41 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232441.47a128ef@windsurf>
In-Reply-To: <20231105045800.2824317-1-james.hilliard1@gmail.com>
References: <20231105045800.2824317-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIb+9s/bbwEBDtSy1hZRC0a4o/6GaIFK+DIvmQjZCQs=;
 b=AviJ6TQMAUNFFqwj0XEun0N5A04PH5JrM6sv7iNeK5EodsD+gBpH0H6YAorBwvuxjlcfkd
 7UKccUTK+E2MdWMo27aWHYGdgt5Vf+fbvTrN8lDWqqlct10ao/OTir6I6Qgk4HSlQy2iH4
 ibGEUIT9q4p/EiksA8H+xYQNCdQ8Yuc+gXSwdp8CX2ONz3U3mUQKL6A+FJ1Jn22VbnPoa1
 NIcvm3IGW9UREerqSgnqjkdHZd9s0SmG/9AIG+YGs7Zkkd1etoy8ZM9F70/zVgLEdubbnk
 REcoxLC4hsekpAUIp8LY1XiD0FSHNz5FCI/S8ujRfx4FjzBFOTzovfrMlNJVlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AviJ6TQM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docutils: bump to
 version 0.20.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:58:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to include header being added:
> https://sourceforge.net/p/docutils/code/9280/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-docutils/python-docutils.hash | 6 +++---
>  package/python-docutils/python-docutils.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
