Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC54DC19F28
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86E3E4055E;
	Wed, 27 Jul 2022 13:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E3E4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNIv7yVvYUrH; Wed, 27 Jul 2022 13:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3ACF4054B;
	Wed, 27 Jul 2022 13:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3ACF4054B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C58681BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD4CE408F9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4CE408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_5glhBF4M5v for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:25:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47445408EA
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47445408EA
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:25:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08308200003;
 Wed, 27 Jul 2022 13:25:38 +0000 (UTC)
Date: Wed, 27 Jul 2022 15:25:37 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220727152537.21661e90@windsurf>
In-Reply-To: <20220727102354.382804-1-bernd.kuhls@t-online.de>
References: <20220727102354.382804-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658928339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrdkYjPGwpUlXbo+grM2sap+Scx1YHfTIlekr4M7EVY=;
 b=GvBHblnKoyORs50Ilee/dEaBxDnw7ALigKfoqVmA2bU/1i4JdZdtVrbVtmYrhUuXskwAMA
 LN2sEzMzl2hawlmN8/I9Lc/O7iYypWxnyNaKQwnl/nW5jHqYvJIQ8vv/0uIipI/Pp29tgg
 eLKPcfoHynFGMmJVYZv3h7t0AqTwTPlDgZKibslLPCb12Y110+x2DiiUSgvCU51rwNU9O1
 NiFnBlgUEIqWZUdDI0zi39B+VG/KTlFDXbsmQNvFftupvhO1arZN+Rmu/2SIZgxKRmaqq5
 mbwytHCD4OEO7IHWHAoVbD61SVA+l12+byWkXbp67TzYV4VDhP2Xhg9FUdRpXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GvBHblnK
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: drop myself from Pulseaudio
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

On Wed, 27 Jul 2022 12:23:54 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> I am not using this package anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)

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
