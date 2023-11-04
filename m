Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCADC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC5740A65;
	Sat,  4 Nov 2023 15:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC5740A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nli502eesNlN; Sat,  4 Nov 2023 15:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CC8040A82;
	Sat,  4 Nov 2023 15:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC8040A82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D86E21BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7240A60F41
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7240A60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5F85tmA3ZCx for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:11:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0E8D60AE7
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E8D60AE7
Received: by mail.gandi.net (Postfix) with ESMTPSA id A74201C0004;
 Sat,  4 Nov 2023 15:11:48 +0000 (UTC)
Date: Sat, 4 Nov 2023 16:11:47 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104161147.2f73b5c7@windsurf>
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699110709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+iKVvA4hDRztTWHh9gsO0/Q97XJU1u7pgPJSPM8ihV0=;
 b=CcF8K+fBVxbR61O5yASF9isxOfSHJgUGv6gAlwyNJeCBAPGv9eBKr/Cq5UEVYefCrG1F+5
 rYi+XmW1VjEF28PB7V5O3iUx1e5oA1TrNCFJ/2m2UGvP+2kkEKhjUyziq0G6z7hXrZB4fo
 I4OMNkPr/6ryNOoJffsAvzrISAGVIBy7rJfXLHQly6lZbhcBHIErnTk+m97NyRsRkqRCYs
 T7BQS57OlyEuVcgkRO7/rT4IVOz6Bt8OsUDSrTNxY6fZZhuKyIuFOi5F7uxLHWwVu7ylTY
 051necZZPgOXQmlmt+ELll7y3IjuutH9jCwlkhGPY7XN1M5ajVvIO7FQCDw2pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CcF8K+fB
Subject: Re: [Buildroot] [PATCH 1/9] package/dhcp: enable selinux module
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

On Tue, 10 Oct 2023 19:01:25 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/dhcp/dhcp.mk | 1 +
>  1 file changed, 1 insertion(+)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
