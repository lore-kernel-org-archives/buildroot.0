Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE3AC4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526F8402BC;
	Sun,  1 Jan 2023 18:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526F8402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xovcgszg3_xC; Sun,  1 Jan 2023 18:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A00CF400D2;
	Sun,  1 Jan 2023 18:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00CF400D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75DF71BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F4A605A4
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F4A605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biPEqp42_R-p for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:18:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2510160590
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2510160590
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:18:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EFBC3E0004;
 Sun,  1 Jan 2023 18:18:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pC2uw-000m6w-2a; Sun, 01 Jan 2023 19:18:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221226211910.552376-1-fontaine.fabrice@gmail.com>
Date: Sun, 01 Jan 2023 19:18:42 +0100
In-Reply-To: <20221226211910.552376-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Dec 2022 22:19:10 +0100")
Message-ID: <87wn66ce4d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: fix build with arm
 soft float
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with arm soft float raised since bump to
 > version 1.15 in commit c31087182fa545784d9a0a01f0b32715d78c3955 and
 > https://github.com/ebiggers/libdeflate/commit/84c76f6f2cf5e5ac4deca0b1c25faebb42469f58:

 > In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
 >                  from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/11.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
 >    31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
 >       |  ^~~~~
 > In file included from
 > /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
 > /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:
 > In function 'clmul_u32':
 > /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:9:
 > error: unknown type name 'uint64x2_t'; did you mean 'uint16x2_t'?
 >   262 |         uint64x2_t res = vreinterpretq_u64_p128(
 >       |         ^~~~~~~~~~
 >       |         uint16x2_t

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1445dcbf676893133f311a92ac21b29237fb75df

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
