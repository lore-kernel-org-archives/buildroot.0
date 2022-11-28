Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55586C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 09:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D99A8408BF;
	Mon, 28 Nov 2022 09:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D99A8408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAV0IxhglZ2g; Mon, 28 Nov 2022 09:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01162408FF;
	Mon, 28 Nov 2022 09:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01162408FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 849771BF3C8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D08D408BF
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D08D408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPIbMBkOGP6J for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 09:09:40 +0000 (UTC)
X-Greylist: delayed 00:05:49 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FE4408BA
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52FE4408BA
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:09:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F404501;
 Mon, 28 Nov 2022 10:03:46 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <notmuch-sha1-bd80a5e4a125bbe0e62e6253fdfa7610e4834e90>
References: <notmuch-sha1-bd80a5e4a125bbe0e62e6253fdfa7610e4834e90>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Nov 2022 09:03:44 +0000
Message-ID: <166962622413.3066484.1675129521759030444@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1669626226;
 bh=SYi5HBQTqwLN8mVa4NMBhTxgo++v42E+1MwdiLsaAlk=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=jT0+ZS1aiu+W9lHPUB26zbav+i5KT5h3n6vHwgFaMeUXqJFcrWQoobwVJ3nD9f9Cs
 m3DU2kNyDZwXjlVIWQFW2hLu+7ezkJWQWYnJgkqrZY/6VKX+/MNtrq1774IFK7+DII
 N0959/4fYpaeVw4sqU3yO/6/omTHeBIMuhC6IwBw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=jT0+ZS1a
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-26
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

Hi Thomas,

+ Buildroot list

Quoting Thomas Petazzoni (2022-11-27 07:39:11)
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.
> 
> Results for the '2022.02.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   aarch64    | libcamera-1966b9a58436fab51... | http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb

Upon a quick examination I can see the following highlights in
build-end.log here:

...
Run-time dependency GTest found: YES 1.11.0
...
    lc-compliance application: YES
...
    lc-compliance            : enabled
...
[117/121] Linking target src/lc-compliance/lc-compliance
FAILED: src/lc-compliance/lc-compliance
/home/buildroot/autobuild/run/instance-3/output-1/host/bin/aarch64-linux-gnu-g++  -o src/lc-compliance/lc-compliance src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o src/lc-compliance/lc-compliance.p/environment.cpp.o src/lc-compliance/lc-compliance.p/main.cpp.o src/lc-compliance/lc-compliance.p/simple_capture.cpp.o src/lc-compliance/lc-compliance.p/capture_test.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group -lstdc++fs -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera:$ORIGIN/../libcamera/base:/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera/base -Wl,-rpath-li
 nk,/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64 src/libcamera/libcamera.so.0.0.0 src/libcamera/base/libcamera-base.so.0.0.0 -latomic /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent_pthreads.so /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent.so -lpthread -L/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lgtestd -Wl,--end-group
/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd
collect2: error: ld returned 1 exit status

I don't think we've changed anything (on the libcamera side) regarding
gtest/lc-compliance in quite some time ... so I'm surprised to see this
error pop up?

--
Kieran


> Thanks for your contribution to Buildroot!
> 
> -- 
> http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
