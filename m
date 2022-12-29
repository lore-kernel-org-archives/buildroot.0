Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADE9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1DB40578;
	Thu, 29 Dec 2022 08:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1DB40578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uPqTSVulrpE; Thu, 29 Dec 2022 08:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFF440592;
	Thu, 29 Dec 2022 08:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CFF440592
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB1C71BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B663440579
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B663440579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IN542-HR4rpC for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:54:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E94F40578
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E94F40578
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:54:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42241100005;
 Thu, 29 Dec 2022 08:54:09 +0000 (UTC)
Date: Thu, 29 Dec 2022 09:54:08 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221229095408.051db373@windsurf>
In-Reply-To: <20221212193528.23168-1-heiko.thiery@gmail.com>
References: <20221212193528.23168-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fwe1+aINqEHhMGd/R6uutRDQUL+92WEALfsRrS2EeU=;
 b=FD7y+cavTSmc95zyvxQ3dbD1KORw7NkvISM9t6xZefCbvxhAWxy1JCIcmn5ZDdyZm7twby
 VcBTe2HSEwg/N5OuHcfie4d6MmUKDGPOPprJL+zTxVaCr4LRAbW4V3pvXQGef+JSlKuXAS
 QfJvgWypiwJ+9dlrZR9tItsOh3frp+Jj8SsyCBfVOUJTy4meWQP+j5DQFsQuh20OvAQQ1O
 vWI3qScYjj4MTe24i/eaHTltnolwkBwfBEtFZtPXeTBnWFxdoInlKo1XZjavNqlVN6Un77
 0/7feWzHE4YH8rbPqXRQhgbw7UYuO08fal2WinBhdKvzL+AqhnZ7uvux3AIDrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FD7y+cav
Subject: Re: [Buildroot] [PATCH v3] package/modem-manager: bump version to
 1.20.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Dec 2022 20:35:28 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Switch package type to meson as the primary supported build system from now
> on is meson and the autotools support as despricated. The package tarball
> is no longer support, thus the MODEM_MANAGER_SOURCE is changed to the
> gitlab archive URL.
> 
> All previously supported options are converted to the meson configuraiton
> options and support for new ones is added. The new options are:
> bash_completion, polkit, systemd, qrtr.
> 
> The dbus build dependency is needed since the meson build system
> uses dbus pkg-config to determine install locations. The 'udevdir' has
> to be specified also in case dbus is not installed. Modem-manager will
> use its own built-in udev rule parser to determine modem specific values.
> 
> For building with libqmi support version 1.32.2 is required and for
> libmbim version 1.28.2 is required.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/modem-manager/Config.in          |  2 +-
>  package/modem-manager/modem-manager.hash |  2 +-
>  package/modem-manager/modem-manager.mk   | 72 ++++++++++++++++++------
>  3 files changed, 56 insertions(+), 20 deletions(-)

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
