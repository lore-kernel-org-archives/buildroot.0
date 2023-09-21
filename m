Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F356EE71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE7783AD9;
	Thu, 21 Sep 2023 12:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE7783AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEamSKuvhz_R; Thu, 21 Sep 2023 12:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0677D83AC6;
	Thu, 21 Sep 2023 12:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0677D83AC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E371BF239
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70345409BD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70345409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHELqTE_O_L5 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:59:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75DB54002B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DB54002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 858C0E000D;
 Thu, 21 Sep 2023 12:59:14 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:59:13 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230921145913.1a171e2d@windsurf>
In-Reply-To: <20230919123957.2614998-1-angelo@amarulasolutions.com>
References: <20230919123957.2614998-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695301154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezsCFigkgMLBYBny8VufhIvCRoK9ov7KfnOzt5pQcb4=;
 b=C+HT0IfvbbWxcZYmsVJp5x9m6c1XvKmdzF27BLTOSH8UkpvYliapojmid0M7RHULJ7SjQP
 WcfZ0NyC3y1lUpGkaYCGD81z9b/pj9AqXTxzndmQhEwhPPurpCgkz4YVN1B4iV8K8w1dOm
 2MIYNXp3AyvUy+IV2VtlbtmcZ69hjSv6UAlnewusjPr/zh+alR/z4QcJ7GM9I/rn0KqXSs
 NTzodkRWudNbwXQ8WXXX3JJneLsYFuHYUQJU8rSnB/G7N5W3cLhr+MUUe2+kEX2UnFu7bh
 f/5y0B7LVtjGSHZy8qWcF4OXKKZjS9iA3U8vFKQP3ApOBIY+VbIOyXjI2u7R4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C+HT0Ifv
Subject: Re: [Buildroot] [PATCH] package/python-minimalmodbus: bump to
 version 2.1.1
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

On Tue, 19 Sep 2023 14:39:57 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-minimalmodbus/python-minimalmodbus.hash | 2 +-
>  package/python-minimalmodbus/python-minimalmodbus.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
