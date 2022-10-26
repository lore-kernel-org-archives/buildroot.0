Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14D8C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 17:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F86880FAF;
	Wed, 26 Oct 2022 17:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F86880FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IECKOm3hRc61; Wed, 26 Oct 2022 17:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB9E80C3D;
	Wed, 26 Oct 2022 17:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB9E80C3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA2601BF36F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A534D60D74
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A534D60D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSasQxhq-p0t for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 17:32:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2544605A1
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2544605A1
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:32:44 +0000 (UTC)
Received: from 1onkGc-000BnV-U8 by out3a.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1onkGh-000Bvx-T8; Wed, 26 Oct 2022 10:32:43 -0700
Received: by emcmailer; Wed, 26 Oct 2022 10:32:43 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3a.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1onkGc-000BnV-U8; Wed, 26 Oct 2022 10:32:38 -0700
Received: from tsdebian (unknown [75.164.57.7])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 863F996E2;
 Wed, 26 Oct 2022 10:32:37 -0700 (MST)
Message-ID: <1666805548.3174.1.camel@embeddedTS.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 buildroot@buildroot.org
Date: Wed, 26 Oct 2022 10:32:28 -0700
In-Reply-To: <20221026132634.999254-8-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
 <20221026132634.999254-8-giulio.benetti@benettiengineering.com>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=cGaW4Cw310skXxIwHnHn/j4qPwoxzh8EZu3EdwHS3rk=;
 b=eROcPYqBjFG6JcVtN/3t2dJc/NMkKKogtgv92wSSu1p54C/5GX2eA1tDL0nSFd3fwHN10qfFeaq/nf03Bv0lycBxI28A6s+HmaJ+wxhD1T5Ae5Cep6PFWHo2hvu9m2DeH/Osa8HSWLnxFL1rWc/XOLkGpgI3KB2lFyalKtHyVyJNFqnK/63Pq0mR0gWtksuzwBg/2WSzC/UhgsJKy+JFCyr3o81UmQWb2k+1aZMBowbiaclRS3WNrLrid+PIvyy3UwsxuM/BUJC02jEHopSzoDf7y+IegBtKM/o4zRYB1Mq6V7prus5Ssj+jGbf3FArHCmySbfXyp3B3INrbLimLDQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=eROcPYqB
Subject: Re: [Buildroot] [PATCH 7/7] package/wilc-driver: disable package
 for s390x architecture
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2022-10-26 at 15:26 +0200, Giulio Benetti wrote:
> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
> package for this architecture.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/wilc-driver/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index 7ed062bb66..7f970bd38b 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WILC_DRIVER
>  	bool "wilc kernel module"
> +	depends on !BR2_s390x
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  External kernel module for WILC1000/3000 devices.
> @@ -59,4 +60,5 @@ endif
>  endif
>  
>  comment "wilc kernel module needs a Linux kernel to be built"
> +	depends on !BR2_s390x
>  	depends on !BR2_LINUX_KERNEL

I don't know much on the s390x arch, nor Buildroot paradigms for disabling packages
per-architecture, however the change itself looks good to me.

Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
