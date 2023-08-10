Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46AFC04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6652240A70;
	Thu, 10 Aug 2023 20:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6652240A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrE6OsDdhhNA; Thu, 10 Aug 2023 20:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACE7F408D4;
	Thu, 10 Aug 2023 20:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE7F408D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 992C91BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D90561042
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D90561042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyvcEEBauye9 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:38:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B81F60A95
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B81F60A95
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72A9CC0004;
 Thu, 10 Aug 2023 20:38:50 +0000 (UTC)
Date: Thu, 10 Aug 2023 22:38:49 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230810223849.2c7ccab1@windsurf>
In-Reply-To: <20230809092316.25721-1-nicolas.cavallari@green-communications.fr>
References: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
 <20230809092316.25721-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691699930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29ThA+4vXby6GW3qnGwEXsEZPIq9Bz/UxZmHplq8K1o=;
 b=LiYV4vyHxMOiopTV4MOUHNk9mTTOsSrbvFLpAtmX0E10hECfP0g2Hp2o3iPMPzJz5QreIC
 rCzNuUi7AQPLxVGM1B7QHSQ6vgM5BXso6MYy7MUQ62Vu8A0roUN+oMX09NtM+6At1it0oL
 ET8DjTNwB9A0KHkH+dwv/x8UrncFo3fEROWxF22MQjQ1Csimfkvc8S9kq8K0un5BcszN0z
 JR2TPQmLU8iYk+aAKKNHgixJ2eRhxNCHAEh+Hqvvzeamhe402PArcFulLy9pWMOxOPtDsx
 vKejIKBFRRFReVI2YWWRwe9FbHtbNA8Xqt8HHMtONGu8Iwhig6wppRnL6eLL+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LiYV4vyH
Subject: Re: [Buildroot] [PATCH next v2 1/1] package/libgit2: bump to 1.7.0
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

On Wed,  9 Aug 2023 11:23:16 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> This version makes it explicit that it uses libxdiff, a library which is
> not maintained upstream since 2008.  It now have numerous forks, none of
> them sticking out.  For now, use the one which is bundled in the libgit2
> sources.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> v2: add sob and next prefix
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
