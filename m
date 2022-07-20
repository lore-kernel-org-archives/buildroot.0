Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4879C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B4CE41026;
	Wed, 20 Jul 2022 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4CE41026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OnSd70rf8Dp; Wed, 20 Jul 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F69B4017A;
	Wed, 20 Jul 2022 20:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F69B4017A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8A2A1BF228
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A144183F53
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A144183F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSkFqf5repc4 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:59:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C64283F52
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C64283F52
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 20:59:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B15A240004;
 Wed, 20 Jul 2022 20:58:58 +0000 (UTC)
Date: Wed, 20 Jul 2022 22:58:57 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220720225857.76539e4e@windsurf>
In-Reply-To: <20220615161753.2580142-2-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
 <20220615161753.2580142-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658350738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jq2dZpR+bUnaNIpxoyXdD4IT6WmsvmrvcPswI/Z+3II=;
 b=AuWU6yicqBcwmtbgaVkdAQByYh4BG1+dHDJeuFNklSk6+4Al+pZntYz9bqkDbGqxvmBUB7
 xYKvPNxvbUReVedI5BPiQkKQx1JMrW8eKZX2HKwKOb3IMr9gWPxT8UKSUcROdCuuR2fI8P
 0pnqJDFpVxTSD8iT/EvERQ7n15kUV36jvpiJ+CUQPLUE1mkaN6QR5L2fFA3rrv4HCMarHq
 XVjaEuMlFEnWVAFZgrb+/odoypwu+lo4WVcjy7A2G7YRK1qvQJtPSdTyc+PxHFhhmmRHh+
 qmrAHRjT5yV5JQHUdZK11F+EN+ZZkco3YhYU1gI7FeR7I4pDh8tBXBPcbi9dFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AuWU6yic
Subject: Re: [Buildroot] [PATCH 2/5] package/open62541: more options
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Jun 2022 18:17:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/open62541/Config.in    | 12 ++++++++++++
>  package/open62541/open62541.mk | 12 ++++++++++++
>  2 files changed, 24 insertions(+)

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
