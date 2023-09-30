Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9645E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 592558149C;
	Sat, 30 Sep 2023 08:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 592558149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hL12yByFG_I; Sat, 30 Sep 2023 08:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8425781FB5;
	Sat, 30 Sep 2023 08:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8425781FB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE5E11BF267
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5BBA42DFD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5BBA42DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jk74Yi-IAJUc for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:03:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ACE3421F5
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACE3421F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4CAA4000A;
 Sat, 30 Sep 2023 08:03:19 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmUwZ-00AKbz-5i; Sat, 30 Sep 2023 10:03:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
 <eb94fb2be140a706ce4797df9cb56d63@agner.ch>
Date: Sat, 30 Sep 2023 10:03:19 +0200
In-Reply-To: <eb94fb2be140a706ce4797df9cb56d63@agner.ch> (Stefan Agner's
 message of "Mon, 25 Sep 2023 12:08:53 +0200")
Message-ID: <87r0mgay0o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > Hi Christian,
 > Finally came around looking into this a bit more closely. It seems that
 > containerd just didn't send the sd notification READY=1.

 > It seems that the problem is caused by the CRI plug-in. The plug-in
 > reports the following error:
 > time="2023-09-24T21:43:20.958509027Z" level=warning msg="failed to load
 > plugin io.containerd.grpc.v1.cri" error="failed to create CRI service:
 > failed to create cni conf monitor for default: failed to create the
 > parent of the cni conf dir=/etc/cni: mkdir /etc/cni: read-only

 > We are running containerd on a read-only squashfs. I guess this explains
 > also why you haven't seen this issue.

 > After disabling the plug-in via /etc/containerd/config.toml
 > disabled_plugins = [ "cri" ], the issue disappeared (containerd service
 > starts up correctly and prints the message "containerd successfully
 > booted in ...s"

 > Checking the changelog of v1.6.22 brings up this change:
 > https://github.com/containerd/containerd/pull/8826

 > The error above was already present before, so I didn't give it much
 > attention. But I guess the change to use atomicfile really changed the
 > behavior and now seems to cause the hang on startup.

 > In any case, from my point of view, nothing which needs to be addressed
 > in Buildroot.

If cri is only needed for when containerd is used with kubernetes, then
perhaps we should disable it by default so other people don't need to
debug the same issue.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
