Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13E2C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E3E1417D8;
	Sat,  6 Aug 2022 22:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E3E1417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTVmDXSFbqnj; Sat,  6 Aug 2022 22:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7C041761;
	Sat,  6 Aug 2022 22:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7C041761
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFAE81BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6FC4401DF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6FC4401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6EQeP_8mq1g for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:22:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA49840327
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA49840327
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:22:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA9941BF205;
 Sat,  6 Aug 2022 22:22:01 +0000 (UTC)
Date: Sun, 7 Aug 2022 00:22:00 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220807002200.0e42e15c@windsurf>
In-Reply-To: <20220806154610.4106492-1-giulio.benetti@benettiengineering.com>
References: <20220806154610.4106492-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659824522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2ChqtfbPgVbE1SjwIYWVw0Uc01FDlfmiBGDA4/8I1Q=;
 b=NApeua2AJ4eVa2B+9t41WmC0XMzY93NAx4TkbkSnKA8M3mWBW5wWfWJ+Svy8vcw9aO0Hf6
 6J5VwPdCuXKSc368B0sTq20nvDkfjUI8N9T6bsPL+QrxaDmQPoQGC29JfkEKJQzxRVenJ/
 tkg08VIeUpU7naA/Ad0zeFYiKjnc981Q8xdckCaOvDI8FWyvaBzrFxUTs053NOQQZJQX6j
 2b4j/sXiL3b4VTF/qo/oEGQLQ6tfVcL/FHxVMxJPoPgB8v8h2pl6+kAYp9dnJrt5IG0pRj
 N4utCujmxIT5pelL7Eq99Y8+eOB4eLBvH0DR4PTR6Z6mVjF6gQdrRCAnfCg+Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NApeua2A
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix host building
 trying to call asciidoctor
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

On Sat,  6 Aug 2022 17:46:10 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> While bumping version I've fixed build failure due to missing host
> asciidoctor by passing --disable-asciidoc to CRYPTSETUP_CONF_OPTS but that
> is missing in HOST_CRYPTSETUP_CONF_OPTS and this leads the same build
> failure of target building. So let's fix it by adding --disable-asciidoc
> to host HOST_CRYPTSETUP_CONF_OPTS too.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0c1/0c1a6a8e59653afaa09303550f74475b4a3898bf/build-end.log
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/cryptsetup/cryptsetup.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
