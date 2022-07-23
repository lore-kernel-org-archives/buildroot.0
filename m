Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A8DC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E344442477;
	Sat, 23 Jul 2022 20:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E344442477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUGXjlEdUdnC; Sat, 23 Jul 2022 20:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667CA4155F;
	Sat, 23 Jul 2022 20:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667CA4155F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE4221BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C380E4155F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C380E4155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xw6nupZzp4Wc for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:22:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306B6410DF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 306B6410DF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:22:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A468240002;
 Sat, 23 Jul 2022 20:22:38 +0000 (UTC)
Date: Sat, 23 Jul 2022 22:22:37 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220723222237.7989b5c6@windsurf>
In-Reply-To: <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
 <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658607759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjSP8bXnCcie5cgh5/qBCsdNeiGgR3Batr4eMWLvQ4Y=;
 b=bzMQq9Or2f09y7Fj0pHh28xoRGcybhVGIpZ/74dVOcP9c9TUhM05DmtyyUdg7rZxfI8acp
 3qWCc9i4ggBrOY8TDzajrm2WJA0qrYxyFPO3fvcIxzdLfb+wz15sGnaWqpFnSLnoaz0zZH
 BE6XFK3SwbKB9H/lja562mPlm8fFjx2JKJDTpdF94sf9yQsqHxXtjfdaMMYZXyEacSwa9f
 mVS1/mxF1/bGMveyIWuxS5B21Cb4yZFA21L58dluote5hAYHGZkeQDKwzL7G6r1hKsfjLh
 Yr5uPo8LUPWuN1lscyLJCpnBS/Ogi3MFaX/+G1KXl7kXNviTebBh7fyO/67oyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bzMQq9Or
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: Anisse Astier <anisse@astier.eu>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Jul 2022 12:44:01 -0700
Christian Stewart <christian@paral.in> wrote:

> > You're patching go.mod/go.sum, and this patching happens after we have
> > done the vendoring of the dependencies in the download step (an issue
> > you have reported already), so how can this patch work? I am missing
> > something here?
> 
> The patch includes the changes to vendor/

Aaah, indeed, I missed that, but re-reading the patch it's now obvious.

> Go uses minimum version selection and indirect dependencies. If you change
> the version of a dependency, it will also update any dependencies to be at
> least the version selected by the updated dependency

Right.

> That said if you check the patch to vendor/ these are really just
> additional lines that explicitly say which version is imported, same
> versions as before, there were no changes to vendor/ outside the one crypto
> package.

But I see this:

-# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
-## explicit
-# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
-## explicit
-# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
-## explicit
-# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
-## explicit

So these lines are really removed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
