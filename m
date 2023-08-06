Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B79C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE07F40125;
	Sun,  6 Aug 2023 14:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE07F40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cS1H95SAWmLH; Sun,  6 Aug 2023 14:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32ED410A0;
	Sun,  6 Aug 2023 14:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32ED410A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9226F1BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07D32405B1
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D32405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JCb4eGN6YN0 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:27:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C59154000B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C59154000B
Received: by mail.gandi.net (Postfix) with ESMTPSA id D198220004;
 Sun,  6 Aug 2023 14:27:45 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:27:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806162744.4d357104@windsurf>
In-Reply-To: <20230731204947.2275706-2-bernd@kuhls.net>
References: <20230731204947.2275706-1-bernd@kuhls.net>
 <20230731204947.2275706-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691332066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opvDO4QRi/yvo6sVvofcO2s4570j9q1fJRc59v1cdEo=;
 b=T77qXV+0mN8r1xay4Sm93g+KWNoWUJAC84nDiADp3pbnmlHPP76H2puLBeO4qLV5TGWMJ9
 Qs9x8OmIRBKnaMn5ggCqtyLT+2ogl9QMrqffmymHCiCxkMLyfMXZKFGQUuOEgfKEAuteIz
 OVxfb+JoZdOwPAzATXrxhjCRJIvpQ203gehbyljdjhbFO0/uepnPjxyKZkPxEV0wok9/do
 WlyeRJ4qlBmyiQo3VIQrQiK/CKsNqwcbSgTsBOmROROq7fkhqpvfy38lMHrxP2LMkaroDF
 AOI6qBaavLIM4VXCWe9poPBqvS1cumLpTRyx8frWZ2XVtIUfIi1a22tg+ziF1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T77qXV+0
Subject: Re: [Buildroot] [PATCH 2/2] package/sentry-cli: bump version to
 2.20.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 22:49:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://github.com/getsentry/sentry-cli/blob/master/CHANGELOG.md
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...able-SSL-support-for-the-curl-module.patch | 24 +++++++++----------
>  package/sentry-cli/sentry-cli.hash            |  2 +-
>  package/sentry-cli/sentry-cli.mk              |  2 +-
>  3 files changed, 14 insertions(+), 14 deletions(-)

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
