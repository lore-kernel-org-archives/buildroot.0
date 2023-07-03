Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30D3C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D5260ECA;
	Mon,  3 Jul 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D5260ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GogWotmkXISF; Mon,  3 Jul 2023 20:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14BB60E34;
	Mon,  3 Jul 2023 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C14BB60E34
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C326A1BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F5BF40198
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5BF40198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-TKRiaM5NRt for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:42:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE1CE400D1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE1CE400D1
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:42:53 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E263B240005;
 Mon,  3 Jul 2023 20:41:50 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:41:49 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230703224149.51f6ac85@windsurf>
In-Reply-To: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688416972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FGfszUbyVSd2LzJz0d+Waml8PRUuRXG635o9Rj0aJw=;
 b=RQpFXD3VVKn0vvlrl3W4RQip+iSx6xzfqjbtjUdR17G3/t0yMrSysf8u7d5QsgJJWPKKYQ
 jn8zU1KLgFqW0lh2Ubp6bQF2lRVcThT97xM5BDpvqTwuPEKMZJa0nXwKwiTeiesD7a4uNV
 EoEeD78Xk5oPL5zRWNfdPzQWWVLxsdRhovYruBOjGXEKZl902aT4XB+dcZbQd333O5vbJS
 6wSC3X3a9wABmnwOTg8A1NrXBcxXv9dMjdd8qqBadMXzkZ2HW+bETBYjix/1rnE4W8+3rq
 kd9zd6CxDb01a7+N6qZvStabiPDcKGzKNzQYbJlDnmboZxPwRpUY/3NVrQuocQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RQpFXD3V
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian, Hello Romain,

On Thu,  8 Jun 2023 10:50:15 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> +#When updating to a version >0.63.0, pay attention to the command line
> +#arguments --blacklist* and --whitelist* which are deprecated from 0.63.0
> +#onwards but are still used when compiling the Linux Kernel as of the time
> +#of this comment
> +RUST_BINDGEN_VERSION = 0.65.1

The comment above this version variable is confusing: it says to be
careful when updating to a version >0.63.0, but the patch already
includes a version greater than 0.63.0. So?

Also: space after # sign in comments.

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
