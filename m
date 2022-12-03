Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E83C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88EFD40122;
	Sat,  3 Dec 2022 14:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88EFD40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfAS0o0g_HPB; Sat,  3 Dec 2022 14:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE5C640102;
	Sat,  3 Dec 2022 14:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5C640102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4B391BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D2A040102
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2A040102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hZf7OVCNuTe for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E4E400E2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89E4E400E2
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:45:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 291F86000A;
 Sat,  3 Dec 2022 14:45:14 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:45:11 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221203154511.120d233d@windsurf>
In-Reply-To: <20221202191520.2074994-1-peter@korsgaard.com>
References: <20221202191520.2074994-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670078715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFhGNfuC47xh7/SSOr1HNY97hrqPMIz/WideejR9/J0=;
 b=lnpTnhJQofdbaR15uXKvR7l8V20vrvnD1dSws41EzgRViwZdLIqlxlQAANY3BwtYHI0lPM
 HWT/ufT1vpugDb+TiJJ8BzewF6NOfF8b3HK01YVlTcaORI8mZvbEfpbtHHvrofo4KyF6I3
 AwJ8Z2p4Ji4bXN+VhVBoQJhcdwAlma/s4+XC1h3WSZVcN4+tkjWoDtsfJud5x0Vm5Uj5Ca
 dVslJisUkAQ2nCaI7H55tFJnnoxAOEjIBFprN5ZoJLYQagqztyB8b1v5Hwfj48yaq84NIa
 lIJgcGt2oxmA4OKz1DgFJh3pEUbOl4fAIMH6ualJMn+fnPLLaH+KTxGNjprueA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lnpTnhJQ
Subject: Re: [Buildroot] [PATCH] package/rabbitmq-server: drop package
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
Cc: Frank Vanbever <frank.vanbever@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Dec 2022 20:15:19 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> The packaged version has a number of security issues, newer versions require
> erlang 23+ and nobody has stepped up to maintain it since the issues were
> reported:
> 
> http://lists.busybox.net/pipermail/buildroot/2022-November/656230.html
> 
> So drop the package and add legacy handling for it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                              |  7 ++
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  package/rabbitmq-server/Config.in             | 14 ----
>  package/rabbitmq-server/S50rabbitmq-server    | 30 --------
>  package/rabbitmq-server/rabbitmq-server.hash  | 25 -------
>  package/rabbitmq-server/rabbitmq-server.mk    | 69 -------------------
>  .../rabbitmq-server/rabbitmq-server.service   | 16 -----
>  8 files changed, 7 insertions(+), 156 deletions(-)
>  delete mode 100644 package/rabbitmq-server/Config.in
>  delete mode 100644 package/rabbitmq-server/S50rabbitmq-server
>  delete mode 100644 package/rabbitmq-server/rabbitmq-server.hash
>  delete mode 100644 package/rabbitmq-server/rabbitmq-server.mk
>  delete mode 100644 package/rabbitmq-server/rabbitmq-server.service

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
