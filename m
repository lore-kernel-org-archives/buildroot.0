Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD713C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3244F40A6F;
	Wed,  1 Jun 2022 12:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-64w_tiisU6; Wed,  1 Jun 2022 12:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6700740A38;
	Wed,  1 Jun 2022 12:26:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE9DB1BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9524168A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klhjlAgS87S2 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:26:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E565415ED
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:26:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19DDD60006;
 Wed,  1 Jun 2022 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654086372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9J0SKUF6sX7p3WjD2OtXdWjvIdrtizAIY8mdh477WFY=;
 b=NbSynSeo2+1VopN5N7uB7TajnpXrmGFsxoir8d6NagC0oZvx6AoZq2jOpvrVM4heA3hQ8I
 ZMxRr18d1WH6bZU4bXNPEjjkIXh9ufR6/ikXbti/S8xbVu5JYyQiVnuptR54ijljEZ6USi
 5COtStFTnVYDmiqLJdD4YandVVu5n1N6cexi3yh5tljs4Qw4mEz7QiiO6W8ZvbL/lImlPT
 YJqcN2dA5qdKI0aUYJy2qWWGARwPZrX7wg2fn0PN0OdCp5NDYg5rxfMOjKNrc95mRrbFxd
 36GVVtQQOS5e1jxW7omYdVoo/S8PPKgY55GR0ec+Klprz8OkClhHS1yxqhTi+w==
Date: Wed, 1 Jun 2022 14:26:11 +0200
To: Reinoud Koornstra <sockstat@hotmail.com>
Message-ID: <20220601142611.4de82268@windsurf>
In-Reply-To: <BY5PR02MB6914D9F3E09E2720D4DEDC41C9DF9@BY5PR02MB6914.namprd02.prod.outlook.com>
References: <BY5PR02MB6914D9F3E09E2720D4DEDC41C9DF9@BY5PR02MB6914.namprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Error msg while using toolchain compiler
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Reinoud,

On Wed, 1 Jun 2022 02:09:21 +0000
Reinoud Koornstra <sockstat@hotmail.com> wrote:

> Hello Everyone,
> I did configure a toolchain to be built (make sdk) and copied and extracted the tar ball to another machine.
> On there I did run relocate-sdk.sh
> 
> As this toolchain is another one compared to the default gcc installed on that machine I specific it by CC= and then make bla bla
> The error is get is:
> x86_64-buildroot-linux-gnu-gcc: /lib64/libc.so.6: version `GLIBC_2.14' not found (required by x86_64-buildroot-linux-gnu-gcc)

Could you provide more details on how you're using the toolchain?
Indeed, if incorrect flags are passed to the toolchain, it may cause it
to look for libraries in /lib.

But if you don't provide more details, we unfortunately can't really
comment :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
