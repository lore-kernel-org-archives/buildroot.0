Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A59FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0C480E46;
	Tue, 25 Oct 2022 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0C480E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-4YrzOU0jKx; Tue, 25 Oct 2022 20:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D25580B64;
	Tue, 25 Oct 2022 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D25580B64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA3F1BF23C
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1536140261
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1536140261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AweMsHjrSJJP for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:59:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F294025A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5F294025A
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:59:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD85420003;
 Tue, 25 Oct 2022 20:59:52 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:59:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221025225951.5efe7b3e@windsurf>
In-Reply-To: <20221025150048.3640674-1-james.hilliard1@gmail.com>
References: <20221025150048.3640674-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU0dZSwqR8EaqabIhhCGsneGRqJYGsLKRIlhgJArRQ4=;
 b=oQkvRXI9pTTVTSIJikVkROMmQQLGvRmopXCuep3xQy8OREZHVY2W2OiuYEVrexOqn9MjoN
 UKS83adyDA4UyOoXwWtQsYJ4tyQXqlydRmYt2oDqqaJW/YPviN94Qqr0oqhzWPkOlCPjHl
 p5zMs+zxZH/SRCdKZ9UvFqP3b8oh6eCzjsnKI6khw9XnF0nt+7eMzwUhytc6aFe0UgJipx
 UesuJkYws4qxeO8EvlYSQKFReCpzlMXLr4/0dleU67wr0/IhOjDJMfBfJfVZgA/G7pJdrf
 2DsfND//yJy3ieEAKT7LWHt+z6z06Kz2XXiUs1N6doV3TDhInsQrE4ujwDXQBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQkvRXI9
Subject: Re: [Buildroot] [PATCH 1/1] package/libpciaccess: add new
 host-pkgconf dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 09:00:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> After updating to version 0.17 we need host-pkgconf.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d41/d41509feaa889979668fa5105ca1defca71567a6
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libpciaccess/libpciaccess.mk | 1 +
>  1 file changed, 1 insertion(+)

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
