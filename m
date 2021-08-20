Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2F8C432BE
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E9B61102
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6E9B61102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9B442517;
	Fri, 20 Aug 2021 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-_jGfM4QQm9; Fri, 20 Aug 2021 21:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3BC4254B;
	Fri, 20 Aug 2021 21:30:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77F381BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 630F981AF6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNvrggby02yy for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:30:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A9F780F4C
 for <buildroot@busybox.net>; Fri, 20 Aug 2021 21:30:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0B80B20004;
 Fri, 20 Aug 2021 21:30:02 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:30:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210820233002.6e91e05d@windsurf>
In-Reply-To: <20210820100439.273885-1-francois.perrad@gadz.org>
References: <20210820100439.273885-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libressl: always expose
 SSL_OP_NO_TLSv1_3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 20 Aug 2021 12:04:39 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Fixes the build of vsftpd 3.0.4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch

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
