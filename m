Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC5BC83F16
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B59481F2E;
	Thu, 29 Aug 2024 16:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlqB1A3rrWbj; Thu, 29 Aug 2024 16:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220C181F25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 220C181F25;
	Thu, 29 Aug 2024 16:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 641801BF27C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F09B61122
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuv-276lMsnk for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C98A760607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C98A760607
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C98A760607
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:03:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0EF94000B;
 Thu, 29 Aug 2024 16:03:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjhcO-007ViO-0a;
 Thu, 29 Aug 2024 18:03:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240721070147.54855-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Aug 2024 18:03:28 +0200
In-Reply-To: <20240721070147.54855-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jul 2024 09:01:47 +0200")
Message-ID: <87bk1b48q7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.10
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure with gcc >= 14 thanks to
 > https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=53a89bfd86fff1a00cc77cabb8457a03eaa3bc7d:

 > ../include/json_print.h: In function 'print_tv':
 > ../include/json_print.h:58:48: error: passing argument 5 of
 > 'print_color_tv' from incompatible pointer type
 > [-Wincompatible-pointer-types]
 >    58 |                                                value);                  \
 >       |                                                ^~~~~
 >       |                                                |
 >       |                                                const struct timeval *

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c47c1e13659e4bfcccd98ebd22949e9dd278079e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

> ---
 >  package/iproute2/iproute2.hash | 2 +-
 >  package/iproute2/iproute2.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
 > index a716bf75a1..0760183b9e 100644
 > --- a/package/iproute2/iproute2.hash
 > +++ b/package/iproute2/iproute2.hash
 > @@ -1,3 +1,3 @@
 >  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
 > -sha256  2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0  iproute2-6.9.0.tar.xz
 > +sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
 >  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
 > diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
 > index 525101aff1..08b890b331 100644
 > --- a/package/iproute2/iproute2.mk
 > +++ b/package/iproute2/iproute2.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -IPROUTE2_VERSION = 6.9.0
 > +IPROUTE2_VERSION = 6.10.0
 >  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 >  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 >  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
