Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E76C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C856281842;
	Wed, 20 Jul 2022 21:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C856281842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtBdwWtA8bAo; Wed, 20 Jul 2022 21:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35413817AB;
	Wed, 20 Jul 2022 21:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35413817AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7DE1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D036817AB
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D036817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjLdZPmDZIDk for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:52:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E51817A6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34E51817A6
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:52:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CDD120002;
 Wed, 20 Jul 2022 21:52:45 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:52:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220720235244.107aee5f@windsurf>
In-Reply-To: <20220615022348.914136-1-james.hilliard1@gmail.com>
References: <20220615022348.914136-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658353966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+0T8vHjSHOP/vh/aDcbCoyxDGxtFbzA5gnApvP0PfE=;
 b=YASPfMOjlfaUeSKuuHfjMHur5JOoAGgahWkGE+Yv0IOW+OkAZ28Faa3A7J+6xrx8bxYiPA
 pJqpuoRh6gQtmQinKcVS4QA4JwB7q4nqyXCTLcFgp4/hYZK1WCgf1j03C8TvMucJaWmnKJ
 0OMkmtJT+9zpSo8NMjDQmqp6Zf1M75r9QFqq3cI8KKjouS1UQ/68CKwU0oqQDzBOdvhdYz
 hmLgHGLpgHoU/YlGaUfprrafH0xc+nlaIYmiyLghcb8raN1ulbD19LVRNZ5Kg3agYa+6ju
 VWowcvW1r3Y07f2BGzjKrUkcpeIsxK1VsifNHbXWnp/A8xzP6S3f1cufcPxo9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YASPfMOj
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Jun 2022 20:23:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Contains various fixes some of which may effect pthread fork handling.
> 
> Add patch reverting a commit breaking builds.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - revert a commit breaking build
> ---
>  ...lement-a-useful-version-of-_startup_.patch | 132 ++++++++++++++++++
>  package/glibc/glibc.hash                      |   2 +-
>  package/glibc/glibc.mk                        |   2 +-
>  package/localedef/localedef.mk                |   2 +-
>  4 files changed, 135 insertions(+), 3 deletions(-)
>  create mode 100644 package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch

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
