Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CFC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63A5441597;
	Tue,  6 Feb 2024 15:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A5441597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFBc0q4BkRzg; Tue,  6 Feb 2024 15:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B48E41590;
	Tue,  6 Feb 2024 15:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B48E41590
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90FE41BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69BED41EBE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69BED41EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dB-XBMpufAqx for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4491941F8C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4491941F8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D8020009;
 Tue,  6 Feb 2024 15:21:30 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:21:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162129.2286080a@windsurf>
In-Reply-To: <20240110053449.1157385-1-james.hilliard1@gmail.com>
References: <20240110053449.1157385-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ly538TUTNhnxE/ZJ3/xrKHEULD5nYUN1MiJl1NWEDg0=;
 b=dnBwP53efV2DHA/Qe0HjK9yt8pYTrViNrAiGeTh4Ti9F+67oc43RO24doc8I22lNRZU75F
 clQWfdbeMT6yFpYfzeMxJm4LA6gmseWvWc7AnCGtNt/GvERBlV+9Hol5sDzLvRt409FxJb
 PllVHf5EF/sTDi4l+IegfzifKXEtLASPX2f9RsJavu3RnHXxFiShAPoWj12rsDtBBcv232
 Y8b4+OocjH8il8xVXekDUzY0eG0eO2XwppxegVtAxzYfRY5ioXr5K8D9flVV7SLAq3ima5
 tKvEFxK2IHqQd9xlJCGNnkmDqlzNuXb5Zm4y5oTc0275eXJ2mT7V6NXT2+bP9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dnBwP53e
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to
 version 0.21.0
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
Cc: Christian Kellermann <christian.kellermann@solectrix.de>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:34:49 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to year update:
> https://github.com/codedstructure/pylibftdi/commit/c96231bb8134a2afeb0b77c12474b97a3355d2dc
> 
> Fixup patch so that it applies against 0.21.0.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-do-not-use-find-library.patch            | 15 ++++++++-------
>  package/python-pylibftdi/python-pylibftdi.hash    |  6 +++---
>  package/python-pylibftdi/python-pylibftdi.mk      |  4 ++--
>  3 files changed, 13 insertions(+), 12 deletions(-)

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
