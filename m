Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15624CA0FFE
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE1B94018A;
	Sat,  2 Sep 2023 07:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1B94018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOiji8MyGjIu; Sat,  2 Sep 2023 07:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D5784086E;
	Sat,  2 Sep 2023 07:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5784086E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC371BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08D68818A1
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D68818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg7knHMlvFUo for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09BB1817BD
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 07:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09BB1817BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE8F81C0004;
 Sat,  2 Sep 2023 07:39:26 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:39:25 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230902093925.5b52dbfb@windsurf>
In-Reply-To: <20230901191447.717460-1-francois.perrad@gadz.org>
References: <20230901191447.717460-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/wGMrFwOn/LiWuWvtW1LA9P0tk/T5w5e6eKUfqX1Z0=;
 b=JEEp2JFWIiJfZhtgMYrXa/L9j3UDojHHLMB5EdXvi5gJhq+1y7Yv+qUAff6oJE43LZMJN1
 t9O3fYzIKdntWxiTFaNvp20xRqM3xu+ZL4eB6s9553MlDygdnBcdiQywwNJsyVDvkaa9i7
 rOV+ajxZ/NErychIEG9FIf3IfW4YhKHb6RfaaCs2qYT8JBtW3fUgBwDrDx2JKOx5Zs2ACZ
 VKYe9fayy08ZTzBb6Q/qeqzO+PfJ1jKE6RRMfUCYfIlqqphwy/h3RceooGenaHtWMUJH+I
 YXCNfi/fJqE1yCrDlXdtc1g46vYj2G2uQ4nwNY+o/igoGZiCLdxLSv6U4q4AdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JEEp2JFW
Subject: Re: [Buildroot] [PATCH] package/mc: bump to version 4.8.30
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

On Fri,  1 Sep 2023 21:14:47 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/mc/mc.hash | 4 ++--
>  package/mc/mc.mk   | 2 +-
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
