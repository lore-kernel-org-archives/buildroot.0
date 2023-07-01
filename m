Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4427CEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A621160E3C;
	Sat,  1 Jul 2023 14:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A621160E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUoIBYICfBwP; Sat,  1 Jul 2023 14:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5CAD60E15;
	Sat,  1 Jul 2023 14:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5CAD60E15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2109A1BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E64FA40003
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64FA40003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTj-c8YblzuE for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:00:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA7D940A75
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA7D940A75
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:00:18 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 666381C000A;
 Sat,  1 Jul 2023 14:00:15 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:00:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701160014.21c89a3b@windsurf>
In-Reply-To: <20230628151320.554700-1-bernd@kuhls.net>
References: <20230628151320.554700-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/8gll+6fmpTaewWSr+r5JniSHWZlXgPRDeQPeFRjcc=;
 b=O7VyDnCbOB77oUCtI5ijjMcNdykHtbUY48Edy0ZbhhPS8t4uemC5LRUkyOEJYYsGjMTqLL
 n1EVnCEZQ4ixIhQtEzDxmlBA0mr9/+CDHCd53r9PhuNszS55sXq5fxF5H2KoRsJNErr051
 nBjyrUUjoGCNo5SDvxyaW6wfOAA3m3fuv1iDnWM11Zp6Q1S0uiI06o2xh+nnKXQXo7eE3x
 SUma/bmd4G8po6G0Ib37BYI4ijyJqyu0ANVkOiBkxCt43MJVb/pxQJBB2G9vM03P5oa0J6
 vTnj+Z93/8l59n3MsL9XXy0YWDyqSlfQYsDwUYWB8o0+l5OEoOpPMgDXMjp6vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O7VyDnCb
Subject: Re: [Buildroot] [PATCH 1/2] package/libmd: bump version to 1.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Jun 2023 17:13:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://archive.hadrons.org/software/libmd/libmd-1.1.0.announce
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libmd/libmd.hash | 5 +++--
>  package/libmd/libmd.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
