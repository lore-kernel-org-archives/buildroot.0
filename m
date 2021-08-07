Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECEAC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 770DA610FC
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 770DA610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AC524024F;
	Sat,  7 Aug 2021 10:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPDa035cMJpR; Sat,  7 Aug 2021 10:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61D594023C;
	Sat,  7 Aug 2021 10:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0889B1BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC4EF8333F
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rot7ryJV3U45 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25EF830E2
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 10:40:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1067B20003;
 Sat,  7 Aug 2021 10:40:33 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:40:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210807124032.6f54f958@windsurf>
In-Reply-To: <20210720043607.2325813-1-francois.perrad@gadz.org>
References: <20210720043607.2325813-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/olimex/a20_olinuxino: switch to
 extlinux.conf
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
Cc: buildroot@busybox.net, Leon Anavi <leon.anavi@konsulko.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Tue, 20 Jul 2021 06:36:07 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> a10_olinuxino is not switched, so broken links are replaced by the previous content
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a10_olinuxino/boot.cmd                         | 6 +++++-
>  board/olimex/a10_olinuxino/post-build.sh                    | 4 +++-
>  board/olimex/a20_olinuxino/boot.cmd                         | 5 -----

The removal of this file has broken
configs/olimex_a20_olinuxino_micro_defconfig which still references it,
causing a build failure:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738568

Could you provide a fix for this ? (Probably restore the file ?)

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
