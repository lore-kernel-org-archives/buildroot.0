Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCB3C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47439408FB;
	Tue,  2 Jan 2024 08:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47439408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grLDr9HvLOk5; Tue,  2 Jan 2024 08:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F11D4058C;
	Tue,  2 Jan 2024 08:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F11D4058C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E24DB1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B912E40360
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B912E40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swU9WrUFYCzy for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A53D4020B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A53D4020B
Received: by mail.gandi.net (Postfix) with ESMTPSA id B01824000A;
 Tue,  2 Jan 2024 08:52:18 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:52:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095218.4a6166fa@windsurf>
In-Reply-To: <20240101220213.6175-1-fontaine.fabrice@gmail.com>
References: <20240101220213.6175-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33O0WYKF+n8vkqwqDkdX898Qe31gqVS5N50bvxCzFYw=;
 b=XMcuykMzwHd9QSpJVTQV2hQJuWjk0WbakmaoWpDfAkPxwuEcLpSbsrNukmRj3GKRwPfkdL
 ujB9KdXucNhUtU7YwAm59jEw0JTctutPTJu9Z23fUQtka9lUCkkNA2mOeIrbcq2k6Ib2gE
 BdgnzosRMtsgB7weepodupYM85l3x1MdvdVg8aEmKZJbttPUMsZGGV91tMGavEohfEszEh
 0vjIRlRRMcJvksv1RdFmj5buynJT0RSY4CNljiMbiZj1pZgfi8mj1CV8dJYsFkqAMkJXLi
 PThfHAT8Nt+Y0KtmAWiL/rFFf/ja1wQPqCqUMjO9gEUdJYKSNJ718jmSQ9xLsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XMcuykMz
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyssh: security bump to
 version 20240101
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jan 2024 23:02:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - License changed from public domain to CC0:
>   https://github.com/janmojzis/tinyssh/commit/39dfb96613660d67ced44cc3995a08797e6c999a
> - Mitigates CVE-2023-48795:
>   https://github.com/advisories/GHSA-45x7-px36-x8w8
> 
> https://github.com/janmojzis/tinyssh/releases/tag/20230101
> https://github.com/janmojzis/tinyssh/releases/tag/20240101
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tinyssh/tinyssh.hash | 4 ++--
>  package/tinyssh/tinyssh.mk   | 4 ++--
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
