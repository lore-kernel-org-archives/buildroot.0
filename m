Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB643C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AAA2401AD;
	Wed,  1 Nov 2023 21:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAA2401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwXB0EPS-dPh; Wed,  1 Nov 2023 21:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B56BF4313E;
	Wed,  1 Nov 2023 21:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56BF4313E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1C21BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B29A4EEBF
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B29A4EEBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIHsKKNf8wsR for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:37:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0185B400B0
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0185B400B0
Received: by mail.gandi.net (Postfix) with ESMTPSA id E408840006;
 Wed,  1 Nov 2023 21:37:00 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:36:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231101223659.3daf8e1a@windsurf>
In-Reply-To: <20231016180855.69848-1-bernd@kuhls.net>
References: <20231016180855.69848-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698874621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIEjUxjX46IvEyHzHi12/BVF1tavODY148FsoU2+wUQ=;
 b=jx5yig2SyWH8ABmsSz/yXEsZpXNhhLxBFGbPn+INMtzl4IXjyILUYim2C1kipazDvLhgp9
 sIAQrjWiEweQ8gv+QzDLhTJKj1/0VhI/0saYIup2NwNxPeCyPNYHfJb2+uktQsOlbYrzc7
 /ys3FT5BMnmyi2FWnWDdsOrWb5zmScfS7KszLYhTsuev74PLwnaEwBvnQX7osI29T12Ti/
 ytIgmexCvYZVEMXr5eAIYzj3jIBj4iryr0DrwcBnxBd6cPAuzm3WyaMmAg3vfc4wmhjJh1
 c8ZQdCua4x3oNrzkppLgOXKKIW5heZRgGen6vQeQa2+GX8rQX70/I/vdGhQsFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jx5yig2S
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.19.2
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

On Mon, 16 Oct 2023 20:08:55 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-5568:
> Heap buffer overflow with freshness tokens in the Heimdal KDC in Samba 4.19
> 
> Release notes:
> https://www.samba.org/samba/history/samba-4.19.2.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
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
