Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8269C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 124D382384;
	Tue,  6 Feb 2024 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDkA8QGZ3pOA; Tue,  6 Feb 2024 12:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5608236F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5608236F;
	Tue,  6 Feb 2024 12:57:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222611BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3034611C3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3034611C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdwO_Hz4gzJi for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6FFC6113E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6FFC6113E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2021C4000B;
 Tue,  6 Feb 2024 12:57:32 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135731.27175a79@windsurf>
In-Reply-To: <20240110041930.1037925-1-james.hilliard1@gmail.com>
References: <20240110041930.1037925-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiVWXYd/+r/gW03Uz957Gp1pHMTHTbkqRt52E2H5Gwg=;
 b=QVnMpH6j68d8EwwJ0hEzMV+Dv3uOOJdvc4Te61p2DeNbUZCYGpxueJvl+1OUDKiPbUOlba
 gHdv0ObYq3KTxP6E0mfzQX0bxc7DA2MNENyq1hgvXehjGB47f5+/wQLFijVHRepCYUDiWu
 MtA8DzwTyOX8pD9/4aSPDZfEfaPZOyDqT5JuMiC8HECgg5B6ApOlJlUILBznFeDfJysnOq
 z6NcYUVQXFDXPMD4XJJmNl3kvDhWWHerUI+4OngLXORkP2jIJsTIHIQFrdwweGoZUUqx4M
 j1cy2B/DvmEixy/xBpxxwxe3odiIQRtJiRNM31J+1z1cDhXZKr2tyGU0vr4KkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QVnMpH6j
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pathspec: bump to
 version 0.12.1
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

On Tue,  9 Jan 2024 21:19:30 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to flit build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pathspec/python-pathspec.hash | 4 ++--
>  package/python-pathspec/python-pathspec.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
