Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BFDEEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C3440432;
	Thu, 14 Sep 2023 21:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C3440432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpbyfXczkaJi; Thu, 14 Sep 2023 21:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA1A841905;
	Thu, 14 Sep 2023 21:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA1A841905
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43D3B1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14EB9822DB
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EB9822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4mQPy3Oiy6z for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:29:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E011D822A0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E011D822A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7381A60008;
 Thu, 14 Sep 2023 21:29:02 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:29:01 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230914232901.4ba08598@windsurf>
In-Reply-To: <20230911195640.1487444-1-giulio.benetti@benettiengineering.com>
References: <20230911195640.1487444-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694726943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/b1cDSBZBTn4wDGSYcIKheFCs6vbTXoWK5HGLjPk9s=;
 b=ZfBDjzQnk92irNX+LZPK53s9Ek+7ChNwVJ/ZDyMkURakpWPhz3KqywdgMsLZ3AKMjAWASC
 3ReizQNi4tf5dt4UHmn4DOEQg6oj5CPRsWgIdHAIqRoLrLHsP9TPPDpcH0eSwgXkJFj4Vo
 pjo9BjoZTp6oabAvpnmaN3oJClPxABJgg9UWnvsUubimNGc3IZ/j0ayfmxREL9RCNZyDBo
 CPRfkpggoRwQm7mcOefI7lsaC8KNxcDg9xsvTnf3DGqevY4giiSqVy+rtWwmO2dHPQqp49
 RkPbEo1IDIx419hVuDpvpEOm+Pp++yb6s6xI9Y41Oy+Yw+Jfnpf3ItvAbz7+tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZfBDjzQn
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2023-07-23
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

On Mon, 11 Sep 2023 21:56:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version fix build failure on Linux version < 5.15.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
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
