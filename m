Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F5EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C139409CB;
	Mon, 21 Aug 2023 13:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C139409CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVo0KzSMeDG7; Mon, 21 Aug 2023 13:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4381D40993;
	Mon, 21 Aug 2023 13:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4381D40993
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A91D1BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F248F813AC
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F248F813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQCl8Id_CNY3 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:24:58 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 698308139C
 for <buildroot@uclibc.org>; Mon, 21 Aug 2023 13:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 698308139C
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1F051D0350
 for <buildroot@uclibc.org>; Mon, 21 Aug 2023 13:14:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F433E000B;
 Mon, 21 Aug 2023 13:13:59 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:13:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821151358.74e9b4b0@windsurf>
In-Reply-To: <pan$c62b1$e5429c51$8973424f$9abaebbb@ID-313208.user.individual.net>
References: <20230818151608.988723-1-bernd@kuhls.net>
 <20230818220314.3178c964__25218.2109326654$1692389025$gmane$org@windsurf>
 <pan$c62b1$e5429c51$8973424f$9abaebbb@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692623640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrcOfchRSiDTQQbZR9iLhKh4TIGsZEW+hag1L03pSkg=;
 b=Ch8LTjiwUUyb3bs6I0roqRgzK9KOLi5XzXcz3CwPn/bP8xil2c2U1CPnhJNNVBO0HivPte
 fuvncO1P+aA/nx9+UXn1QRhdRDbmL8xlhs9hw0vl/VMVmL3uczjvueAjMHSBD5q7R1zwrW
 tKT7zT55o4jMsWnDhTVxA9UYXJb1Z5gq0hfUIZyrOUX2Gg3qfbvk7a2EpY/JiZl76uvx8M
 /snETFgBJl5/LEzArYsb/nb2l+FUZio7sYCDZYBJVv4r7xyC2g/Ve9j5p/vZcOif9arfLK
 OsZ+vnD2uHo7zpkDc/3gkHfJ+4LBHa5Xg7/7TsUYYArAstBJC8B9RxjIeunEkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ch8LTjiw
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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
Cc: buildroot@uclibc.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Aug 2023 22:47:15 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Digging further into what first appeared to me as a typo I found your 
> commit adding the double colon to package/Makefile.package.in:
> https://git.buildroot.net/buildroot/commit/package?
> id=e11fe847b2f545446fc3300dd2ba88fd5da05756
> 
> At that time there was another file, package/Makefile.autotools.in, which 
> also included a "$(BUILD_DIR)/%/.stamp_built:" single-colon target:
> https://git.buildroot.net/buildroot/tree/package/Makefile.autotools.in?
> id=e11fe847b2f545446fc3300dd2ba88fd5da05756#n264
> 
> Today only one file, package/pkg-generic.mk, contains a .stamp_built 
> target.
> 
> Maybe, I am only guessing, the double colon was necessary back then, due 
> to two Makefiles containing the same target, and lost their justification 
> when the single-colon target "$(BUILD_DIR)/%/.stamp_built:" was removed 
> with commit https://git.buildroot.net/buildroot/commit/?
> id=d8b55b99095e5eed46d2b95bdaab2e69ccbd7170

Thanks for the additional research. However, I don't think your
explanation that the double colon was necessary back then because there
was a $(BUILD_DIR)/%/.stamp_built rule in package/Makefile.package.in
and another one in package/Makefile.autotools.in really makes sense:
this was also the case for all the other
$(BUILD_DIR)/%/.stamp_<something> rules, and only the .stamp_built one
had this double colon added.

I can really only think about this really being a typo.

Here is a highly convincing explanation: up to a few days ago before
you sent this patch, I had no idea what this "double colon" was doing
exactly. And I really doubt that back in 2009 when I contributed this
change I had a much better idea about it. So I don't see how it could
have been intentional from me, and therefore I believe it indeed is a
typo. I looked up the history of this patch, and it was posted only
once to the mailing list by me, I then did a pull request to Peter, who
merged the whole thing. So there was no particular discussion about
this double colon.

So, unless Yann disagrees, I think I'm going to apply Bernd's patch
with a slightly more detailed explanation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
