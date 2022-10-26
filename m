Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAA1C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866B680FA2;
	Wed, 26 Oct 2022 19:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866B680FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltUybrCbwuSO; Wed, 26 Oct 2022 19:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D784380CCE;
	Wed, 26 Oct 2022 19:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D784380CCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6CF1BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7867740338
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7867740338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlNefwXckKXa for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1340140210
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1340140210
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F23D5240009;
 Wed, 26 Oct 2022 19:51:09 +0000 (UTC)
Date: Wed, 26 Oct 2022 21:51:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221026215107.62e60ab2@windsurf>
In-Reply-To: <20221026194401.997459-1-james.hilliard1@gmail.com>
References: <20221026194401.997459-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666813870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnREpXlKcDJxGs46PosiG3E34DyPmcBWn/W/0f7r/y4=;
 b=pu7XckBUwz9J9nrlfTNCus26gMoF+Wkm7FZQndo+3IYRQrpg0g2mysaAPnrInN1FMMgmav
 SjEUp3Z8fV0eM+Y012cev+AOobT7cUn05Jkc+stW154QpjvMsijTPcj1PmnALdbNQlGo9G
 UW6dy2kbO23xa5qnsHwnbOBEw7fM3jW+4nuvC0+qrBE/xSjgQ4VCngP6ApojO2ioqI0u9c
 0l+CwZRtcw3LVpTAg6aMNXP2ZE2W4bkMqTMWVGBO0nsOyNFVS0b2hQ2QacXMAG5lTxu1ty
 lJ945lJt5DhN1NrvE5q/JkYnOrYH3HQOSn0b9A6PRnGgcbQirpu3RdAXwUgQ2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pu7XckBU
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump to version
 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 13:44:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
