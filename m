Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8EECFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B6A83D56;
	Sat, 22 Nov 2025 17:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuTaxvORE2nd; Sat, 22 Nov 2025 17:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8FA83D52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD8FA83D52;
	Sat, 22 Nov 2025 17:52:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D687734E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC45860A44
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_CBTyNzgLvA for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44BC860BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BC860BA7
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44BC860BA7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:52:08 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:adbc:252a:24a8:36bc] (unknown
 [IPv6:2a01:e0a:12:eba0:adbc:252a:24a8:36bc])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 8A801BFB78;
 Sat, 22 Nov 2025 18:52:06 +0100 (CET)
Message-ID: <a70e967b-3cbb-4b97-83f2-c41f404f41a5@grenoble.cnrs.fr>
Date: Sat, 22 Nov 2025 18:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <69213a63.050a0220.138abd.7673@mx.google.com>
Content-Language: en-US, fr
In-Reply-To: <69213a63.050a0220.138abd.7673@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1763833926;
 bh=TUB65X87z4gRlNJpUEmRkBQaPQZWnlARq8viIKK+3Mk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=M6qtb7Lq4N51KUYH8DM0EgxyLStO7dxom4d4NS8tLYgxgmLScQQN5VyBBBZ4z3taA
 MdQ7aXpQfuZDLFikNWRdxuCKkPjBdj3SCGjxhJQxzBxtXXJII5gMkd1DzkwfqIIHUn
 /NMMJmf8AA5ptvu9SpdK6j8eyaSFIaerlXvuG9D8xcI+4N0ev0whYRM1i5YgzO32mB
 lqpnouQuibWM1r1sKsXLguWa5ZR3XNiL6dyfN7+3W2wRITVwMSbEp3QbNTkglhKiXy
 Nfw6bGxQ3qCZ/1o/1jSv4DYDEYITxDBxYWyGZcTzyw6sy6nwHP19C2kTTqbrZfY+O5
 dF6oNN9baIzcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=M6qtb7Lq
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-11-21
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Buildroot users!

On 2025-11-22, the autobuilder wrote:
> Detail of failures for master
> -----------------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    [...]
>    x86_64    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/6357ec9341a68c1f0e8facdd9a9c780738790496 | ORPH
>    [...]

I tried to investigate this failure. It turns out the defconfig[0] is
simply missing

    BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y

but I couldn't find where, in the Buildroot source tree, this is
supposed to be set.

Regards,

Edgar Bonet.

[0] https://autobuild.buildroot.org/results/6357ec9341a68c1f0e8facdd9a9c780738790496/defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
