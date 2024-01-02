Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EBFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB21409E3;
	Tue,  2 Jan 2024 21:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB21409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1pE988zAkRM; Tue,  2 Jan 2024 21:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E513A40A70;
	Tue,  2 Jan 2024 21:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E513A40A70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA9FD1BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B12A340A70
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12A340A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcYoMpeN-0S7 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:17:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43314409E3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43314409E3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DCF160003;
 Tue,  2 Jan 2024 21:17:06 +0000 (UTC)
Date: Tue, 2 Jan 2024 22:17:05 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240102221705.4b16aec3@windsurf>
In-Reply-To: <20231224191817.9599-1-adam.duskett@amarulasolutions.com>
References: <20231224191817.9599-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704230226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E79c09VOlhde947CbIq6g1uyKZb1ELbS3dDFAQG8BJM=;
 b=oc1w4H7JbASgCy1z3dVgCP9ZJyu/wkh0hRgkfgevncwlUBakz4sXQyCKf+S/mUr0O39vhz
 2Ad9B/L42MSSzaqK+kXsGlaJXt0lFZJ7Uy+1a+itkdDzqha5UgQJVpIEj75VBfOTcz1UxJ
 eUvBVW10MhE6R4aGBD8Ll9hdGmeaKTmyr+psppcy8gOrrLfrsxLD7MbR/5vIxi6aIYwVM3
 aFrycC+DQ/sRF/MN+zzBi6Z2O+m3uUIAi3qLsa3rufJbQfkKAZQIVUgwzBZmoqH9M4K1L8
 ypznIHxU8eDelqjTmV9K858DObnP6y3UT3BCDgdr99dycInb3SGnilA69SyHiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oc1w4H7J
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: remove aduskett@gmail.com
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

Hello Adam,

On Sun, 24 Dec 2023 12:18:16 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> I will only be supporting Buildroot in a professional capacity from now on.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)

It is obviously sad to see you give up on the Buildroot work you have
been doing for many years, but as this is your call, I have of course
applied both patches to our master branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
