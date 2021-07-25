Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C39C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4339060F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4339060F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145DB40421;
	Sun, 25 Jul 2021 13:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06tkzLix-xxG; Sun, 25 Jul 2021 13:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3726040419;
	Sun, 25 Jul 2021 13:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A62A51BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F69825FE
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xorUv-SqCUb1 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85F82825C3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:10:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5DF9B1C0005;
 Sun, 25 Jul 2021 13:10:30 +0000 (UTC)
Date: Sun, 25 Jul 2021 15:10:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210725151029.4e56666e@windsurf>
In-Reply-To: <20210724201936.743014-1-fontaine.fabrice@gmail.com>
References: <20210724201936.743014-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.32
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 24 Jul 2021 22:19:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second patch (already in version)
> - Update license:
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/31d79f4c9b606218a14e4d695aaa0afb1820c9f1
> - avahi is an optional dependency since
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/6744934734f509087df769b447185b070c82b58e
> - libsub is an optional dependency since
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/5e0b63b149559154a6164dbc064aefc7e773c03a
> - pulseaudio is an optional dependency since
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/44f326013b5f5e1e858ee3788fe664f802ca2523
> - webrtc-audio-processing is an optional dependency since
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/d95870d8d3ab7fb9b91f0dbd8ae9395b1929434b
> - Fix a build failure without C++ thanks to
>   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/d95870d8d3ab7fb9b91f0dbd8ae9395b1929434b
> 
> https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/0.3.32/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/20cd863cb3c83b85900e80de02d485b780288330
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-linking-with-latomic.patch       | 108 ------------------
>  ...002-modules-fix-typo-in-module-rtkit.patch |  31 +++++
>  ...gettid-instead-of-getpid-in-fallback.patch |  28 +++++
>  ...0004-modules-improve-_gettid-wrapper.patch |  58 ++++++++++
>  package/pipewire/pipewire.hash                |   4 +-
>  package/pipewire/pipewire.mk                  |  32 +++++-
>  6 files changed, 149 insertions(+), 112 deletions(-)
>  delete mode 100644 package/pipewire/0002-fix-linking-with-latomic.patch
>  create mode 100644 package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
>  create mode 100644 package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
>  create mode 100644 package/pipewire/0004-modules-improve-_gettid-wrapper.patch

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
