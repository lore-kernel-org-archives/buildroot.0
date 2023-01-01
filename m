Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C3EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A0B60AD5;
	Sun,  1 Jan 2023 18:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A0B60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI6PPz3-prxd; Sun,  1 Jan 2023 18:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE826058F;
	Sun,  1 Jan 2023 18:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE826058F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E34BD1BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B768440499
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B768440499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkDxA1auutOC for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:13:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51BEE40493
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51BEE40493
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:13:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E45D40002;
 Sun,  1 Jan 2023 18:13:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pC2qH-000m42-EP; Sun, 01 Jan 2023 19:13:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221226102305.406593-1-fontaine.fabrice@gmail.com>
Date: Sun, 01 Jan 2023 19:13:53 +0100
In-Reply-To: <20221226102305.406593-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Dec 2022 11:23:05 +0100")
Message-ID: <87cz7ydswu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: fix aarch64 build
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

 > Fix the following aarch64 build failure raised since the addition of the
 > package in commit 4231e7b10b87de71e33bb9906eede3751bed5dfe:

 > In file included from
 > /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
 >                  from
 > /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/crc32.c:227:
 > /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:
 > In function 'clmul_u32':
 > /home/autobuild/autobuild/instance-22/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/10.4.0/include/arm_neon.h:26723:1:
 > error: inlining failed in call to 'always_inline' 'vmull_p64': target
 > specific option mismatch
 > 26723 | vmull_p64 (poly64_t __a, poly64_t __b)
 >       | ^~~~~~~~~
 > In file included from
 > /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/crc32.c:227:
 > /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:19:
 > note: called from here
 >   262 |  uint64x2_t res = vreinterpretq_u64_p128(
 >       |                   ^~~~~~~~~~~~~~~~~~~~~~~
 >   263 |     compat_vmull_p64((poly64_t)a, (poly64_t)b));
 >       |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9aee8dafea614db77209818b913a571534466506
 >  - http://autobuild.buildroot.org/results/951d5a1a2959a0cc65ca7e52967ec07bc1cc00f1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
