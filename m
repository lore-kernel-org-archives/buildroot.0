Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4044C001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8645F4060E;
	Tue,  8 Aug 2023 07:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8645F4060E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAvnKhPKbKC5; Tue,  8 Aug 2023 07:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6BE405F5;
	Tue,  8 Aug 2023 07:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6BE405F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86ADA1BF82F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B21B405F5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B21B405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3G8I8LKRvLTh for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:41:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D18F402CE
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D18F402CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 559551BF207;
 Tue,  8 Aug 2023 07:41:07 +0000 (UTC)
Date: Tue, 8 Aug 2023 09:41:06 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230808094106.55c83dcf@windsurf>
In-Reply-To: <20230808031350.116041-1-dalang@gmx.at>
References: <20230808031350.116041-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691480467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9M4pHExQqo9PMuP1YsglfQi+06NdWE2wBDXlCbWswMQ=;
 b=TT5s0m8PL2zZotj7NLTrXbJuU4Ni13E/crVNJeoBNsISizyBNWXb4fIAeVTFxeGFFCBvG6
 Dgt9O6Zc/F7b4zQRq4FYMrnMAxMq020QiVvlEJzhqwEcu9V5JHXA7rf4L2D81P24+vTPaP
 SQgJTXU3+AQ8uZXlH7BqYX7hgNr0wZ3JtqFbTCYcUIKi16uEAHB5mg5ZeCURKfdUsMeW6r
 LlPMynxZGPSt/9v7gsyqlGNJ0mwBL/xwefrht1FGX/AO3bdjjsvmX+YPG+lN7n5wH9miEr
 vFAWB885/orNVSqpAezP+zIIA2+XMwD6vKHm9oQqZjhH++yXS2X1cYL4SUiMkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TT5s0m8P
Subject: Re: [Buildroot] [PATCH] package/libksba: update CPE ID
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

On Tue,  8 Aug 2023 05:13:48 +0200
Daniel Lang <dalang@gmx.at> wrote:

> libksba_project:libksba has been deprecated by NVD [0],
> gnupg:libksba should be used instead.
> 
> [0]: https://nvd.nist.gov/products/cpe/detail/AA709F75-0B9E-4B67-ACEA-C1DCF33E7745?namingFormat=2.3&orderBy=CPEURI&keyword=libksba&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/libksba/libksba.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
