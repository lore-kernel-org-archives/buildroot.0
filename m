Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BAC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 10:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CFEE82974;
	Sat, 18 May 2024 10:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeH-YhRG8els; Sat, 18 May 2024 10:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1D682977
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1D682977;
	Sat, 18 May 2024 10:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42FAD1BF3A9
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA2E4051A
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm80X22g2WFX for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 10:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD551400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD551400BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD551400BB
 for <buildroot@buildroot.org>; Sat, 18 May 2024 10:16:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 56AB013F8B3;
 Sat, 18 May 2024 12:16:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 May 2024 12:16:03 +0200
Date: Sat, 18 May 2024 12:16:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <Zkh_4z6uQm4QNOds@landeda>
References: <20240517120057.3736694-1-yegorslists@googlemail.com>
 <ZkehJQxCJHZRJ1lr@landeda>
 <CAGm1_kuhYZ1uCnWquBBnhS89T7antGULc811jzaMAhtiHKFJJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kuhYZ1uCnWquBBnhS89T7antGULc811jzaMAhtiHKFJJg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716027366;
 bh=k6EDu8SXpOpM2JEwZkec3VuDZq6KWTJPX66kCytE/Vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1ATmLZQTJCmT/fk06GZJikrLRG953SkhlJ8s/c1SX3gXxskf2Z4fOXCHRcz1ASN3
 ExPJULEfhGEGSNG4UIPAU4Bs3qaf0gzWqwhSWtHqre5yY5AsfuDd+YP07Q9agG/lmq
 9Udcr9ndFIHg3Zcs8XuGdSb1pnBEcqmfuEblzLjRuLJvwIoZSSRh7DLmVd/d7PGOhR
 UmVD/xq77F6WiVgZbiyof++hlD17wwSI9pjaHJOLUkoMhf2fDW0eR93lUuH8xdOlDD
 /v6Wf5tdno+UaOHng4anTl17nmV/z51SdpR7tLqw4QMQkBOC4PzOMNqc64WO7Suxg8
 6XiHmeiSQV69g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f1ATmLZQ
Subject: Re: [Buildroot] [PATCH] package/ntp: fix build with GCC 14.x
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2024-05-18 12:00 +0200, Yegor Yefremov spake thusly:
> Now, it is official: https://bugs.ntp.org/show_bug.cgi?id=3926

That's great, thanks! And upstream looks quite happy with it. :-)

> I'll wait till the patch is committed and then will make v2.

You don't need to wait for the patch to be applied upstream; just add an
upstream tag to the patch, pointing to that bug report:

    Upstream: https://bugs.ntp.org/show_bug.cgi?id=3926
    Signed-off-by: You

That way, the next person to bump ntp can assess whether that patch
needs to be carried/rebased/dropped, by checking the upstream status.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
