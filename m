Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2564CCD1299
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 15:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9B841AFC;
	Thu,  4 Apr 2024 15:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs7fFRM0W_XG; Thu,  4 Apr 2024 15:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D47B41B49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D47B41B49;
	Thu,  4 Apr 2024 15:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044C71BF232
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5DD883415
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IquiEP7_jroK for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 15:37:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FB5D83412
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FB5D83412
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FB5D83412
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 15:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0C7020005;
 Thu,  4 Apr 2024 15:37:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rsP9o-00E0RP-0F;
 Thu, 04 Apr 2024 17:37:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ralf Dragon <hypnotoad@lindra.de>
References: <40ae9b7a-21fb-4462-a891-eb1326bc7d56@lindra.de>
Date: Thu, 04 Apr 2024 17:37:40 +0200
In-Reply-To: <40ae9b7a-21fb-4462-a891-eb1326bc7d56@lindra.de> (Ralf Dragon's
 message of "Mon, 1 Apr 2024 09:58:11 +0200")
Message-ID: <8734s1qgu3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] problem compiling host-tiff-4.6.0
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

>>>>> "Ralf" == Ralf Dragon <hypnotoad@lindra.de> writes:

 > Dear all,
 > for me in current master and 2024.02.x branches, the package
 > host-tiff-4.6.0 fails to compile with:

Thanks for the heads up, reproduced here.

 > ...

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
 > ...


 > It seems that the following diff fixes the problem, but I guess that
 > the HOST_TIFF_CONF_OPTS were added in 91b16f for a reason and that the
 > problem is a different.

Indeed. If you look closely to the failing line you see that you are
linking host-tiff with -lLerc and -ljbig. Presumably you have the
development packages for those libraries installed on your build host?

I have sent a series to explicitly disable lerc and jbig support in
tiff, which should fix the issue:

https://patchwork.ozlabs.org/project/buildroot/list/?series=401697

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
