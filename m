Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDB5C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7352580BC6;
	Mon, 24 Oct 2022 21:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7352580BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9SFrbuUn5ka; Mon, 24 Oct 2022 21:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB8480BC4;
	Mon, 24 Oct 2022 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB8480BC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECE31BF338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5F840164
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C5F840164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40Ity0Exc_e2 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:04:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F3B4015E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F3B4015E
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:04:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB55E240008;
 Mon, 24 Oct 2022 21:04:12 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:04:11 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221024230411.5430f6c0@windsurf>
In-Reply-To: <20221024075253.3228016-1-peter@korsgaard.com>
References: <20221024075253.3228016-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666645453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iEmiLoznFDFd/MQxfTtJ+9q5C7fozfbpnvYJjhSyaQ=;
 b=oFoWu0eyoahKI4W47m/p0HyV26OoQ9V7AmV394ZTVCAwHJynT2f2D6b8J87BU/YKdp++Ne
 HIOxNY0A0d9/6dmpJ8r4BHkfZ7swLqJjjNLDB+aeeZnEDEOKx7XtzGyOmrvPG8fhKDeArj
 CotwExwhJjeLBA+d2jYuWv5/JovxlC880fbIw0dEqUOp4RD9SyBFYmzkKSNqg7PM6kNgSl
 qEgf3v/dDg2Oda/24gfF7ADlss9Lrq4lHzt4cisTtCLceRCK45APZiYSbN8k1hXKtAM0gx
 x44Wbsn2CwoDLKGtArlC2yFQEwZATPVr5v7OsABkZPw42e9CiyfinPD6hCsLNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oFoWu0ey
Subject: Re: [Buildroot] [PATCH] package/wireguard-linux-compat: bump
 version to 1.0.20220627
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

On Mon, 24 Oct 2022 09:52:53 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> For details, see the announcement:
> https://lists.zx2c4.com/pipermail/wireguard/2022-June/007660.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
>  package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
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
