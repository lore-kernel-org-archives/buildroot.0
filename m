Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A67FC52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B69844CE;
	Fri,  9 Aug 2024 19:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RnGDCNLD0Wh; Fri,  9 Aug 2024 19:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0E8844B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0E8844B3;
	Fri,  9 Aug 2024 19:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 565D71BF990
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 425404038E
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kwn25IcgWx-w for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFA9540342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA9540342
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFA9540342
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:34:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72AB760002;
 Fri,  9 Aug 2024 19:34:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scVNE-000JkK-1Y;
 Fri, 09 Aug 2024 21:34:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20221223133401.97844-1-buildroot@heine.tech>
 <3f2f76fc-6474-4054-8a60-a8223e3b0cd0@mind.be>
Date: Fri, 09 Aug 2024 21:34:04 +0200
In-Reply-To: <3f2f76fc-6474-4054-8a60-a8223e3b0cd0@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sat, 13 Jul 2024 11:36:26
 +0200")
Message-ID: <87sevdo5hv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/boost: Boost.Atomic needs atomic
 intrinsics
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Urquiza <fabiorush@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 23/12/2022 14:34, Michael Nosthoff via buildroot wrote:
 >> From: Michael <buildroot@heine.tech>
 >> similar to previous problems with nios2 and not-available atomic
 >> ints
 >> the build for Boost.Atomics also fails for ARC Targets which don't
 >> have the ATOMICS_EXT flag set.
 >> according to [0] "Boost.Atomic has a hard requirement of the native
 >> atomic operations on bytes". The same tests mentioned there fail for
 >> ARC.

 >  Based on that comment, the option
 >  BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS was introduced. So
 >  that one should have been used instead.


 >> so introduce a dependency on BR2_ARC_ATOMIC_EXT for BR2_arc.
 >> add depends clause for all packages using boost-atomic/filesystem.
 >> Fixes:
 >> http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493
 >> [0]
 >> https://github.com/boostorg/atomic/issues/42#issuecomment-734130348
 >> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

 >  I changed the entire patch to this:

 > diff --git a/toolchain/Config.in b/toolchain/Config.in
 > index 1aa17cbfbd..8acdc62fc2 100644
 > --- a/toolchain/Config.in
 > +++ b/toolchain/Config.in
 > @@ -94,6 +94,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 >         depends on !BR2_ARM_CPU_ARMV5
 >         depends on !BR2_sparc_v8
 >         depends on !BR2_m68k_cf5208
 > +       depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)

 >  # GCC uses thunk functions to adjust the 'this' pointer when calling
 >  # C++ member functions in classes derived with multiple inheritance.


 > and applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
