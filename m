Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEC5C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E0E42151;
	Mon,  6 Nov 2023 22:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E0E42151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adxu66z0NAq7; Mon,  6 Nov 2023 22:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CF842161;
	Mon,  6 Nov 2023 22:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9CF842161
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78BA81BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E51542157
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E51542157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpmU6G_Wgu5p for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69DEC417D6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69DEC417D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7031760006;
 Mon,  6 Nov 2023 22:25:49 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232347.57c0892e@windsurf>
In-Reply-To: <20231105070708.2870403-1-james.hilliard1@gmail.com>
References: <20231105070708.2870403-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6C52/37751otI5m9m6sj4aj4SYrcD5rL9F1sjItULg=;
 b=AFMldPOK8EaCy8faY5NZqLUy+0bCe9Qlhv0AiViRgrLO6eRK6rfFZliJ1yD8qm6wE2q0vc
 s7fwc+Nx/dzqOTZwrUErqUgtqmmEZT4w7RmH/ixPRoZQUzWuIctI351nNmbYtBugufGrg0
 ST9dzeMH1nptRqGrIpU+wjeXHFYEVELXwIxn8E8FFa9Ptrd0lFiQQOY3Y4+wa8fhpzby+E
 awXmqYeuEIIR2XsWpv1RWd7MSvxV2Ddmd6Nc+eXvwb217Mv6q8IZI6OhbQifEJipdiJYzp
 yun8Gt+lm74vvaicN8gvz9UYKs2K6xrlkHdP5MP/sQfApMzpDQBP2jEIrFeK2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AFMldPOK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gitdb2: bump to version
 4.0.11
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:07:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-gitdb2/python-gitdb2.hash | 4 ++--
>  package/python-gitdb2/python-gitdb2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
