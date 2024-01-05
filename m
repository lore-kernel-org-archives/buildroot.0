Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C7C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6082B43737;
	Fri,  5 Jan 2024 12:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6082B43737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBvNlIAjqm8g; Fri,  5 Jan 2024 12:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C19A4374F;
	Fri,  5 Jan 2024 12:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C19A4374F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8D691BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8318F435DF
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8318F435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DS7_w7A1qzOu for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4836343724
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4836343724
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADA012000B;
 Fri,  5 Jan 2024 12:54:27 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135359.62288323@windsurf>
In-Reply-To: <20240102230409.2560737-1-fontaine.fabrice@gmail.com>
References: <20240102230409.2560737-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8m28+flAm8n1FTMRbERCGvEaBcxh6DzrcIJ3b3u2bo=;
 b=mvsr1W4QPSSqq3Es8SbOaAOxQ7PBxakXNaJdeeaJLJ+wLXK2MNIcwin37qET+jz58i//eY
 0aNHgjfoqDmPNshRJtOwG8Ae6n8Sc+VXdYE+jRuBd7uk3k2ZSW7FQqlHvv0ADzykjSM3zf
 e228TiaG9+kyu4mMjn8HT0yEmh5UTpZ/TGM+xkGHm0azWM2ApjRG2Grz7SeKHjAQoCJN28
 ++1v+3ShPKv50WuOGeuZNtcoc+GXT+uINkp0o2h8b5EtzGVEYPs6nqQhcGeumDE9j78Ty5
 Xsb+OjoXkjNl2RKhMXVc8RAUWRi9KU8BmOMM3nyecdOmW7+BNZihQGGqSHcbWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mvsr1W4Q
Subject: Re: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.8.5
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

On Wed,  3 Jan 2024 00:04:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to tar.gz tarball as tar.bz2 is not available anymore
> - License is GPL-3.0+ since
>   https://codeberg.org/a-j-wood/pv/commit/e5cc71b4d22bd018fa55b8e7c795c7bf94776b2d
> - workarounds can be dropped as standard gnu automake is used since
>   https://codeberg.org/a-j-wood/pv/commit/e99548ea8a2b1dd4e163036cabf4e26c40fe5170
> 
> https://codeberg.org/a-j-wood/pv/src/tag/v1.8.5/docs/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pv/pv.hash |  4 ++--
>  package/pv/pv.mk   | 24 +++---------------------
>  2 files changed, 5 insertions(+), 23 deletions(-)

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
