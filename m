Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E48C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D295E60A7D;
	Mon, 19 Dec 2022 17:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D295E60A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yqf9xwTimqPt; Mon, 19 Dec 2022 17:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0546660E45;
	Mon, 19 Dec 2022 17:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0546660E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8131BF293
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F34581911
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F34581911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Otv9XQDaR4LP for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 17:06:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B4681493
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6B4681493
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 17:06:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A22EDE0011;
 Mon, 19 Dec 2022 17:06:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7JaS-006tx9-IS; Mon, 19 Dec 2022 18:06:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Lemonovich <lemonoje@gmail.com>
References: <CABBCHidJG84Y_tpnSAE7t2qksEj4izv_TRMRLxfNcbADDUw05A@mail.gmail.com>
 <87sfhcomp4.fsf@dell.be.48ers.dk>
 <CABBCHifyTV7PV20P8krtmnRaRtwBrLDPuDBej37=AbUmgi-mNg@mail.gmail.com>
Date: Mon, 19 Dec 2022 18:06:00 +0100
In-Reply-To: <CABBCHifyTV7PV20P8krtmnRaRtwBrLDPuDBej37=AbUmgi-mNg@mail.gmail.com>
 (John Lemonovich's message of "Mon, 19 Dec 2022 11:31:34 -0500")
Message-ID: <877cyniarr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] error - machine `ARM-buildroot' not recognized for
 libpcap
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "John" == John Lemonovich <lemonoje@gmail.com> writes:

Hello,

 > Peter,
 > Thank you for the reply!  I'm not very familiar with the process so I'm
 > relying on the Beginner's Guide and Intel FPGA documentation.  I have built
 > the rootfs successfully for my Arria10 device in the past using buildroot
 > and busybox, but it's been several years since the last time.

 > I am getting the upper case ARM from the Intel FPGA documentation - all
 > through their guides it shows it as upper case:  (see building the root
 > filesystem tab of this link for example)
 > https://www.rocketboards.org/foswiki/Documentation/EmbeddedLinuxBeginnerSGuide

 > Nonetheless, the upper case is apparently incorrect, and I have tried to
 > build with no ARCH specified, which, should default to just 'ARCH=arm',
 > correct?

Yes, you should not define ARCH=<something> (or export it in your
environment) when you use Buildroot. The architecture is specified by
running make menuconfig.


 > I am selecting external toolchain as
 > :gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf
 > My kernel is 5.4.13  from Linux-socfpga

 > I just did a fresh checkout of 2022.02.7  , added a few networking
 > utilities and options, selected external toolchain and prefix and now I get
 > this error:
 > Incorrect selection of kernel headers: expected 5.4.x, got 4.10.x

Your runtime kernel may be 5.4.13, but the Linaro toolchain you mention
above has been built against a 4.10.3 kernel:

cat gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include/linux/version.h
#define LINUX_VERSION_CODE 264707
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

printf '0x%x\n' 264707
0x40a03

So you need to configure 'External toolchain kernel headers series' as
4.10.x (or alternatively use one of the newer preconfigured toolchains).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
