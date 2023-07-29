Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194B4C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32F583ABE;
	Sat, 29 Jul 2023 08:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32F583ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvfD7JwKXprF; Sat, 29 Jul 2023 08:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD7B83B76;
	Sat, 29 Jul 2023 08:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD7B83B76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3811BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27C9F41960
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C9F41960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xxK-NV7CZeC for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:59:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C22CF4190C
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22CF4190C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D885D60008;
 Sat, 29 Jul 2023 08:59:35 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:59:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230729105934.098a2ade@windsurf>
In-Reply-To: <20230729065616.961984-1-james.hilliard1@gmail.com>
References: <20230729065616.961984-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFHkqeyLbnnc0Uclk85xlRE0H5djoPPJMBOGzcz5Cjg=;
 b=B+YcbMThTJoRMFWEpNnmuT1qwk+FUvRE0KsWfk/Cb33U9rsXNu2xXW3LhuCxcp5Sjh4crA
 Y2BpWP948xizjmw/OWb3q2I1ZOCdcgTkgAr5j6ZPsk8C6BML8Uii54hW6Jb0PfVqokjWX9
 VRGvJAW85GYrIfqmQabDLmZbwkwruorv/WAAwUQcp8f/K53/L+bZAtiC8bUZvdLQOKLrF0
 2NCL6BDyFVWyhIUyohLsWNop0Ff6TcQeGsEyXwIyqzHkjLnwKBby20Agy8dWUFuLOhckt+
 tL7fgmnU+JkuuSbZzF4wSxqhY1GZcRtQjf4dCcyPJCZpTEzYWbG4sNxhSOrcvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B+YcbMTh
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jul 2023 00:56:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> README.md hash changed due to syntax fix:
> https://github.com/systemd/systemd-stable/commit/49ddb4757b197b303309b0dcdfc5f858f4b8e168
> 
> Remove no longer supported/required valgrind config option.
> 
> Disable new unsupported passwdqc config option.
> 
> Disable new unsupported ukify config option.
> 
> Disable new unsupported xenctrl config option.
> 
> Update systemd-boot config options to new format.
> 
> Add new host-python-pyelftools systemd-boot dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.hash |  4 ++--
>  package/systemd/systemd.mk   | 29 ++++++++++++-----------------
>  2 files changed, 14 insertions(+), 19 deletions(-)

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
