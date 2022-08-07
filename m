Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A846BC25B07
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 09:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443D6828DD;
	Sun,  7 Aug 2022 09:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443D6828DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8J9ewuUTni_E; Sun,  7 Aug 2022 09:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F34882883;
	Sun,  7 Aug 2022 09:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F34882883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84DA11BF83B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC65400F1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC65400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72Pc4-OFfUUL for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 09:14:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195C5400CC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 195C5400CC
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 09:14:01 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 5311124002C
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 11:13:58 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4M0ttY0HyDz6tmh;
 Sun,  7 Aug 2022 11:13:56 +0200 (CEST)
From: Dominik Michael Rauh <dmrauh@posteo.de>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 09:13:41 +0000
Message-Id: <20220807091341.10523-1-dmrauh@posteo.de>
In-Reply-To: <20220805163452.4e0d3dd4@windsurf>
References: <20220805163452.4e0d3dd4@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1659863638; bh=nmkRCrc/TTpoP2cY/W9Bajv7cHblJf+5HVN7UnxqYpg=;
 h=From:To:Cc:Subject:Date:From;
 b=XOhnLGKIleszl1yrMv5IeBw9Kw9IUvqIxQqcSXyLBRpqZ1QfYt9Zl0JNpHt6a/ynO
 Bg6DvrjTe3Wguzg3IXtWDmeo7J6j5m3Mt7MraRe1YYnDmimtS/7IVa1ppBBH9JKCBY
 m5WgsWmP8EFeEthB4lLPBoZ2TJnuy5xE49pEc9gmdPyEZqFwiZIyWlVyeYaJ33y3ac
 4+I94n7A0b+9bfqAjfcJGLn8j+6iZ2BSgUADi80bQX4s9qPCDgGT01Vi9NH5EuaBv/
 G2Vomh82Lp5g+ZX7ThgnZljNtKSNp+rN5T0ATv9eHBJHj9VAThrY4gRRLsu/Oo01VN
 os2i0BeA6/19A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=XOhnLGKI
Subject: Re: [Buildroot] [PATCH v3] package/ccache: bump version to 4.6.1
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
Cc: anders.f.bjorklund@gmail.com, andrew.smirnov@gmail.com,
 s.martin49@gmail.com, dmrauh@posteo.de, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com, thomas.de_schampheleire@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Thanks for your initial review!

I'm going to fix the two issues you have spotted in the next iteration of my
patch!

On Fri, 5 Aug 2022 16:34:52 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Just curious, what are these doing?

These two options remove the corresponding CMake CACHE entries that are set at
the beginning of "package/pkg-cmake.mk", when BR2_CCACHE=y (please also see
https://cmake.org/cmake/help/latest/prop_tgt/LANG_COMPILER_LAUNCHER.html). Thus
Buildroot is not trying to compile ccache using ccache :)

> It's really a pity that we need to disable ccache support to build
> host-cmake, because host-cmake is notoriously slow to build... But
> obviously since ccache is now using cmake as its build system, I don't
> really see a much better solution.

Yes, the more external dependencies ccache gains, the less beneficial it may
become. One could think about making ccache a "multi-stage build", where at
first, it is only compiled with all of its essential dependencies and then at a
later stage, all other dependencies are "added". But that's probably more
trouble than it's worth and certainly out of the question for CMake.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
