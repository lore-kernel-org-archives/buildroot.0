Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 16:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43169408E3;
	Wed, 23 Feb 2022 16:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmqWdK8hWK7W; Wed, 23 Feb 2022 16:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12C8D4022C;
	Wed, 23 Feb 2022 16:39:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1171BF5F8
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 16:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC9A54022C
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 16:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pD2nDZtB_clU for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 16:39:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD9F540142
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=wsyvxBGhNcxbruKbulgGsJY9D3o48Wwt5sGndeNQT2Y=; b=tVPwn
 RZ7WIDELl18nTzYuOOAsvnvwPwWkR8nlxDAQA4tgmleewyBR03AKBbKWTp3UmKf2xFkpSD0c77OHm
 KxD1BCjrUZmqzLRKsm5rNJZk30uWiRRINBwfKEhnwqhpsYrAt23i2oc8BYe/WYGY+KN2owIGovQ4d
 lQ6VC4dGPxUGkXVViGUOxOjUDExvtctx6vHHeX0G+OOK1a539qSs4Pf9OpL7GvAk2zmxflFxCmT1B
 szYWNT5CrofrLhgQaZCC9C/XXj6XLjAS9LIViEYJ2iP9vqAwL6p1mnKvi+Q0rn8jRS1yla8QYYdpN
 tmgi4Jkcmnqgm1yRutvhsG7TZ1C5Q==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nMufc-000708-8E; Wed, 23 Feb 2022 16:39:16 +0000
Date: Wed, 23 Feb 2022 16:39:15 +0000
From: John Keeping <john@metanate.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YhZjM9a0Pnoqskin@donbot>
References: <20220223115506.1191031-1-john@metanate.com>
 <20220223142731.GA189337@scaer> <20220223155141.0223462b@windsurf>
 <20220223151732.GB189337@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223151732.GB189337@scaer>
X-Authenticated: YES
Subject: Re: [Buildroot] [RFC PATCH] package/libiberty: use the same version
 as binutils
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 23, 2022 at 04:17:32PM +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2022-02-23 15:51 +0100, Thomas Petazzoni spake thusly:
> > On Wed, 23 Feb 2022 15:27:31 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Although this works, this is by pure chance: binutils is included before
> > > libiberty, so BINUTILS_VERSION is defined. But we try and avoid such a
> > > situation, unless we explicitly guarantee the include ordering (eg. gcc,
> > > fftw, util-linux, or previously, qt5).
> > > Instead, in such a case, we prefer that the version strin is duplicated,
> > > and a comment added above to note that both shoujld be updated in sync.
> > > See for example bluez5_utils and bluez5_utils-headers, mesa3d and
> > > mesa3d-headers.
> > libiberty/binutils is different than mesa3d or bluez5_utils, as the
> > version is user-selectable, or even different depending on the selected
> > CPU architecture.
> 
> Right, I forgot about that... But still, I don't like that we rely on
> the implied include order here, as we try and avoid that elsewhere...
> 
> > So we would have to replicate all the version selection logic (like we
> > admittedly do for linux vs. linux-headers).
> 
> That would not be very convenient and maintainable in the long run, as
> we update binutils to newer versions with various arch support changes:
> indeed, as we can see here, we'd eventually forget to update libibert in
> sync.
> 
> Unless we move libiberty as a sub-directory in pacage/binutils/libiberty/
> (like for util-linux-libs) to make it obvious that we need to share the
> version... That'd be my favourite option.

If we're doing that, should it be in gdb instead of binutils?

The gdb and binutils source all comes from the same repository but gdb
is the one package for which we actually use host-libiberty so tying
this in to the gdb version seems more sensible than using the binutils
version.

For example, given the default versions of binutils and gdb gives:

    $ git log --left-right --oneline binutils-2_36_1...gdb-10.2-release -- libiberty/
    > f42f69f6f38 libiberty: Support the new ("v0") mangling scheme in rust-demangle
    < d750c713c9a Update libiberty with latest sources from gcc mainline
    < f9a6a8f09dc PR27116, Spelling errors found by Debian style checker
    < 250d07de5cf Update year range in copyright notice of binutils files
    < d7b477c541b Sync libiberty and include with GCC for get_DW_UT_name.

so the GDB branch has a new feature (not included in the binutils
branch) whereas binutils has some updates not included for GDB.

It's a bit of a mess, but given where we need libiberty (for
prelink-cross) and what uses the package version (host-gdb) it looks
like it would make more sense to move this to the gdb package source.

What do you think?


John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
