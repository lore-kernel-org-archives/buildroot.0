Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E92C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6A140583;
	Thu, 24 Aug 2023 21:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6A140583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Px4tXWXNKIpx; Thu, 24 Aug 2023 21:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472C9403C7;
	Thu, 24 Aug 2023 21:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472C9403C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A69F1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5654415ED
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5654415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IH_HzZJQK3sl for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:19:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7B63405ED
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B63405ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDE72C0004;
 Thu, 24 Aug 2023 21:19:42 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:19:41 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230824231941.6b365ab1@windsurf>
In-Reply-To: <20230809171501.1329182-3-zgyarmati@zgyarmati.de>
References: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
 <20230809171501.1329182-3-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692911983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axDO5BdfpYh9oTi6aU7F4bxf5/2bWt/wxPErQa31PuQ=;
 b=lo79VzDLumG0xc0x0CJeAgGNwICwUyUvRwY/1db0cWaZ6Ci0Q49gS7Fqd9pHpfFbDej3P1
 KrQ3YKTXBChfh6qJzCIb3cCpTTScPBRlQhTviEMmo1C+tWlSB5WeC+9P7U5HF3XJbJkgLc
 EF/NuT0Cq2k0JLkq5tbKj9k/neehIbgbOtUOkVAtZaRnKOP2l0E4lzMOZueDXTM/MprNMx
 fhnfuJORhYIJYgYWpfR+y8teiYwCQQ7/VUixhwAVaSq2Sahcjlio1iyoUtRVkkMEAc+jNK
 TIu4SMh0llXHN/eXZTmxfZvHF2kMthmPo5gGKMoPZG8/qr8gDcEaTIrZZOWB5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lo79VzDL
Subject: Re: [Buildroot] [PATCH v1 2/2] package/quazip: also enable for qt6
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

On Wed,  9 Aug 2023 19:15:01 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

>  	source "package/simple-mail/Config.in"
>  endif
>  	source "package/qt6/Config.in"
> +if BR2_PACKAGE_QT6
> +comment "QT6 libraries and helper libraries"
> +	source "package/quazip/Config.in"
> +endif

I didn't really like this double inclusion of package/quazip/Config.in,
so instead, I committed the following preparation change:

  https://gitlab.com/buildroot.org/buildroot/-/commit/46f1cd6fe3b6a0f066e6217dec19ea8eb96d3923

And then applied your commit to the next branch, without your
package/Config.in change, which was no longer needed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
