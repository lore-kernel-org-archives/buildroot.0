Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15672C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 08:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C980180D93;
	Thu,  5 Jun 2025 08:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04YTcpqs-e5b; Thu,  5 Jun 2025 08:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C0980DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C0980DC5;
	Thu,  5 Jun 2025 08:56:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5765E1A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DFB400F9
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwcLGwlDU95g for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 08:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39CDD400BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39CDD400BE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39CDD400BE
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:56:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9B2243254;
 Thu,  5 Jun 2025 08:56:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uN6Op-001CAI-0X;
 Thu, 05 Jun 2025 10:56:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
References: <20250605074545.669101-1-br015@umbiko.net>
Date: Thu, 05 Jun 2025 10:56:35 +0200
In-Reply-To: <20250605074545.669101-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Thu, 5 Jun 2025 09:45:45 +0200")
Message-ID: <878qm6ftx8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeeigfegvefgvdefleegjeduudfhkefgkeffudeugfffueeuhfelgeehffevueefueenucffohhmrghinhepmhhushhitghpugdrohhrghdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsrhdtudehsehumhgsihhkohdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Version 0.24.4 change log: 
 > * protocol
 >   - fix stuck "getfingerprint" with io_uring
 > * decoder
 >   - mpg123: support Icy stream tags
 >   - mpg123: use libid3tag to parse stream tags
 > * tags
 >   - id3: fix assertion failure with broken AIFF/RIFF ID3 chunks
 > * output
 >   - fix resuming playback after it was paused by "single" mode
 >   - alsa: fix compiler warning with alsa-lib 1.2.14

 > $ utils/check-package package/mpd/*
 > 908 lines processed
 > 0 warnings generated
 > $ utils/check-symbols
 > (no output)
 > $ rm -fr ~/output/
 > $ mkdir ~/output/
 > $ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
 > $ utils/test-pkg -a -c ~/output/mpd.config -d ~/output -p mpd
 >                              arm-aarch64 [ 1/40]: SKIPPED
 >                    bootlin-aarch64-glibc [ 2/40]: SKIPPED
 >                bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
 >                     bootlin-armv5-uclibc [ 4/40]: SKIPPED
 >                      bootlin-armv7-glibc [ 5/40]: OK
 >                    bootlin-armv7m-uclibc [ 6/40]: SKIPPED
 >                       bootlin-armv7-musl [ 7/40]: SKIPPED
 >                 bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
 >                bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
 >              bootlin-microblazeel-uclibc [10/40]: SKIPPED
 >                 bootlin-mipsel32r6-glibc [11/40]: SKIPPED
 >                    bootlin-mipsel-uclibc [12/40]: SKIPPED
 >                  bootlin-openrisc-uclibc [13/40]: SKIPPED
 >         bootlin-powerpc64le-power8-glibc [14/40]: SKIPPED
 >            bootlin-powerpc-e500mc-uclibc [15/40]: SKIPPED
 >                    bootlin-riscv32-glibc [16/40]: OK
 >                    bootlin-riscv64-glibc [17/40]: OK
 >                     bootlin-riscv64-musl [18/40]: SKIPPED
 >                  bootlin-s390x-z13-glibc [19/40]: OK
 >                       bootlin-sh4-uclibc [20/40]: SKIPPED
 >                    bootlin-sparc64-glibc [21/40]: SKIPPED
 >                     bootlin-sparc-uclibc [22/40]: SKIPPED
 >                     bootlin-x86-64-glibc [23/40]: OK
 >                      bootlin-x86-64-musl [24/40]: SKIPPED
 >                    bootlin-x86-64-uclibc [25/40]: SKIPPED
 >                    bootlin-x86-i686-musl [26/40]: SKIPPED
 >                    bootlin-xtensa-uclibc [27/40]: SKIPPED
 >                             br-arm-basic [28/40]: SKIPPED
 >                     br-arm-full-nothread [29/40]: SKIPPED
 >                       br-arm-full-static [30/40]: SKIPPED
 >                    br-i386-pentium4-full [31/40]: SKIPPED
 >                       br-mips64-n64-full [32/40]: SKIPPED
 >                  br-mips64r6-el-hf-glibc [33/40]: SKIPPED
 >                br-powerpc-603e-basic-cpp [34/40]: SKIPPED
 >                br-powerpc64-power7-glibc [35/40]: SKIPPED
 >                        linaro-aarch64-be [36/40]: SKIPPED
 >                           linaro-aarch64 [37/40]: SKIPPED
 >                               linaro-arm [38/40]: SKIPPED
 >                          sourcery-mips64 [39/40]: SKIPPED
 >                            sourcery-mips [40/40]: SKIPPED
 > 40 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Thanks for including the test-pkg output, but please put it after the
--- line so it doesn't end up in the commit message.

Committed with that fixed, thanks.

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 > ---
 >  package/mpd/mpd.hash | 2 +-
 >  package/mpd/mpd.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
 > index ef13e27033..dd3ac9782f 100644
 > --- a/package/mpd/mpd.hash
 > +++ b/package/mpd/mpd.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated after checking pgp signature
 > -sha256  4225680e068b2ad87e3c2de414ec3209758de93d671f89fa3bae90b70af478a2  mpd-0.24.3.tar.xz
 > +sha256  86035d6c63af32afa77fd5eb5ecd1c6afaef7cc352b28064edf51eea60f40d66  mpd-0.24.4.tar.xz
 >  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 > diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
 > index 35632f97b4..e41c03ef08 100644
 > --- a/package/mpd/mpd.mk
 > +++ b/package/mpd/mpd.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  MPD_VERSION_MAJOR = 0.24
 > -MPD_VERSION = $(MPD_VERSION_MAJOR).3
 > +MPD_VERSION = $(MPD_VERSION_MAJOR).4
 >  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 >  MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 >  MPD_DEPENDENCIES = host-pkgconf fmt
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
