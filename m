Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A08C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAE460FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EAE460FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1544C402D3;
	Tue, 20 Jul 2021 20:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6BbF0-zIGko; Tue, 20 Jul 2021 20:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56C08401BA;
	Tue, 20 Jul 2021 20:38:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E94191BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6032401BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 515MUb_WrBuE for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:38:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA4F64018D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:38:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0FE35E0007;
 Tue, 20 Jul 2021 20:38:16 +0000 (UTC)
Date: Tue, 20 Jul 2021 22:38:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210720223816.70d16798@windsurf>
In-Reply-To: <20210702172101.17142-1-ps.report@gmx.net>
References: <20210702172101.17142-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libdrm: bump version to 2.4.107
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720203816.Stx0so5OfKiwBBgSaJSm0ksPz--jhVo1Qi6hZH_EymM@z>

On Fri,  2 Jul 2021 19:21:01 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - update license file hash (xf86drm.c, license unrelated source code
>   changes [1], [2], [3], [4], [5])
> 
> For details see [6].
> 
> [1] https://cgit.freedesktop.org/mesa/drm/commit/?id=67e911977fbe1f444045f59028c149a04ba29566
> [2] https://cgit.freedesktop.org/mesa/drm/commit/?id=a04b674887586bf05594abaf7c55fd8d630898db
> [3] https://cgit.freedesktop.org/mesa/drm/commit/?id=99a0522aef04e08c6e0be7a7a020f12c51d24c47
> [4] https://cgit.freedesktop.org/mesa/drm/commit/?id=9ae8f17d563a81212ca2f61a3427ed559c105644
> [5] https://cgit.freedesktop.org/mesa/drm/commit/?id=65d89398081b33b7498bccaee6915e977f589ec2
> [6] https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libdrm/libdrm.hash | 8 ++++----
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
