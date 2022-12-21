Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75433C10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE0AC40516;
	Wed, 21 Dec 2022 17:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0AC40516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H51-PWmp4vhv; Wed, 21 Dec 2022 17:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1FE9404A3;
	Wed, 21 Dec 2022 17:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1FE9404A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 386A81BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20EB761078
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20EB761078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNpklqg1TEkm for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:18:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F397361059
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F397361059
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:18:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDA2DE0008;
 Wed, 21 Dec 2022 17:17:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p82j8-0028JM-SX; Wed, 21 Dec 2022 18:17:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221211152153.1833386-1-giulio.benetti@benettiengineering.com>
 <20221211215429.22afbcbe@windsurf>
Date: Wed, 21 Dec 2022 18:17:58 +0100
In-Reply-To: <20221211215429.22afbcbe@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 11 Dec 2022 21:54:29 +0100")
Message-ID: <87bknwptfd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to latest version
 to build with Linux version up to 6.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Giulio,
 > On Sun, 11 Dec 2022 16:21:53 +0100
 > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

 >> Add pending patches upstream[0] to fix build failure. Patches fix build
 >> failure with Aarch64 and Linux 5.18/5.19/6.0
 >> 
 >> [0]: https://github.com/bootlin/mali-driver/pull/4
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/6f073fea149533a294dd838ce8373185236fe1d4/
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 >> ---
 >> ...ernel.h-fix-build-failure-on-aarch64.patch | 54 +++++++++++++++++++
 >> ...ence.c-fix-build-failure-on-dma_resv.patch | 53 ++++++++++++++++++
 >> ...ence.c-add-local-dma_resv_reserve_sh.patch | 38 +++++++++++++
 >> ...ence.c-add-local-dma_resv_add_shared.patch | 43 +++++++++++++++
 >> ...ild-failure-with-Linux-version-6.0.0.patch | 49 +++++++++++++++++
 >> 5 files changed, 237 insertions(+)
 >> create mode 100644 package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch
 >> create mode 100644 package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch
 >> create mode 100644 package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch
 >> create mode 100644 package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch
 >> create mode 100644 package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch

 > I have applied, but what I did is that I merged your pull request in
 > the mali-driver project, and then turn this Buildroot change into a
 > simpler version bump.

 > Also, while at it, I granted you maintainer rights to the
 > github.com/bootlin/mali-driver repo so that you can directly push
 > things there: you're de facto the person looking into this currently!

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
