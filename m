Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91799C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40765827DD;
	Sat, 22 Jul 2023 21:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40765827DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ah2bgez4H5qZ; Sat, 22 Jul 2023 21:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CAF483410;
	Sat, 22 Jul 2023 21:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CAF483410
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3441BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F07415E3
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F07415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulM0Bd6FU3XS for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:31:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 740C4415DB
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740C4415DB
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4EED40002;
 Sat, 22 Jul 2023 21:31:11 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:31:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722233110.0351d476@windsurf>
In-Reply-To: <20230718221120.1433795-1-bernd@kuhls.net>
References: <20230718221120.1433795-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxPvCJ0s3QhLqxXa/QeQ5yQoLJMhZY8A6R9Zeo0VT/I=;
 b=Ys4e0klL8r1K0qWeRBBP4/cCmjgq3VKSJIc70cncKnGGmMpHBmXe1G85tm1hQQCjLXHXXc
 K6q1Rvu/nlIV6/DEUNfKY8EAwLEi86OH7EJ/34eVYPj4g9IzIvmXb68OUDAq2bnjBWWb3l
 rRtwdiiXiZSY26cyQ0sHTZne6oAUXxlWg5ufbvOznqKSQIYHYihclRDlTdAV+bUXNMr86O
 csHGqJldP1diu1xVRi2MD4Gkt4exZGbawpzwvoyCUdUEWLSu3uf9RoyZvd6hMdU406cLsM
 jFt3hNElorDq4Lj5+5CQkocuAcv/4jrPOmg4w9YmgtZfvZpHhJcW6NRjHNhBMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ys4e0klL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kodi: fix filenames of kodi
 host utils
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

On Wed, 19 Jul 2023 00:11:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The variables WITH_JSONSCHEMABUILDER & WITH_TEXTUREPACKER are defined as
> directories:
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindJsonSchemaBuilder.cmake
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindTexturePacker.cmake
> 
> and during configure kodi searches these directories for usable binaries
> with the name scheme.
> 
> ${APP_NAME_LC}-JsonSchemaBuilder
> ${APP_NAME_LC}-TexturePacker
> 
> which translates to kodi-JsonSchemaBuilder and kodi-TexturePacker.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: also updated kodi-skin-confluence.mk

Is this just an improvement, or an actual fix for a build or runtime
issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
