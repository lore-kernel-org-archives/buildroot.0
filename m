Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00229C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:19:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B6A460F9B
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B6A460F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B64D60605;
	Tue, 27 Jul 2021 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvzN8uGq3Rpv; Tue, 27 Jul 2021 20:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4EB6062A;
	Tue, 27 Jul 2021 20:19:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC621BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0AE6062A
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhyliFMvn8On for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:19:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 957A760605
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F0B81814B9; Tue, 27 Jul 2021 22:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627417158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+RxHRlAksyTUfCeMXbzXoL5ec/pgwqerX1wRXRWYMJI=;
 b=fUW2GneSCIIVJVFI3WKx5UEEdCzdGqt4ihMGh3jV5IpccNTS5aVKEb/H8EiRrSJ8G1F1pv
 v7bu5UDJMInbt9Tv4BKoz2ESNZW5Jc5xMbpTrQJpxtMNMZOaep02pd2lgYOZuUCF10aW8l
 LKHHAaVgBkA34LYPPtIpO+Sauc+bBPI=
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210726201244.43070-1-buildroot@heine.tech>
 <20210726230716.2c7079c5@windsurf>
 <58f8221d-3cd0-7742-b1cc-30f7d94ba88f@mind.be>
Message-ID: <1852b497-3fb1-5fca-b01e-33e1f51d9221@heine.tech>
Date: Tue, 27 Jul 2021 22:19:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <58f8221d-3cd0-7742-b1cc-30f7d94ba88f@mind.be>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: expose more disable
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 27.07.21 21:53, Arnout Vandecappelle wrote:
> On 26/07/2021 23:07, Thomas Petazzoni wrote:
>> Arnout, Peter, Yann: in order to preserve backward compatibility,
>> Michael has created those new options with a "default y". However,
>> while it keeps backward compatibility, it also means that all new users
>> will get a more bloated bluez_utils installation than is probably
>> necessary. Should we break our backward compatibility rule here and
>> drop the "default y" on those new options ?

If we go for a compatibility break here I would then also submit a patch 
to make
"--disable-tools" configurable and default to no. Those tools are 
usually not
required when using d-bus and/or bluetoothctl and add up to 1-2MB.

I was hesitant on this one because the relation with 
--disable-deprecated, which
buildroot already exposes, is a bit weird but I think i figured it out.

>   I know from experience that that's the kind of tricky changes that can make it
> annoying to update Buildroot.
>
>   Assuming you select bluez5_utils from menuconfig, having a default y is not
> much of a problem in practice. However, bluez5_utils is also selected
> automatically by a couple of packages [*] - in that case, the user doesn't see
> the suboptions so isn't aware that they can disable them.
>
>   So yes, there are good reasons to prefer default n. But then I think we should
> think of a way to smoothen things for people who want to update buildroot. Here
> are a few ideas:
>
> - Just mention it in CHANGES.
 From a user perspective I think this should mention this, even if we go 
with the migrating.txt
or another approach. Because this is where I look on upgrading before 
trying to build.

> [*] BTW, did someone check if those packages that select bluez5_utils now should
> be updated to select the appropriate plugin? Probably not - I imagine cwiid (for
> the wiimote) for example needs the HID plugin, and the gstreamer plugin needs
> A2DP and/or AVDP. Runtime dependencies, of course, so we'll never know until
> someone actually complains about it.

I have some spare time in the next days. I'll check the dependencies 
where possible.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
