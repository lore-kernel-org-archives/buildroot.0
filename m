Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9974C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1719410E4;
	Sat, 23 Mar 2024 13:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1OFpQvjzIMH; Sat, 23 Mar 2024 13:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78389410E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78389410E7;
	Sat, 23 Mar 2024 13:49:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70C021BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E2F282324
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBroSCHUrM3a for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6090C822FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6090C822FA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6090C822FA
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9682FFF803;
 Sat, 23 Mar 2024 13:49:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro1k7-006zpS-3C;
 Sat, 23 Mar 2024 14:49:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kadambini Nema <kadambini.nema@gmail.com>
References: <20240215203121.2948032-1-kadambini.nema@gmail.com>
Date: Sat, 23 Mar 2024 14:49:03 +0100
In-Reply-To: <20240215203121.2948032-1-kadambini.nema@gmail.com> (Kadambini
 Nema's message of "Thu, 15 Feb 2024 12:31:21 -0800")
Message-ID: <875xxdvz1s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.27
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kadambini" == Kadambini Nema <kadambini.nema@gmail.com> writes:

 > Change Log : https://github.com/libusb/libusb/blob/d52e355daa09f17ce64819122cb067b8a2ee0d4b/ChangeLog#L4
 > Build test results:
 >  libusb.config
 >    BR2_PACKAGE_LIBUSB=y
 >    BR2_PACKAGE_LIBUSB_EXAMPLES=y
 >    BR2_PACKAGE_LIBUSB_COMPAT=y

 > $./utils/test-pkg -k -c libusb.config  -p libusb
 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: OK
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                             sourcery-arm [6/6]: SKIPPED
 > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 > Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
