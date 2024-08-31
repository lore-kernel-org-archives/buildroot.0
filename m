Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBB6CD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59C3340065;
	Sat, 31 Aug 2024 13:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2czYZmZgYxD; Sat, 31 Aug 2024 13:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D3A40420
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D3A40420;
	Sat, 31 Aug 2024 13:29:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04A781BF593
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C17419A3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7vJl2CGM-4K for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C8484033C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8484033C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C8484033C
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:29:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFF5220003;
 Sat, 31 Aug 2024 13:29:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skO9z-00FMzI-34;
 Sat, 31 Aug 2024 15:28:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf> <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf> <87ttf47nr6.fsf@dell.be.48ers.dk>
 <20240829234416.4131264b@windsurf> <87le0e32jm.fsf@dell.be.48ers.dk>
 <20240830172920.0ede0f66@windsurf>
 <CAOf5uw=AF5kUu6B5EOhMLug-eG+d-GM4BAY=6RRNZACaG0wQ1Q@mail.gmail.com>
Date: Sat, 31 Aug 2024 15:28:58 +0200
In-Reply-To: <CAOf5uw=AF5kUu6B5EOhMLug-eG+d-GM4BAY=6RRNZACaG0wQ1Q@mail.gmail.com>
 (Michael Nazzareno Trimarchi's message of "Fri, 30 Aug 2024 17:32:07
 +0200")
Message-ID: <87mskszuqt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nazzareno Trimarchi <michael@amarulasolutions.com> writes:

Hi,

 >> The Android sparse image format looks like to be what you want.
 >> See https://2net.co.uk/tutorial/android-sparse-image-format. There are some
 >> C/C++ tools at https://android.googlesource.com/platform/system/core/+/master/libsparse/
 >> to generate/manipulate Android sparse images.
 >> 

 > As I mention some time ago android sparse format can be generate with
 > genimage.cfg

 > image sdcard-sparse.img {
 >     android-sparse {
 >         image = sdcard.img
 >     }
 > }

 > Nothing needs to be changed. Fastboot should able to handle it

Ahh nice, I wasn't aware of that!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
