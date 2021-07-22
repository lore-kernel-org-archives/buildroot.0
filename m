Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B26C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5792C60EB3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5792C60EB3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2514440323;
	Thu, 22 Jul 2021 21:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zivZ0RoVO38w; Thu, 22 Jul 2021 21:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478D3402BB;
	Thu, 22 Jul 2021 21:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6EF1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A23A605D5
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQYh0tykSaFg for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E21C2600BA
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:09:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CA065E0005;
 Thu, 22 Jul 2021 21:09:25 +0000 (UTC)
Date: Thu, 22 Jul 2021 23:09:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20210722230924.08de07fa@windsurf>
In-Reply-To: <20210603184846.25146-1-texier.pj2@gmail.com>
References: <20210603184846.25146-1-texier.pj2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: bump to version 5.59
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu,  3 Jun 2021 20:48:46 +0200
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> This release includes the following changes:
> 
> - Security bugfixes
>   OpenSSL DLLs updated to version 1.1.1k.
> - New features
>   Client-side "protocol = ldap" support (thx to Bart Dopheide and Seth Grover).
> - Bugfixes
>   The test suite fixed not to require external connectivity.
>   Fixed paths in generated manuals (thx to Tatsuki Makino).
>   Fixed configuration reload when compression is used.
>   Fixed compilation with early releases of OpenSSL 1.1.1.
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  package/stunnel/stunnel.hash | 4 ++--
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
