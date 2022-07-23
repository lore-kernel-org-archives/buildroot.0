Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C40C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D595C4246D;
	Sat, 23 Jul 2022 19:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D595C4246D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmSR9-1yFvwx; Sat, 23 Jul 2022 19:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B5F4245D;
	Sat, 23 Jul 2022 19:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B5F4245D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9C11BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6424A42465
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6424A42465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCwj-Omb2T2M for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:21:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F504245B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01F504245B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:21:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5501240002;
 Sat, 23 Jul 2022 19:21:14 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:21:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220723212113.0c268c28@windsurf>
In-Reply-To: <20220615231730.2900335-2-james.hilliard1@gmail.com>
References: <20220615231730.2900335-1-james.hilliard1@gmail.com>
 <20220615231730.2900335-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658604074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLhISsq9gR1zz0ouzSFi4iEJ8dUhhAX95z/EYWPiBUE=;
 b=Nmi/WK3337cJfmc4wvbmAm7C6Q1Lw1rI9YwWxLbuTyN10HX7enp4NOe12Wq2p51W+iUixs
 A+bQCp5+MZi4QTotoLEC2qsk5vLj6uakUXiBdGoSbAnGwDo6AO4XbFrWyraW742B5Kubmt
 9kvrU4Uud4RFZ2KejpnY5RUqvSOkjzWXSniph3C0QGQTUk5ZgolRQQglgabMylsWJOQN0R
 8SarliD1LvyubBrTxTbTnjgJ9HNwH4dvyabV/Lflz1hgp7j1atQujeaspx7xKOa5yD4bRm
 Z2FulgDUBKhi8+3tjnVOmNKy4W4lMtSaWEWtuKFnrnml2nHp4VaUSw6Z1Z7i2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nmi/WK33
Subject: Re: [Buildroot] [PATCH 2/2] package/python-jsonschema: bump to
 version 4.5.1
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

On Wed, 15 Jun 2022 17:17:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-pyrsistent runtime dependency.
> 
> Drop unused host-python-vcversioner build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-jsonschema/Config.in              | 1 +
>  package/python-jsonschema/python-jsonschema.hash | 8 ++++----
>  package/python-jsonschema/python-jsonschema.mk   | 5 ++---
>  3 files changed, 7 insertions(+), 7 deletions(-)

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
