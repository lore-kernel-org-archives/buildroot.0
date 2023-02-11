Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB983C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125344097B;
	Sat, 11 Feb 2023 18:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125344097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuBWlvLkqieJ; Sat, 11 Feb 2023 18:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC864090B;
	Sat, 11 Feb 2023 18:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC864090B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48D331BF580
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2316181DED
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2316181DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NL4tE73YRrXq for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:00:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC8C81D3D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EC8C81D3D
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:00:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 680CF7804ED;
 Sat, 11 Feb 2023 19:00:10 +0100 (CET)
Received: from [37.169.166.33]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 11 Feb 2023 19:00:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20230211151034.GH2796@scaer>
References: <20230211151034.GH2796@scaer>
Message-ID: <789a9e1c7f5e0d253cea4254686c3b63@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676138410;
 bh=lozoKHitHnfctvI6nGV/MIXai9d+W10sz8r+XFwWCvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OlUcg8ouA3025DJED6BRlAkkxEmXl1IhRoGppA4y0h0Q9hvf21KwXKiMI3q9kGfnz
 a+/a1YLxCVAhlAD3VSVu0MNdkJJV+/tHjaswQoixUhOURSjUZLAvqpmghnXPZ7UXIc
 vA/MRJ5Ug6qC4tS/tdEB8+TQaDJ94MxSdUCwZSLA5uobVa+uUxIzAcC/FQSONq5hK0
 KUa+h/HgonPm/9CB+PsrR3oHCQYOnXyvlVDo4F/hzJzUEnlBtHN4FmHdBbh+VJcn8R
 jHTLPHw8izTokxw5aPyqAVm9h5eUWUIuyoIXCCKCb0iGkgDTZyP+oifvm1/3p3o4E4
 X89yXEWIrVsWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OlUcg8ou
Subject: Re: [Buildroot] [PATCH next v2 5/7]
 package/python-magic-wormhole-mailbox-server: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 11/02/2023 16:10, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2022-11-22 21:31 +0100, Julien Olivain spake thusly:
>> This package is the main server that Magic-Wormhole clients connect 
>> to.
>> The server performs store-and-forward delivery for small key-exchange
>> and control messages. Bulk data is sent over a direct TCP connection,
>> or through a transit-relay.
>> 
>> https://github.com/magic-wormhole/magic-wormhole-mailbox-server
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
> [--SNIP--]
>> diff --git a/package/python-magic-wormhole-mailbox-server/Config.in 
>> b/package/python-magic-wormhole-mailbox-server/Config.in
>> new file mode 100644
>> index 0000000000..db20d3e7b6
>> --- /dev/null
>> +++ b/package/python-magic-wormhole-mailbox-server/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
>> +	bool "python-magic-wormhole-mailbox-server"
>> +	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
>> +	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>> +	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
> 
> python-autobahn depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS,
> so this should have been propagated. It's relatively easy to reproduce
> on current master as of commit 451672e890b5:
> 
>     $ KCONFIG_SEED=0x1D15B9D4 make randconfig
>     [...]
>     WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_PYTHON_AUTOBAHN
>       Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] &&
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER [=y] &&
> BR2_PACKAGE_PYTHON3 [=y]
> 
> Care to send a fix, and check the other packages that were added in 
> this
> series, please?

Thank you for reporting this issue!  I just checked the series and it is
the only patch selecting autobhan with the missing host rustc 
dependency.

I will send a patch right away.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
