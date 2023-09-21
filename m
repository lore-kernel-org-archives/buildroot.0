Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77695E71069
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3383B83C35;
	Thu, 21 Sep 2023 13:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3383B83C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLimI5NWq4Zc; Thu, 21 Sep 2023 13:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA0583C38;
	Thu, 21 Sep 2023 13:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA0583C38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92E2F1BF3A7
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7921483B67
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7921483B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inLnQHzgeZpE for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 13:04:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE08383B46
 for <buildroot@busybox.net>; Thu, 21 Sep 2023 13:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE08383B46
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95993C0009;
 Thu, 21 Sep 2023 13:04:16 +0000 (UTC)
Date: Thu, 21 Sep 2023 15:04:15 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230921150415.7d7f02a5@windsurf>
In-Reply-To: <20230918112238.2758145-1-francois.perrad@gadz.org>
References: <20230918112238.2758145-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695301457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm7aALilPf5NSVM0q+9c16KsNri5jEi5rypiW9CbogU=;
 b=Oq97u3PWaFjjveVnDiOY6yzbdYbHWgb6NeOUHsUXia91RCnt+IDetr3ZAv7KPAUCKR2UVf
 zF7gxdlGNqQKHHJCQN518h10uAsn58EJw1wy4NfMAUNdSt+WjFCJBpLYJlCnqRoWLN+eXZ
 I+dkmz6YkK0Ti6I5g20idAQjt8mV/yJ1fQAwILspRMxVSHjiyq7fCvc28JjR94GIZAuXlJ
 smV0h7FNKiELAZF3LvutVnYOnrndNnzUohhxZc2LCGnh3PPuX4KDyO2gcnzKR8co42OOMI
 rSHqUunMWlxRxPGwiPvJAELz/BTPweH1vVJBSRkpfFdnVWaud2/oK3pc+j/wAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oq97u3PW
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 13:22:38 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/open62541/open62541.hash | 2 +-
>  package/open62541/open62541.mk   | 2 +-
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
