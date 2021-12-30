Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A0AA414A2;
	Thu, 30 Dec 2021 15:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCwZFl64u1T5; Thu, 30 Dec 2021 15:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB394410E1;
	Thu, 30 Dec 2021 15:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85ACD1BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82FC98284B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LPJnhvp0-pm for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A88E82668
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:15:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A9D89E0003;
 Thu, 30 Dec 2021 15:15:15 +0000 (UTC)
Date: Thu, 30 Dec 2021 16:15:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211230161514.54b87c2c@windsurf>
In-Reply-To: <20211230144911.2258576-1-romain.naour@gmail.com>
References: <20211230144911.2258576-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/supertuxkart: fix kconfig dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 15:49:11 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Commit 4ac4d6879b30bc267af1f1b382d9ac93f5aa1c28 (package/supertuxkart: bump to version 1.3)
> introduced a circular dependency chain in Kconfig:
> 
> package/openssl/Config.in:4:error: recursive dependency detected!
> package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_MBEDTLS
> package/mbedtls/Config.in:1:	symbol BR2_PACKAGE_MBEDTLS is selected by BR2_PACKAGE_OPENSSL
> 
> Fix by selecting openssl if mbedtls is not enabled.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/supertuxkart/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
