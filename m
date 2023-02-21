Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CAC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE2882A0E;
	Tue, 21 Feb 2023 08:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE2882A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oS6CFN5BRdy4; Tue, 21 Feb 2023 08:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51EF38294A;
	Tue, 21 Feb 2023 08:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51EF38294A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE0A1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3920742D20
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3920742D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCb5rILZzYq9 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2756B42D1B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2756B42D1B
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:41:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 031BC20003;
 Tue, 21 Feb 2023 08:41:07 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:41:07 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230221094107.2b149b02@windsurf>
In-Reply-To: <20230213124021.12522-2-heiko.thiery@gmail.com>
References: <20230213124021.12522-1-heiko.thiery@gmail.com>
 <20230213124021.12522-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W25LIhTvUx3yYSMck7Wkv1jxx2MTRZpNgnw30/Q5rWc=;
 b=APCLdjeN06R1ooga2wj0NXAiYCxMJozsJgAgp2C2Rcxvwgj/Qyxao6G60su8DDddJWu4pE
 ueBziwmnvMfHOML1va73xEturK9Fmy11vTesqJNHUrhod5nhW1BBFr5Rc5mcu8vi+67rXp
 +bxAcqUtD18rbUZGcW75hjhu7iTptJCcXZKpI893AGjWkCCESggjngtvR5C9d5Wp4YJeni
 d/vCLwCjIWB+ioDRUSbFsjRyC/rWWilTatLqO+hg0y3+dc76bySKFEqVXqe9I3TI/qWMZ9
 ElZFUbfn7IeISmXJwdnrBFPlZvPJCsa6cU/PEVcIY/ayaTD3RxoRjQo2wy1RUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=APCLdjeN
Subject: Re: [Buildroot] [PATCH 2/2] package/network-manager: bump version
 to 1.42.0
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

On Mon, 13 Feb 2023 13:40:23 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 4 ++--
>  package/network-manager/network-manager.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
