Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD2CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDAC60F90
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FDAC60F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E50180F94;
	Wed,  3 Nov 2021 17:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSbuNhURxmHi; Wed,  3 Nov 2021 17:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B936080F8D;
	Wed,  3 Nov 2021 17:52:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5381E1BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C5D80F8D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0u5QLu7-g5wr for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B40280F86
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:52:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9188A1C0004;
 Wed,  3 Nov 2021 17:52:40 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:52:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20211103185239.67dc1d6d@windsurf>
In-Reply-To: <20211102212801.174162-1-texier.pj2@gmail.com>
References: <20211102212801.174162-1-texier.pj2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 7dbfffa
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

On Tue,  2 Nov 2021 22:28:01 +0100
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> This includes the following changes:
> 
> 7dbfffa Fix parsing multiple .flags variables
> de31f3d Add REUSE badge
> 6390c1c Make libubootenv REUSE compliant
> 0573071 doxygen: fix libuboot_open/close return value description
> 0d12468 Add documentation for the configuration file
> b1178c1 Add configuration for disabling MTD lock
> 5dadcb3 main: Remove duplicated code about '=' in variable name.
> e085e37 libubootenv: Forbid to give empty variable name to fw_setenv.
> 42f919e main: Check libuboot_set_env() result.
> 1bc91d1 CI: add gitlab config
> 
> License update details: see commit 6390c1c ("Make libubootenv REUSE
> compliant") in [0]
> 
> [0] - https://github.com/sbabic/libubootenv/commit/6390c1c26a816a96c9a72588679df3b9445dc192
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  package/libubootenv/libubootenv.hash |  6 ++++--
>  package/libubootenv/libubootenv.mk   | 11 +++++++----
>  2 files changed, 11 insertions(+), 6 deletions(-)

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
