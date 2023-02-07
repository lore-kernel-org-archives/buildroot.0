Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E16CC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 20:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5D940992;
	Tue,  7 Feb 2023 20:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5D940992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvtHFssNzL83; Tue,  7 Feb 2023 20:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E45F409F2;
	Tue,  7 Feb 2023 20:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E45F409F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE8C61BF31D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8C1281458
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8C1281458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MdLvN-ltyiF for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 20:05:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29EEE812C2
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29EEE812C2
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 20:05:21 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pPUDO-0002Fo-SK;
 Tue, 07 Feb 2023 20:05:18 +0000
Date: Tue, 7 Feb 2023 20:05:17 +0000
From: John Keeping <john@metanate.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <Y+Ku/Thi5kKP4P8E@donbot>
References: <20230206162617.1907911-1-john@metanate.com>
 <20230207135503.GF4124@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207135503.GF4124@scaer>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=ZIRSRkCBQNSIyGUMLIoOBolWkOsTbTa/TDmxEr3OnLA=; b=iYlB3
 nYjQs45O35brRMVfNm3nITghL7hCjW1XiZgUWoNx4Dus8l0wR7ld6bJHBXWSIiN6GhFEGSQh3uUpD
 iZG4TEGBD9RmZKMmHijA2rqoecLUEQRp8yXNO9rx056MnPxilmAkY7Lzchh0P4TPUrye9ge41zWEn
 5g25QWNlfuRxuSShuc31U1EXC0k25/Wa2cL2dQzIaxtkJ6kvLN6ab4v+VFudKVt4SYn8SZB2E9sih
 HiksnzyASldXi3lLSeECS7AUZcz/2LXDHqviRckqf/Sk8+nd1MusZKXSs+Ua3s5vfoUz3P8o0mmNh
 de9EK8/6ffzH26d6GCS3yXltmqTqw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=iYlB3nYj
Subject: Re: [Buildroot] [PATCH] package/gcc/gcc-final: map debug prefix
 when reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, Feb 07, 2023 at 02:55:03PM +0100, Yann E. MORIN wrote:
> On 2023-02-06 16:26 +0000, John Keeping spake thusly:
> > When building with BR2_REPRODUCIBLE the toolchain wrapper passes
> > -fdebug-prefix-map for all packages that are built.  But this doesn't
> > affect the target libraries (like libgcc) built by GCC's build system.
> > 
> > GCC 4.3 added a configure option to set the debug prefix map for these
> > libraries, which is used here to avoid encoding potentially
> > non-reproducible build paths into the debug data.
> 
> Thanks, this is indeed very interesting. We (briefly) discussed this at
> the developers day minutes ago, and the question that was brought up
> was: why is not needed for the first-stage compiler?
> 
> Indeed, the first-stage compiler builds objects files that are then used
> by the C library, we would expect the debug symbols for those to also
> need prefix mapping.
> 
> Could you look into that, and either pass the option to both the initial
> and final gcc if needed, or explain in the commit log why it is not
> needed for the initial gcc, please?

I've just sent v2 which moves this to HOST_GCC_COMMON_CONF_OPTS.

You're right that some files are affected by the initial compiler - I
missed it by focusing on executables (nearly all of which link libgcc.a)
when the initial compiler only affects some of glibc's shared objects.

I've been testing this with --enable-linker-build-id in the configure
options as well to see whether it's possible to enable build IDs for
reproducible builds and this change gets a lot closer - the differences
are now a handful of files that embed an RPATH pointing to .libs during
the build.


John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
