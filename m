Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EFCC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E85E740A0F;
	Tue, 26 Dec 2023 13:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E85E740A0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mN9y3a63tlfU; Tue, 26 Dec 2023 13:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EC240A01;
	Tue, 26 Dec 2023 13:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EC240A01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64A171BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4793F4091F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4793F4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpyIpAHj5C9e for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06BB9408FB
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BB9408FB
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7C4540004;
 Tue, 26 Dec 2023 13:13:49 +0000 (UTC)
Date: Tue, 26 Dec 2023 14:13:49 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231226141349.41c4e5c9@windsurf>
In-Reply-To: <20231226112105.8872-1-fontaine.fabrice@gmail.com>
References: <20231226112105.8872-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703596430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyTmQ363sEJXytpS6KMv1WuImLB1Zo1OLw0XzU1XyHg=;
 b=g7N54yhDyVeKHbfPyvsHfLWfe8ui6/Ir7y5fdf2UA306LLR3CZOzSxjsH6noZmVZ6mblxq
 kz3breR2dfdlGHoI4JvEHs67+MA3w3HAS2baecmdFAFatROWj7PrrSbgIRk9HOpCe6AyRH
 lRbGa6Ro494cq0tTlpMDzymaRrWZb/xRw7a8/zEKIsllp9/NRbr4Mn7RfXQriIsDIIyCDn
 fyg5kJTB8RPRdHQXgQv4+7h3Kl8okz+yAJK8yf/zsAoYLacIVx0SSrEBqV4sM1Vczuj9/0
 QiddQ4dcAb8Wh9xk+h6J9lapRzomBGzeW4NHs1SPTWCH47rwWPKDmjOUW958fA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g7N54yhD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: add CPE
 variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Dec 2023 12:21:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:encode:starlette is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/B4613D5C-E46D-443A-8738-58E4FBC0C127
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-starlette/python-starlette.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
