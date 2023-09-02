Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B50CA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 482E94052A;
	Sat,  2 Sep 2023 07:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 482E94052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oHLcJqUTFOe; Sat,  2 Sep 2023 07:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90AE1405D1;
	Sat,  2 Sep 2023 07:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90AE1405D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E36D21BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF6F81EAE
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF6F81EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3df-PNKDbwuo for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:41:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AF9681E83
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF9681E83
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF7B240003;
 Sat,  2 Sep 2023 07:41:32 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:41:31 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230902094131.76422519@windsurf>
In-Reply-To: <20230831194514.37493-2-dalang@gmx.at>
References: <20230831194514.37493-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9yUvvdS8CZDX+KjXSGb3VGSHwMCdT7LqcrwVovrgZc=;
 b=athJfvAeo+Xuvd8p4mbRlGY86wM/2z3OUjGyu3I7COo6d3HYr74ar5hoToSiHCDCXtAUha
 rO5MEmjRxM6QaDJlx8EJ7rsXjcRSvq9KIv7tvwsovGorZwQ6uHjKCx9pqdt6K6HBS5aLfh
 +j+tExemUCl4RruAOfLG0yjpGcgWvkabCZcMHE5C1trr9IVA1EsDE9P+sfg9Zjb5syZaeW
 bLJwt4GpuaaHe8x7WcRnCq0/fgi4fP7ynaG0DW5zfXXpI+HJ7SF9rfzfskV2iugNJc8jhP
 kz9ei0OijAOa9N+8aFGtXDmugK2rwAtvSIiL4jRrr73I3Oic27qzyK25MZtlzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=athJfvAe
Subject: Re: [Buildroot] [PATCH] package/libxcrypt: fix another build issue
 with perl >= 5.38
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Aug 2023 21:45:13 +0200
Daniel Lang <dalang@gmx.at> wrote:

> perl 5.38 deprecated smartmatch (~~ and the given/when syntax).
> Backport another upstream patch to drop uses of given.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/727/727aa831881af36394bafef9e13a0dcbd9d0db3a
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  ...ve-smartmatch-usage-from-gen-crypt-h.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch

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
