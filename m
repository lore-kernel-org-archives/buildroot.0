Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0154C05021
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BB0B83C0F;
	Wed, 20 Sep 2023 20:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BB0B83C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRMfEen_Pk1B; Wed, 20 Sep 2023 20:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96D6183C27;
	Wed, 20 Sep 2023 20:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D6183C27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F09A1BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 189DE61363
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189DE61363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKQHWcrmoCdy for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:34:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD8E60B83
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD8E60B83
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30B681BF207;
 Wed, 20 Sep 2023 20:34:00 +0000 (UTC)
Date: Wed, 20 Sep 2023 22:33:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230920223358.372e82ff@windsurf>
In-Reply-To: <20230919200149.3712528-1-giulio.benetti@benettiengineering.com>
References: <20230919200149.3712528-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695242040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPxDcVCwiDghPd3r2tCOQ+8JDfpVNWsiq42ZYBjM9Gc=;
 b=gRUekXuuL96lkccYvsk7hvquN06mxk5a9fvOZnr3s+z7q1czn3BTBkS6JLjiDMx73Eb4yS
 ec/FHjFV2cZKdTzBNRU+uvLl/MHYUkWKV5Ke0TR/5G8N0leErjFdCoVtGA78JOEruX6lxB
 CFSS7RYsm0jvrVqMqBBROe/HqUiVqmAKMvzC9CIQFNYEqMioZ7mWLRFx0wvYq43ewI/qau
 ONLnAEFnjGXOxeRFu3WuNZEYhOmQHkH0B9P24R3kuvyvUh1occYH3ixVU+HUKYD9VGvHXb
 8/oMvaoJf6flA7jNJ/76CgWnjiNVbL9R/+GkCz0EM4tyzdsI3Th3XZe1W97/lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gRUekXuu
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.2.1
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

On Tue, 19 Sep 2023 22:01:49 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
