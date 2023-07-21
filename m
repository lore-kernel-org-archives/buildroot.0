Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDACC001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74ED683506;
	Fri, 21 Jul 2023 21:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74ED683506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haRv04Z0WeCy; Fri, 21 Jul 2023 21:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A907D83A0C;
	Fri, 21 Jul 2023 21:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A907D83A0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00E6B1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCE541C60
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCE541C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuqgTss8kccC for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:35:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7732A41BEC
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7732A41BEC
Received: by mail.gandi.net (Postfix) with ESMTPSA id C55B5240002;
 Fri, 21 Jul 2023 21:35:56 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:35:55 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230721233555.1f787b7a@windsurf>
In-Reply-To: <20230717174840.56674-1-ju.o@free.fr>
References: <20230717174840.56674-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689975357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKEEdyGwTyBFuihVf70158FYoUQyAcgmrv8RfJB02qw=;
 b=XbFKYaAQzGKTtcjE4YyBsbqQME0F7qD+G5RHAPyUaI4QX/1CghS8zr4uwilgZuTYNXWfce
 YtQX4t4Ce9xYdq8szmgTF0lAqw6WwFrP4OB2FvjqeGIhgBbm+64EHO6aZuiN90Lherc7+1
 tYBo611VbfPxhHI955ev1lp6TE5rX629BkWiv+aUwEYtttLUBWErn0rYPr4Dc4nauORNmb
 sM7GXsyFsa+Tfz1aMzL7/6Nt1MVJiOryolAFu+c8taZzUlSdTlexGvwiG+HwqjHSC5T5N6
 IT3bYJELnJ0YaLQbguyJl1QZROxraL4gtl7LOLj2H4PmpJ5BYWWCq3mSwXvqUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XbFKYaAQ
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_gawk.py: new runtime test
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

On Mon, 17 Jul 2023 19:48:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |   1 +
>  support/testing/tests/package/test_gawk.py | 120 +++++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 support/testing/tests/package/test_gawk.py

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
