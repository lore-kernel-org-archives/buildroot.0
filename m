Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368CFC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 11:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB35C84410;
	Sat,  4 Jun 2022 11:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qpaGgygRnNp; Sat,  4 Jun 2022 11:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D392F84407;
	Sat,  4 Jun 2022 11:21:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFB91BF5AA
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB3841B2F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PH-nIk_vAA07 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 11:21:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97E8F41B2E
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 11:21:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B53455FFA1;
 Sat,  4 Jun 2022 13:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654341694;
 bh=eF1fFBN5gHRXD4NCNARzd+bKvKmhKUUm44VHPcruHdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXdWz0XD1ZFM/anQBYQSZviQPIWCm9eplAIJ1J4opWJjYhgMGL5F3NRR2r+n66/kt
 2SL81s+/ihjBYVp4FzckXhborCwTvWJw+ArnNz8ystshoQ3FB70udZOmQ3+i1D2nzF
 3ykKER5gfBZddspPJ+ubEm8MUzt8TdNGH9CnCWlbGeOJ5kkoRsCR1eJMlQiG1C/5JH
 rFvVBjCwrp/9lUZQT5i/5F++JXFwOIOV22hrZPpiY+JQhqcT1WVNq7w7f13PYiRtFo
 hdaU69OtnviJJd+sbBQKw/p5CFSLGXS1r1vwa9a64ZEQTIzvJ3urCkKssRxTU4IUor
 Nmt+ev1AAa1YQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 13:21:32 +0200
Date: Sat, 4 Jun 2022 13:21:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220604112132.GJ427639@scaer>
References: <20220528044112.30F8284C8E@smtp1.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220528044112.30F8284C8E@smtp1.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-05-27
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

Christian, All,

On 2022-05-28 04:41 -0000, Thomas Petazzoni via buildroot spake thusly:
> Autobuild statistics for 2022-05-27
> powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6358bff6bdf8c9b246596e7cbb9cc7392ff53c2b |     

There are a few build failure for wtfutils, but I have absolutely no
clue what is going on... Could you have a look, please?

http://autobuild.buildroot.org/?reason=wtfutil-%

(Ignore those on my autiobuilder: the distro was too old, without
new-enough ca-certs)

http://autobuild.buildroot.org/results/223/223b9407773dcd8a98e8f3424a14d36d1a6c1875/build-end.log

loadelf: $WORK/b150/_pkg_.a(_x001.o): 1019558: sym#53 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b150/_pkg_.a(_x002.o): 1019565: sym#57 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b150/_pkg_.a(_x003.o): 1019576: sym#73 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b150/_pkg_.a(_x004.o): 1019584: sym#60 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b193/_pkg_.a(_x001.o): 1019588: sym#52 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b193/_pkg_.a(_x002.o): 1019595: sym#66 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b193/_pkg_.a(_x003.o): 1019602: sym#66 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b193/_pkg_.a(_x004.o): 1019609: sym#64 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b193/_pkg_.a(_x005.o): 1019616: sym#73 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x001.o): 1019620: sym#52 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x002.o): 1019627: sym#32 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x003.o): 1019632: sym#64 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x004.o): 1019638: sym#64 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x005.o): 1019648: sym#81 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x006.o): 1019656: sym#99 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x007.o): 1019661: sym#64 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x008.o): 1019666: sym#64 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x009.o): 1019672: sym#65 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
loadelf: $WORK/b151/_pkg_.a(_x010.o): 1019677: sym#76 (wm4.0.981f2b126b8e8fee2c81ed35ccb2e048): ignoring symbol in section 1 (type 0)
_cgo_init: relocation target x_cgo_init not defined
_cgo_notify_runtime_init_done: relocation target
x_cgo_notify_runtime_init_done not defined
/nvmedata/autobuild/instance-20/output-1/host/lib/go/pkg/tool/linux_amd64/link:
too many errors


http://autobuild.buildroot.org/results/635/6358bff6bdf8c9b246596e7cbb9cc7392ff53c2b/build-end.log

os/user(.text): relocation target _restgpr0_30 not defined
os/user(.text): relocation target _savegpr0_29 not defined
os/user(.text): relocation target _restgpr0_29 not defined
net(.text): relocation target _savegpr0_28 not defined
net(.text): relocation target _restgpr0_28 not defined
net(.text): relocation target _savegpr0_29 not defined
net(.text): relocation target _restgpr0_29 not defined
net(.text): relocation target _savegpr0_28 not defined
net(.text): relocation target _restgpr0_28 not defined
net(.text): relocation target _savegpr0_29 not defined
net(.text): relocation target _restgpr0_29 not defined
runtime/cgo(.text): relocation target _restgpr0_30 not defined
runtime/cgo(.text): relocation target _restgpr0_31 not defined
runtime/cgo(.text): relocation target _savegpr0_23 not defined
runtime/cgo(.text): relocation target _restgpr0_23 not defined
runtime/cgo(.text): relocation target _restgpr0_30 not defined
runtime/cgo(.text): relocation target _savegpr0_29 not defined
runtime/cgo(.text): relocation target _restgpr0_29 not defined
runtime/cgo(.text): relocation target _savegpr0_25 not defined
runtime/cgo(.text): relocation target _restgpr0_25 not defined
runtime/cgo(.text): relocation target _savegpr0_28 not defined
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/go/pkg/tool/linux_amd64/link: too many errors

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
