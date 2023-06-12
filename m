Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2247EC88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D3558218E;
	Mon, 12 Jun 2023 15:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D3558218E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJF1gd_gYAUz; Mon, 12 Jun 2023 15:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5B481EB6;
	Mon, 12 Jun 2023 15:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5B481EB6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91BD21BF398
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644BF6112D
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644BF6112D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew7MRmH9UUSE for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE8261120
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE8261120
 for <buildroot@uclibc.org>; Mon, 12 Jun 2023 15:47:35 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9268F4000D;
 Mon, 12 Jun 2023 15:47:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q8jlT-003VFe-NO; Mon, 12 Jun 2023 17:47:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>, neal.frager@amd.com
References: <20230609161307.432DD8262B__38013.4634369583$1686327210$gmane$org@busybox.osuosl.org>
 <pan$df8d3$d38b8fa2$c50497ad$86a070c3@ID-313208.user.individual.net>
Date: Mon, 12 Jun 2023 17:47:31 +0200
In-Reply-To: <pan$df8d3$d38b8fa2$c50497ad$86a070c3@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Mon, 12 Jun 2023 16:54:32 +0200")
Message-ID: <87ttvcznqk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/bootgen: bump to xilinx_v2023.1
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Tue, 16 May 2023 16:48:25 +0200 schrieb Peter Korsgaard:
 >> commit:
 >> https://git.buildroot.net/buildroot/commit/?
 > id=e4ac14e09a57667168278187331cdf7238b80324
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> This patch bumps bootgen to version xilinx_v2023.1.
 >> The patch for build machines with modern flex is no longer needed.

 > Hi Neal, hi Peter,

 > on my machine I cannot reproduce the flex bug but it seems it occurs 
 > again after bumping this package which removed the patch:
 > http://autobuild.buildroot.net/?reason=host-bootgen-xilinx_v2023.1

I also cannot reproduce it here, but looking at the build issues, it
seems to get confused building cmdoptions.yy.cpp which some mixup
between pointer-to vs reference-to std::iostream:

../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator='
(operand types are 'std::istream' {aka 'std::basic_istream<char>'} and
'std::istream*' {aka 'std::basic_istream<char>*'})

This was indeed changed in Flex 2.6 almost 8 years ago:

https://github.com/westes/flex/commit/336a1deaa57975f34cd732d656d1c0cbe3d5233a

But bootgen embeds an (ancient) flex 2.5.35:

https://github.com/Xilinx/bootgen/blob/master/bif.yy.cpp#L18-L20

It is a bit hard to follow as the 2023.1 tag seems to have a number of
squashed commits rather than the commits from master, but:

The patch was upstreamed here:
https://github.com/Xilinx/bootgen/pull/20

The patch was not applied, instead a different patch with the same
content applied to master:
https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed

This patch was not applied to the xlnx_rel_v2023.1 branch, instead most
of the content was included in:
https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a

But the cmdoptions.yy.cpp hunk was (accidently?) dropped:
https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a#diff-e0287adb420dbecc112acdf7d4a1efba8ea6cbf06401e4e8679b8ffd22a091d8

I'll send a patch to fix that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
