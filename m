Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90FDC0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5143B4185A;
	Fri, 21 Jul 2023 21:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5143B4185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elQNBYK-BohX; Fri, 21 Jul 2023 21:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 899204017B;
	Fri, 21 Jul 2023 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 899204017B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC751BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27CF083AAA
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CF083AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvHhkVGokz80 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:00:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E30D083AA4
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E30D083AA4
Received: by mail.gandi.net (Postfix) with ESMTPSA id E95B4E0002;
 Fri, 21 Jul 2023 21:00:22 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:00:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721230021.4ba173a4@windsurf>
In-Reply-To: <20230721173806.3906867-1-bernd@kuhls.net>
References: <20230721173806.3906867-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/4BTkSCkvNx0WyfvteQsk4yakiYnePYmcTRhzRowZk=;
 b=HTNVRfl8khxjq8seo6JzKRQ5NH7HIlgkQAPTQ++eOm8e75O35tgbeT8YL2EGueZzCE7sLJ
 5a5N0sQiOp7gUKZz14OXNfKko6mN4AVwvO3ylo5g3N5O7iCklUvQOxftrIegSn0Vt5Efti
 vDacflUOiqA7n3YIub4zF9spX/U1isWmUus/ymYLyMz5ssrQQNM8czJA9Dse/G03rFMBxH
 glnLtAkuRqAnj2Kenergnajf0r3//O/QQSsEe2NblziNaC5bB9+aDeWSDnt6APnwaznaR5
 ZGSq+Gdf8ibuv3ybEauuYy7xyr74pcIE92nN9sloHnBnJheyvnmjtnAOCG89HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HTNVRfl8
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump version
 to 9.3p2
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

On Fri, 21 Jul 2023 19:38:06 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-38408: https://www.openssh.com/txt/release-9.3p2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
