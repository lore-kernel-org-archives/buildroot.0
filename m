Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D437C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 155598143D;
	Sun, 13 Nov 2022 21:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155598143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4fBbJtnihyz; Sun, 13 Nov 2022 21:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474CF81424;
	Sun, 13 Nov 2022 21:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474CF81424
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABB9B1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86D5360BEA
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D5360BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6pEtPycoZXi for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:52:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6776260BDD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6776260BDD
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:52:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAAFEE0002;
 Sun, 13 Nov 2022 21:52:42 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:52:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221113225241.7e78bd5a@windsurf>
In-Reply-To: <20221108175129.727174-1-fontaine.fabrice@gmail.com>
References: <20221108175129.727174-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcQhwz2zpukhE4r63KzUSBq1TUd6DXDrFOSnGPKf9X0=;
 b=E880lkCp3ra+OqdG/5iBhO9+0TH7ULH8Y7PLeF88IxDCXc8gx9sn2igchqNMV+HgVgd6k8
 16iARC/LrmizOent1S6ItG2sSR2A0xjEqXwU4uVyI/jyu9zdorkBTpITxUZ0TsGLq1MZl2
 ISo8GMpqnVQ+tiSeGgfaPICl9IEicD0m9YopKzIV6zj1sKi9dBBJYxIpt/ECf+og3rYgXY
 Cwc7jm5JTIjbSSOTZSJg51sZqSeAYL87OzEvK+E1LqDORVPxdht9jgfilhShSvRHqoqdGt
 RmeO1d54lvjPHegELPx9V9AtaO/6ueL1V1Yjd/hitEpB0Kg7p9DNGhQNtC2YsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E880lkCp
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump to
 version 1.93_01
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Nov 2022 18:51:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh patch
> - Drop -lz from Makefile with libressl as this is the only solution for
>   now: https://github.com/radiator-software/p5-net-ssleay/issues/399
> - License has been clarified to be Artistic-2.0 since version 1.86.11:
>   https://github.com/radiator-software/p5-net-ssleay/commit/aa4a0206d6d2a5ac2998dd9d6a8c5b88902c04de
> - This bump will fix the following build failure with libressl:
> 
>   In file included from /home/autobuild/autobuild/instance-11/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/perl5/5.34.1/armeb-linux/CORE/perl.h:5748,
>                    from SSLeay.xs:141:
>   SSLeay.xs: In function 'XS_Net__SSLeay_SESSION_get_master_key':
>   SSLeay.xs:5569:37: error: invalid use of incomplete typedef 'SSL_SESSION' {aka 'struct ssl_session_st'}
>    5569 |      sv_setpvn(ST(0), (const char*)s->master_key, s->master_key_length);
>         |                                     ^~
> 
> https://metacpan.org/release/CHRISN/Net-SSLeay-1.93_01/changes
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/71337cc496727f2b1173c055d706c5bfc2f5d2bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-build-system.patch               | 30 +++++++++----------
>  package/perl-net-ssleay/perl-net-ssleay.hash  |  6 ++--
>  package/perl-net-ssleay/perl-net-ssleay.mk    | 13 ++++++--
>  3 files changed, 28 insertions(+), 21 deletions(-)

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
