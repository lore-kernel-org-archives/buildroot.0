Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9DFECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CD06843E7;
	Sat, 17 Sep 2022 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD06843E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sl9m8vrdLtIi; Sat, 17 Sep 2022 19:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20AA843E5;
	Sat, 17 Sep 2022 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20AA843E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5F921BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C3E14011F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3E14011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wEZGkVolpNUO for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BCEE40119
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BCEE40119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:44:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E9EC40003;
 Sat, 17 Sep 2022 19:44:36 +0000 (UTC)
Date: Sat, 17 Sep 2022 21:44:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220917214435.26cfedd3@windsurf>
In-Reply-To: <VI1P190MB04937082630EA11FF5512A089F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04937082630EA11FF5512A089F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663443877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQ7S1AwINF26CZAoYz3WVPoXJo58ND+laouRrRB39AE=;
 b=WBqOIeFkHF6GG8S5cRYGiXzzf8SfVlQEOGM4jMkfFmqXw1I1/6jUMJqe/vV8extJrXDZ0y
 kufE19bW7JlEDNvRDfI8Lf1cZacyK1rVyTaxgJoAn1YrRlg8MKZ2oEgi7Qnwd0GBQmrH0C
 76Ak8DM98PutLy+Ax3IVGb3HLaalsbXHhiM3RZbhdhXpmrcZ5jACSg1o6waQ7dRqo/eo00
 1EvSTm7R7Xl6Si9N8X+eoTxzp56Y/50yonLigrHZEWRAy3LF+mXubyGnO04b1mjQ+up161
 7GyjYeMdVRsXjoZULnidWcG296vuKLQGL1nieWThVTINCqPgsLynCoxFVOcTpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WBqOIeFk
Subject: Re: [Buildroot] [PATCH-next 1/1] package/libsigc: bump to version
 3.2.0
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Sep 2022 08:35:26 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/libsigcplusplus/libsigcplusplus/blob/3.2.0/NEWS
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/libsigc/libsigc.hash | 4 ++--
>  package/libsigc/libsigc.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
