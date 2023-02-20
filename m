Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080CFC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F7F81E85;
	Mon, 20 Feb 2023 17:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F7F81E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2ijVF9sZunQ; Mon, 20 Feb 2023 17:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F21FA81DED;
	Mon, 20 Feb 2023 17:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F21FA81DED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53001BF2B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F4DE418C9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4DE418C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORpKy38CWCbt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:13:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2082417E2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2082417E2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:13:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FFA81BF206;
 Mon, 20 Feb 2023 17:13:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pU9j3-007UtM-RB; Mon, 20 Feb 2023 18:13:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230220112147.952174-1-fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 18:13:17 +0100
In-Reply-To: <20230220112147.952174-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Feb 2023 12:21:47 +0100")
Message-ID: <87mt58z2du.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rockchip-mali: needs C++
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > rockchip-mali pre-built libraries needs C++ since the addition of the
 > package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

 > readelf -a output/build/rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so|grep NEEDED
 >  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 >  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 >  0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 >  0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 >  0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 >  0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 >  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 >  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

 > While at it, add a comment when dependencies are not met

 > Fixes:
 >  - No autobuilder failures (yet), found when debugging an issue with
 >    rockchip-mali and glslsandbox-player

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
