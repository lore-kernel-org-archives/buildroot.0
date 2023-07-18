Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA307EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40758417AE;
	Tue, 18 Jul 2023 21:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40758417AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fz4MgNpbMCnq; Tue, 18 Jul 2023 21:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291E8417A7;
	Tue, 18 Jul 2023 21:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 291E8417A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 530D11BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C46B4148F
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C46B4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bd1nVoBCuIMK for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:19:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2465A40280
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2465A40280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:19:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E078C60002;
 Tue, 18 Jul 2023 21:19:52 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:19:51 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20230718231951.349b78e0@windsurf>
In-Reply-To: <20230717091727.2658078-1-yegorslists@googlemail.com>
References: <20230717091727.2658078-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689715193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANmmZ/k5Smw9jSobhP+AhShXYHi5/XYT+Vz+Cs9RGCM=;
 b=j+IPzkh7u2PV6McXn+nBmxXmY/Zk1WIvA/wWGYC0+yGYcKEK+7IWsn8xv0+h47BpDG4CS9
 5QLMcgOveOMaTlrfnpFikEMAZPScg/RzSDfqm6b2AmXZ4njAQfWGJIXI8BPPC7529zcvPD
 Npmw50fmuEoAuKDcpO5ZYpriaD4t+Rrz4PPLF/W1YFq1GqX6w2RJ1qNLivU2IywckFgnWj
 ODmEExixdKeRVvn6uFEtUMSDubMusxhNayN6BpSB9xMEKlHxRvTFE1jqgPxvEJIcO8Jj09
 pbWXBkH9YsIVDXLqF19sCbvU2toCjKewDSQXt49FDAlf4CmTmKqzI3JftlGCnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j+IPzkh7
Subject: Re: [Buildroot] [PATCH] package/python-pysmb: add the missing
 runtime dependency
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
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jul 2023 11:17:27 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-tqdm dependency was introduced in 1.2.9.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-pysmb/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. Weird that this dependency was made a
mandatory dependency, it's apparently only used to display some fancy
progress bars... software is getting bloated at a very high speed :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
