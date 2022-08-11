Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE8BC25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A32274027F;
	Thu, 11 Aug 2022 20:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32274027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pAUxA7VOIvM; Thu, 11 Aug 2022 20:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD43F40217;
	Thu, 11 Aug 2022 20:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD43F40217
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E58351BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0094401C9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0094401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DL-Mmf47Y_OK for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:56:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93EFC400E2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93EFC400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:56:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 599C8240003;
 Thu, 11 Aug 2022 20:56:46 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:56:45 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220811225645.08208e52@windsurf>
In-Reply-To: <ca7d879728d7de4dc9636c3facd570c83860b9f6.1660131874.git.stefan@agner.ch>
References: <ca7d879728d7de4dc9636c3facd570c83860b9f6.1660131874.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZJsO/W6+gOTi9PGmEGYFMvqK5TryswYj9q5EpeX92k=;
 b=dlh69vdXA92QO9THlpVLgp9egBMLOE4Zz9BrnNepSj/NpSt7t6Seb9O2nqU84lq7TBqLsf
 vkMJtyQrm4rrcjEnF7V8SDs35gXTaatY/DoVBGS6EXS2aWeHp8FIUYb5ZXAxSS43oQ/Las
 bv2KYKYYVOuKaBQJf/5XAviSW7Kl6YF42mfS+8/BB56TmIxfAG/B308TTs1+/K1/UuulzP
 eWXl0l0INtfbU54u3o7t/GRf3HtW8l12wYhTJLV/1LKQ0TwmoM9g46AuB4UxEssPe5sB5L
 o6+FdSvZ6d6F/foOYGi5gOn2sFSn+BZE1tsgS4/mYdVOFW+obL8zHql6Or4xuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dlh69vdX
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 32
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
Cc: nolange79@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 13:45:38 +0200
Stefan Agner <stefan@agner.ch> wrote:

> The new releases mostly contain bug fixes. The build system has been
> prepared to use AppArmor library, but since actual support is still
> missing it is not worth yet to enable build infrastructure in
> Buildroot.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/dbus-broker/dbus-broker.hash | 2 +-
>  package/dbus-broker/dbus-broker.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
