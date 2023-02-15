Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5E2C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5CCC81F70;
	Wed, 15 Feb 2023 20:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CCC81F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZoIFBjJOrvU; Wed, 15 Feb 2023 20:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E2381F54;
	Wed, 15 Feb 2023 20:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E2381F54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9B2A1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADE3415CF
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADE3415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeRN7inVw-oS for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C612409AD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C612409AD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:57:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5071C0003;
 Wed, 15 Feb 2023 20:57:44 +0000 (UTC)
Date: Wed, 15 Feb 2023 21:57:43 +0100
To: Matthew Weber via buildroot <buildroot@buildroot.org>
Message-ID: <20230215215743.0a03d0fc@windsurf>
In-Reply-To: <20230214180505.3691-1-matthew.weber@collins.com>
References: <20230214180505.3691-1-matthew.weber@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676494665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdNw8LBwr8oclOnWkn1C9YlgBb9Y5G9jT+D50Dw/OvE=;
 b=CxgmVbNIi6/DyX+VRQm6PolmzGAiGf6EFxnmaN7WJGrvn5X42EUOrsv0CU40VdXJH47TMd
 JuETonmE8AEfMAn0FV1dWbeXHK4cKReHPaLbFo4qV14KqMq94Rxyd2cwbUdWDAM1mDfHyG
 223bK5ZyCKZTkCztEXs9XVcUu4FC00+/OLJTq3jiIg1u9Syr+2nVi7dkRBtJib+QPQssYq
 QOf5FtbVTH2JbKRh8Dco8nXWXgZPLpgcBuO5gBeWjL0zx0PaDTtc+/sWecjGkthv5S1BfB
 xh1kglnjfzXoPWR0TsRgwn8TQ3LeDoNF9+pAdcqSUmGduoWpBxEnaTIP87Va6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CxgmVbNI
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Matt Weber
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
Cc: Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Matt,

On Tue, 14 Feb 2023 18:05:05 +0000
Matthew Weber via buildroot <buildroot@buildroot.org> wrote:

> From: Matthew Weber <Matthew.Weber@collins.com>
> 
> I regret that my work situation doesn't sustain me contributing.
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  DEVELOPERS | 105 -----------------------------------------------------
>  1 file changed, 105 deletions(-)

Of course sad to see that you no longer have the opportunity to work on
Buildroot, but thanks for all the contributions done in the past, and
all the best!

Patch applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
