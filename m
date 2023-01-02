Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF73C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 23:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7898140162;
	Mon,  2 Jan 2023 23:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7898140162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LO7ezUAOpGH8; Mon,  2 Jan 2023 23:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD6540412;
	Mon,  2 Jan 2023 23:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD6540412
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9D9E1BF397
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 23:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1ACC60F0F
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 23:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1ACC60F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3j98D0c7MmNA for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 23:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69EBC60ECD
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69EBC60ECD
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 23:52:42 +0000 (UTC)
Received: from 1pCUbe-0000eX-Uc by out3c.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1pCUbf-0000gn-VH; Mon, 02 Jan 2023 15:52:39 -0800
Received: by emcmailer; Mon, 02 Jan 2023 15:52:39 -0800
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3c.electric.net with esmtps (TLS1.2) tls TLS_DHE_RSA_WITH_SEED_CBC_SHA
 (Exim 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1pCUbe-0000eX-Uc; Mon, 02 Jan 2023 15:52:38 -0800
Received: from tsdebian (unknown [75.164.37.1])
 by mail.embeddedts.com (Postfix) with ESMTPSA id DC4AC6002;
 Mon,  2 Jan 2023 16:52:37 -0700 (MST)
Message-ID: <1672703557.3896.7.camel@embeddedTS.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 buildroot@buildroot.org
Date: Mon, 02 Jan 2023 15:52:37 -0800
In-Reply-To: <d381df43-3af6-52ec-473a-666a8cff8e01@benettiengineering.com>
References: <20221228205323.71420-1-giulio.benetti@benettiengineering.com>
 <1672687476.3896.3.camel@embeddedTS.com>
 <d381df43-3af6-52ec-473a-666a8cff8e01@benettiengineering.com>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:DHE-RSA-SEED-SHA:128
X-Authenticated_ID: 
X-VIPRE-Scanners: virus_bd;virus_clamav;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=6T7Xbt2s1OZ5xH33Oor90Yh1qih2qaPGsIQ0CBavLxU=;
 b=Rjq4C/t1GaravtrcHABxD5UqxwiZq3aL/PbtTLKG0yInEyiBnBb7/b+W12UKxduQeCDZN4lFsZBA6c2ay26qdWtcSetpI9yaUpi1YPlypur0RYnVaC8/GS+tYi2a4k4V1K8cFD9KwObAdF/lK/4M8rQc0wivi5sNFgyD8xOZ42k+5QC/QCEWclRMPA6vZ7OzLeIIRybTAFbEtnclFVJ20fbGH2J4BRmjo2UWI5fHF8xLfa1zl68MbiaJEIaNho+a+AipPxRXP3xWbWKuA/iSpJ7DWgF62fe6UUkyAjeFevhw3WLnYoez9JEC9aokVOo+Gvypw6lhQF9bv1LrszsZjQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=Rjq4C/t1
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio,

On Tue, 2023-01-03 at 00:05 +0100, Giulio Benetti wrote:
> Hi Kris, Thomas, All,
> 
> On 02/01/23 20:24, Kris Bahnsen wrote:
> > On Wed, 2022-12-28 at 21:53 +0100, Giulio Benetti wrote:
> > > Add patches pending upstream[0] to handle various data types and api
> > > changes up to Linux 6.1.
> > > 
> > > [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/2
> > > 
> > > Fixes:
> > > http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa
> > > 
> > > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > ---
> > >   ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 +++
> > >   ...fix-build-failure-on-remove-callback.patch |  44 ++++
> > >   ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 ++++++++
> > >   ...on_parameters-Linux-6.1-build-failur.patch | 216 ++++++++++++++++++
> > >   4 files changed, 392 insertions(+)
> > >   create mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
> > >   create mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
> > >   create mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
> > >   create mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
> > > 
> > 
> > Giulio, all,
> > 
> > I figure this is the most appropriate place to have a discussion on
> > this topic as these patches were also pushed to our github repo:
> > https://github.com/embeddedTS/wilc3000-external-module/
> > 
> > I want to note that we are not intending on doing any maintenance
> > or patch work on this driver, except to keep this driver functional
> > on our platforms. 
> 
> Oh, I thought the goal was to keep the module successfully building
> through all Linux versions like we usually have in Buildroot for other
> packages. For example all the Wi-Fi modules(i.e. rtlxxx packages) and
> gpu(mali-driver, sunxi-mali-utgard, kernel-module-imx-gpu-viv etc.) or 
> other out of tree drivers.

Not quite. We decided to carve the tree from Microchip and make it
externally buildable. We submitted it to Buildroot because it had
appeared that the WILC support was neglected by Microchip. We took
that opportunity to at least keep the firmware up to date while also
giving any supported platforms a more up-to-date access to a driver.

We've been mostly relying on upstream from Microchip (and have an
outstanding driver bug open with them for the WILC3000 that has
been in process for the better part of 4 months) and touching bits
that make sense to touch that do not impact function.

> 
> > It is maintained as a buildable external module
> > of this folder tree:
> > https://github.com/linux4sam/linux-at91/tree/master/drivers/net/wireless/microchip
> 
> The problem is that with that we can't build for older Linux versions
> and this is one of our goals. Someone can be interested in having it
> running on Linux 4.x or earlier.

Which is why we havn't pulled in their latest round of changes
and any feature updates from them we now have to carefully navigate.

> 
> > We did this because during the Microchip takeover they abandoned
> > their maintained external tree as well as halted any plans to
> > bring WILC3000 support to the kernel upstream. Our fork gives us
> > easy access to building the modules without having to keep pulling
> > changes in to all of our kernels.
> > 
> > I'm not sure the best way to go about handling these patches as
> > Microchip is currently only maintaining support for 5.15 it
> > appears. I also don't want to pollute our external module tree
> > with fixes that arn't in the upstream we're pulling in.
> > 
> > Giulio, would you be willing to attempt pushing these changes
> > to the Microchip repo?
> 
> Yes, this is the idea once they create the 6.1 branch, at least I
> expect they will do it soon since it's the new Linux LTS version.
> Then for sure I will open a PR without all the #ifdef's I've created
> in the PR I've opened to your Repo. Of course those patches will be
> usable only for Linux 6.1 and that's it.

If we pull future patches in from linux4wilc tree, we will be careful
not to upset the existing #ifdef madness to keep backward compatible
support. But we do want to avoid getting ahead of linux4wilc if we
can so if those changes do come in eventually, we can avoid an
excessive amount of conflicts.

> 
> > Does it make more sense to just leave these as patches to the
> > driver in Buildroot?
> 
> Not very much, because they must be reworked over the time and they
> will continue to increase along with Linux versions. For sure we hope
> WILC1000/3000 will be totally upstreamed at a certain point. But anyway
> we will need your repository(or a fork of it) to keep all the #ifdef's
> for LINUX_VERSION to support it on old Linux versions.

Unfortunately, while WILC1000 support is upstream, WILC3000 will not be
upstreamed (according to a conversation with Microchip a few months
back). This means unless they have a change of heart, someone else takes
ownership, or we take ownership of the driver, it will likely remain
locked to Microchip's kernel and this external module will continue
to exist as needed.

> 
> > Would it make sense to instead apply some limits to the package
> > or external module to only build on already compatible kernel
> > versions?
> 
> I'd like to support the driver for any possible Linux version like we
> do for the other drivers in Buildroot.
> 
> I understand that there is an effort on your side to test the changes
> you pull, but this will keep your repository aligned with the latest
> Linux versions and it will be build-tested a lot with our autobuilders.
> 
> This is my 2 cents. I leave the last answers to the maintainers, Thomas
> is one of them.

We're not opposed to the idea, just hesitant to taking on that kind
of ownership.

We're doing some porting work at the moment, to get our LTS platforms
all up to kernel 5.10. From there, we may start pushing basic support
for various platforms to upstream kernel. I think once we get there
we would be more receptive to ownership of the WILC3000 driver to
keep our platforms running.

> 
> Best regards!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
