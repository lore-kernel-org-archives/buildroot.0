Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C81C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C854183A;
	Tue,  7 Feb 2023 22:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C854183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BffyNkuXGSj8; Tue,  7 Feb 2023 22:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCCF41802;
	Tue,  7 Feb 2023 22:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DCCF41802
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 050F61BF955
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D26A481D47
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D26A481D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6RaRJ_KG_Zr for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:15:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A355E81D65
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A355E81D65
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:15:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FCC0E0002;
 Tue,  7 Feb 2023 22:15:17 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:15:16 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230207231516.2a8c962e@windsurf>
In-Reply-To: <20230113210753.23966-1-bernd.kuhls@t-online.de>
References: <20230113210753.23966-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675808117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHKsh212gRfpeb2BDZr80MAntRf4x1Ah/dX5WgAGG5A=;
 b=YGkGB5bDprWuJDBHR/aMFTgOvRyQ+DpPxjS5DmlQBu7OCNGXSTsNgL30R6snBqb5cFdq4I
 PDb4ZesruCc5GIdlB0qg+qfFxTWTTIaL3xk/EhlfiCVOeUodW3AQVy6N9hOVtG9V6HT/lg
 fMwTdB4OZ/HdajFKXvuk8hmaKnE5SWGk8Kip1HdjalXDaZVG10Ay0m1G1Kz4yNX2ZDQIDd
 ID0bla4qjI+HuPYoAeoZXgVxRzy37QmP4OXM89H8A0V4+rC4P6g2bipNTbCZNHdAKba/X3
 ODGW8iRTsvRakUFrzB5a0cRlRN2SZZgE9Jw5W1m34OTkL13k2zrm1E4ol2QLaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YGkGB5bD
Subject: Re: [Buildroot] [PATCH v2 1/1] package/perl-mail-dkim: bump version
 to 1.20220520
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

On Fri, 13 Jan 2023 22:07:53 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed hash file (Peter)

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
