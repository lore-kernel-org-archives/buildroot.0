Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5197FC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A418206E;
	Sat, 29 Jul 2023 22:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A418206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojY4sSjkuwS1; Sat, 29 Jul 2023 22:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D65482053;
	Sat, 29 Jul 2023 22:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D65482053
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF9DD1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC6D4154E
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC6D4154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBlgGhnpBrQH for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:22:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F22234154D
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22234154D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BB98FF802;
 Sat, 29 Jul 2023 22:22:11 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:22:11 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230730002211.7a9b83a4@windsurf>
In-Reply-To: <20230326213020.758457-1-fontaine.fabrice@gmail.com>
References: <20230326213020.758457-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690669337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzmDRLgAhmaNFq/A/2RsXXLHbYDIMbed/GuwlCgGIQ0=;
 b=gkUe6vAcnzBptat6MXS9hZ9z0+n7MuARj4levE0r93BwNiG5lJkmXkV3bcY8EFkKiM6wdI
 ohPrQfB0b7Gm8KOwiYqZNM5nZOco65kUvzPzKjn/Q+L8XfdALUQ3ToUH2/mCzvFgIx/Ich
 ZI9arjhqbFjvl9UatXCWI71Hkpi8Ks/TKVE3MqiJ77/soGhE58tFzGGrvNmTbaqiRfqsBQ
 +p+eEgZmLcVEbnrbbtb/7hNZxck7affL5CyI7HiWnZP7/uQv0/+dZYR3X5D6GKYzfBz6Am
 Wu7VTMGJ7L+SNboe3Xo9pSjFm9oz+D2voqIyinNX7dHqRL4PM/7lEKJ//wuZ2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gkUe6vAc
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libmemcached: bump to version 1.1.4
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 26 Mar 2023 23:30:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to an active fork
> - Switch to cmake-package
> - Drop all patches (not needed anymore)
> - Use LICENSE file instead of COPYING as COPYING is now a symlink to
>   LICENSE
> - Handle libevent and openssl dependencies
> 
> https://awesomized.github.io/libmemcached/ChangeLog-1.1.html#v-1-1-4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Drop unneeded LIBMEMCACHED_CPE_ID_PRODUCT

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
