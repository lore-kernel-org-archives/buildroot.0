Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE60AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 08:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BBB781F64;
	Wed, 21 Dec 2022 08:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBB781F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwOvoLf8a0jg; Wed, 21 Dec 2022 08:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A257381F5E;
	Wed, 21 Dec 2022 08:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A257381F5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9DB71BF3F6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A5381F5E
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A5381F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_DHyFYzjL9U for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 08:07:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB0681F5C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBB0681F5C
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 08:07:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8BD56240006;
 Wed, 21 Dec 2022 08:07:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7u8E-000Nax-I1; Wed, 21 Dec 2022 09:07:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221210174950.46867-1-fontaine.fabrice@gmail.com>
Date: Wed, 21 Dec 2022 09:07:18 +0100
In-Reply-To: <20221210174950.46867-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Dec 2022 18:49:50 +0100")
Message-ID: <87a63hrxhl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/exempi: bump to version 2.6.3
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
Cc: Ilya Averyanov <averyanovin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Samples can be disabled since version 2.6.2 and
 > https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/a8db9f4e7e4156ee7e52def01f1f83ca5fa7de40

 > This bump will fix the following build failure on arm with gcc 10 raised
 > since bump to version 2.6.0 in commit
 > 55f1d0a3592253df2a356c195e5131a970eade9b and
 > https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
 > https://github.com/adobe/XMP-Toolkit-SDK/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
 > thanks to
 > https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/f26d77ba26a7245a95068bca2eea9608f4e79f80:

 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > ../../XMPFiles/source/.libs/libXMPFiles.a(XMPFiles_Impl.o):(.rodata+0x5c):
 > multiple definition of `typeinfo name for
 > TXMPMeta<std::__cxx11::basic_string<char, std::char_traits<char>,
 > std::allocator<char> > >'; XMPFilesCoverage.o:(.rodata+0x0): first
 > defined here

 > https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.3/NEWS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c440719de02a154c6bdae11bda06ea30c131c71d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
