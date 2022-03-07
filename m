Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A369DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 23:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 359E1404F3;
	Mon,  7 Mar 2022 23:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahpog5sGpsW0; Mon,  7 Mar 2022 23:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E8E0408AF;
	Mon,  7 Mar 2022 23:52:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41A491BF3CD
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3084241768
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6vhNxFEqTqQ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 23:52:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D3441766
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 23:52:38 +0000 (UTC)
Received: (qmail 13792 invoked from network); 7 Mar 2022 17:52:37 -0600
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 7 Mar 2022 17:52:37 -0600
Message-ID: <9e71b104-9955-4d41-e05a-02e0b1e40802@steinkuehler.net>
Date: Mon, 7 Mar 2022 17:52:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220307224226.1375696-1-christian@paral.in>
 <20220307235417.279e7751@gmx.net>
 <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
From: Charles Steinkuehler <charles@steinkuehler.net>
In-Reply-To: <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rpi-userland: add support
 for aarch64 build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 3/7/2022 5:03 PM, Christian Stewart via buildroot wrote:
> Hi Peter,
> 
> You're probably right about that:
> 
> On Mon, Mar 7, 2022 at 2:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>> On Mon,  7 Mar 2022 14:42:26 -0800, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>>
>>> Tested on Pi4 Model B (aarch64).
>>>
>>> Note: rpi-userland and upstream rpi os now support arm64.
>>
>> All issues/questions solved since discussion [1], [2] about
>> missing libraries/features?
>>
>> As far as I know rpi os graphic support is based on mesa3d v3d/vc4
>> instead of rpi-userland libraries?
> 
> I use this package on arm64 for vcgencmd (videocore) and other commands,
> 
> however I have not verified that graphics work correctly, and you're
> most likely correct,
> 
> the arm64 stack probably is using mesa3d vc4. I boot the pi4 64 bit with:
> 
> arm_64bit=1
> dtoverlay=vc4-fkms-v3d

I am using the RPi 4 / CM4 and accelerated graphics are working using 
the open source stack (vc4-kms-v3d) as tested with the kmscube app and 
Buildroot 2022.02-rc3.

-- 
Charles Steinkuehler
charles@steinkuehler.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
