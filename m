Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AFEC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3C440914;
	Sat, 29 Jul 2023 20:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3C440914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IRDM91ibMBS; Sat, 29 Jul 2023 20:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8144076E;
	Sat, 29 Jul 2023 20:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8144076E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE5FD1BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA48A60D90
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA48A60D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGzqNidaACdY for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:43:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E295607E3
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E295607E3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AF9020002;
 Sat, 29 Jul 2023 20:43:22 +0000 (UTC)
Date: Sat, 29 Jul 2023 22:43:21 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230729224321.4ea90da8@windsurf>
In-Reply-To: <20230521201220.3956344-2-bernd.kuhls@t-online.de>
References: <20230521201220.3956344-1-bernd.kuhls@t-online.de>
 <20230521201220.3956344-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690663402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTunHfKyP3b9dXbFA/auzuco5pdKB0jmAiNneMn/4sw=;
 b=PsW8o1dPzWjjMR2XIRUa8Em6QfXw53r8WrklqLA2q56I+dDVYRHYMHpREy56YPqTLOG57Q
 dOVEd89+pFI1v0XaNVE3uCY5KjQ1BAZM8Bzes32CX9ssL3Wz+9P2jyLZ9ZIK69jHNny696
 jipsg3B0D/EduNLe7HbrTXNRfz93B80nymAeC+4tk0vBxWpvxgV6s5uOw3+ncELTyjJ3SE
 +YjFDQo3kYJkiGxFktIqYhLzYwzNxygffCxbz9gS/xtTVsUtVLL1vg+vGRbbEBnaX2RFJZ
 KoqwB0jXvnhId3rXoHY/cWd53gYJs25nmSosMCfVcPVVJrxFdKfUEVNJGk9OCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PsW8o1dP
Subject: Re: [Buildroot] [PATCH/next 2/2] package/waylandpp: bump version to
 1.0.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 May 2023 22:12:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://github.com/NilsBrause/waylandpp/releases
> 
> Update license hash due to copyright year bump:
> https://github.com/NilsBrause/waylandpp/commit/1ea510aabd5ba8abdb5cd30c37481595f34c366c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/waylandpp/waylandpp.hash | 4 ++--
>  package/waylandpp/waylandpp.mk   | 2 +-
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
