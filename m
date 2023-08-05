Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E9C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B1F409C9;
	Sat,  5 Aug 2023 22:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B1F409C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hF1aTYQds2GP; Sat,  5 Aug 2023 22:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4088415C8;
	Sat,  5 Aug 2023 22:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4088415C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF2B21BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B5560BD5
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B5560BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZReJhrkTiZ3L for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:43:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5670560E2D
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5670560E2D
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2AE060006;
 Sat,  5 Aug 2023 22:43:34 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:43:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004333.0b9de84a@windsurf>
In-Reply-To: <20230805213408.3588223-1-bernd@kuhls.net>
References: <20230805213408.3588223-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZIcXqM7vyM7qDnLwmGGgtuOiCu9R6RZEDvtYZK4kYk=;
 b=m0H2AtEYrfBJgTtB3g3bCy/sXPkiivKagfKsje5+kXe7DFlM8cSxOWUXs760mY7sE5fD7d
 ObkgfDb2y13pKtPYdbDnWCWBvo1676ChAssXOP7/ijRBB3fDyFx6UFAD8oD47JEkjKqtix
 doUpVlcvHta+0KW1QRLtDKNjuyZkAuT8L9HpzmkEoVcs+IvcYVLwNFdJ0yQCeD1330yBjK
 olaK+pOMzsQcG7Q1BeUCguLqMUJMISuP/AMDIeyvs4Fu9ZmM80R3jpLGocxamjlH7VF+/n
 t54aipegOjvI3JpA5wTQQHmuaMI9+UMkllXTePZVq8T0x8gq2vSf4U19GSP4vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m0H2AtEY
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: bump version to
 3.7.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 23:34:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch, upstream applied a different solution:
> https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2
> 
> Release notes:
> https://github.com/libarchive/libarchive/releases/tag/v3.7.1
> https://github.com/libarchive/libarchive/releases/tag/v3.7.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...o-not-add-iconv-for-Requires.private.patch | 28 -------------------
>  package/libarchive/libarchive.hash            |  2 +-
>  package/libarchive/libarchive.mk              |  6 +---
>  4 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
