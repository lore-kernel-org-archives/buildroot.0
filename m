Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3457AC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 018B44026A;
	Sat,  6 Apr 2024 07:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvlNH8bsLJ-3; Sat,  6 Apr 2024 07:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D4D40396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03D4D40396;
	Sat,  6 Apr 2024 07:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E481E1BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE0844026A
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_BSI02G44qt for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE09A4042A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE09A4042A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE09A4042A
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:43:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7131E0003
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:43:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rt0hk-00E37A-37
 for buildroot@buildroot.org; Sat, 06 Apr 2024 09:43:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240404153438.3337807-1-peter@korsgaard.com>
Date: Sat, 06 Apr 2024 09:43:12 +0200
In-Reply-To: <20240404153438.3337807-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 4 Apr 2024 17:34:36 +0200")
Message-ID: <87plv3os1b.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: explicitly disable lerc
 support for host and target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > We do not have liblerc in Buildroot and it may cause linking issues for
 > host-tiff on build hosts with liblerc:

 > libtool: link: /usr/bin/gcc -O2
 > -I/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/include
 > -Wall -W -Wl,-rpath
 > -Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
 > -o tiffcp tiffcp.o
 > -L/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
 > ../libtiff/.libs/libtiff.so ../port/.libs/libport.a -lLerc -ljbig -lm
 > -Wl,-rpath
 > -Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/build/host-tiff-4.6.0/libtiff/.libs
 > -Wl,-rpath
 > -Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
 > /usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
 > `deflateInit_'
 > /usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `deflate'
 > /usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
 > `deflateEnd'
 > /usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `inflate'

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
