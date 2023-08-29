Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDDCC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6226382035;
	Tue, 29 Aug 2023 13:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6226382035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAMrx_1FoAyk; Tue, 29 Aug 2023 13:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FF3882056;
	Tue, 29 Aug 2023 13:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF3882056
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E56CB1BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97B1441040
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B1441040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLaGQD37-Xf1 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:22 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE1554116F
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1554116F
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 5FB25CD0FA
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:55:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6844C0006;
 Tue, 29 Aug 2023 12:54:08 +0000 (UTC)
Date: Tue, 29 Aug 2023 14:54:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230829145407.67d24791@windsurf>
In-Reply-To: <20230828163003.818942-1-bernd@kuhls.net>
References: <20230828163003.818942-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693313649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/4jD9Z+gP/B9hiBQl9CPnRrMjL6TAvkbB/myn5HjIU=;
 b=dE9s6HpilW8JPzbJXBbwc0T9ITfCi0sj3Xs8pf8tBp+Qzgree+Yl5zu7Xq4A26yWthoOtv
 uNJG5nxmbQuaU8AtE3iXdyPohLnmMjmmz6zp0pq2fiszFdM/4F7kazC+u3BWdymOtuPY3L
 wDsoXmyAnulL7QUT5ZbRCUmVQ59vnSKdJdpZcegBPP/eZFNGzM9ou8qT38B085t3zpV+od
 mCdFr9OHVpsusAKqTd1+2/piOXsTwz2bRrNS3/rypHLSMZGmSrPesFujAZ7zg3RUi6JPWV
 rnayejVjJTJ8vUX1O+6wAf/uPoqeNSLWJwuy6BmA2AiGj/5EANLWl36m0kyZcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dE9s6Hpi
Subject: Re: [Buildroot] [PATCH/next 1/1] package/sqlite: bump version to
 3.43.0
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

On Mon, 28 Aug 2023 18:30:03 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://sqlite.org/releaselog/3_43_0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
