Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C0EC47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 166FF43741;
	Fri,  5 Jan 2024 13:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 166FF43741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Py2YlPOhRYn1; Fri,  5 Jan 2024 13:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2CA43700;
	Fri,  5 Jan 2024 13:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2CA43700
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8901BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 281FC834C7
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281FC834C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd7UmB0xhhLI for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:08:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D847082FEA
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D847082FEA
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAF864000B;
 Fri,  5 Jan 2024 13:08:11 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:08:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105140811.31b0aa2d@windsurf>
In-Reply-To: <20231204211712.12727-1-bernd@kuhls.net>
References: <20231204211712.12727-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704460092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5qPasf4gx3xkcCjO6HWL4gyjpnViLNm30yUkea4emo=;
 b=lXBtF4HwECvcKwdgCrC7FSje0eb541Fr7zfwySbcx/rTqhCAgxxZkazktlu5Q4qX/UYgHT
 EkuFF+pvfT6Yan4Hg0na8Ba88Gniw9eaAZ89lc8OISAfR9NSZOGP/6uxk5DMaiFtS231Z7
 /wjMhkFCXqvL2gwnHxJF25UfJY+fOrgCCsMHmAE9TdxhTqCWT7FafNpga7b1wIZBEf7L6Y
 KJzygg4sn7leRXTBbZ+87LwQN7JxHlR0VOo70KYS+r7J2g9Q4xcPUEEBrUKSzQcvZRVYQA
 0dMI6TaPtf2Nor/hS5V/drDkdQ1zRsUPon7cmsOWAXOOm+qKQGMP2nZT6vv1Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lXBtF4Hw
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 20.5.8-Nexus
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

On Mon,  4 Dec 2023 22:17:12 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
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
