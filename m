Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBE0C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDBD83FBE;
	Wed, 20 Jul 2022 21:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDBD83FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cIuZsSG-mvV; Wed, 20 Jul 2022 21:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2973E83FBB;
	Wed, 20 Jul 2022 21:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2973E83FBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4B81BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187BD401DB
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187BD401DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRojTroGh25o for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:21:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFBA840010
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFBA840010
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:21:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0EB260003;
 Wed, 20 Jul 2022 21:20:58 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:20:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220720232058.4e38cbf6@windsurf>
In-Reply-To: <20220703163439.1042681-1-james.hilliard1@gmail.com>
References: <20220703163439.1042681-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658352059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/szWPfTnXxv2r7KEa7WBeomy9azLlLJElKWiYE6TrmQ=;
 b=fUiIyc2Hb1NtXLADcI38H2gLpuHIBb8XsuCa/0buaOS1KbnJHWYUm9rZsFCoK7Nov84x/E
 BEHD76dR6x9ejG8chzxuEXaYI5B2Hz45Q4kk3ZmLO/Bvy9BjmP9jWg2xpWpCcEIgKOBeRO
 z2Zo2tJKP4lQ3nv0DMrtDEySm0EDpVEoi4YEtsQ/L1FAze7zi8JE+IOSe/SKi+ON8qtgt/
 8K041JDoeo82t5PiE50pblMV5dbm97G55VfcA2Q5OjwZD6RNYHlorsglb8+3PEUF7e/lrd
 fXwyjaA+YwdMWmcTdTILoeF1UEYny6U4QubIoCj/LdKhc7CI+oKbUzCRZg+cVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fUiIyc2H
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.63.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  3 Jul 2022 10:34:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
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
