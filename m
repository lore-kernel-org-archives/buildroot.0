Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDB1C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C66682B34;
	Wed,  3 Jan 2024 20:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C66682B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pd7Itm5ptWK; Wed,  3 Jan 2024 20:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058E982A56;
	Wed,  3 Jan 2024 20:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058E982A56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5B71BF369
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7522382549
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7522382549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7SZ1Ik0iFnP for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 20:32:01 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC10A820CE
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 20:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC10A820CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 079C6B00572;
 Wed,  3 Jan 2024 21:31:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Jan 2024 21:31:53 +0100
Date: Wed, 3 Jan 2024 21:31:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZXEOQnqVJpzVAVy@landeda>
References: <20240102155552.1902447-1-abrodkin@synopsys.com>
 <ZZR2I87QpH7JFOpp@landeda>
 <DS7PR12MB90419624B8739BAF541F133DA161A@DS7PR12MB9041.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DS7PR12MB90419624B8739BAF541F133DA161A@DS7PR12MB9041.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704313917;
 bh=R9sQ6HNikX3DrHQTjIrWimQHInxwVlK9h2RaobwnpX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eejxsG0uiFUWQbrL6cQzpMn0pRoKWUQVmZRrow/u47ARWyT0/Ewe7dUABrxgx8vhJ
 3dSlSWW+6yAIir2l7x/Z/93DZjnJOY9WMU8EE7+AOzvLa3sHsQDqihMW7snzYyg4bc
 rWv3aBYw9Lq6SnX2vp99jFdQyHohxEF6a1kMwz1tBLzjAYuzO8iAqfmdH2FrzFB54u
 PZ8M6ElxVxdzcFzSijYFarnWbnTkD5Euz++IbHMyAaUrU1d15W86xAXAZ6rbGP+QTT
 Wfm05z4C0Da5bhjO0LxtTuaUH+nfqRYvrmrq1hqZ1R8Yejx0HcuVGqSuOsefm2YJlG
 adT1J8Ilzh0LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eejxsG0u
Subject: Re: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2024-01-02 21:55 +0000, Alexey Brodkin via buildroot spake thusly:
[--SNIP--]
> What's moreinteresting, that option "--disable-build-with-cxx" was removed
> in GDB 8.x in September 2016 as since then C++ is required, see
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=cf6de44d75082116865a85cbf94db2632b679361
> 
> That said it's totaly fine to back-port that fix to stable Buildroot branches,
> but since it's not functional (it doesn't change anyting in reality) I'd say
> there's no point in back-porting it.

OK, that's Peter's call, so your input is going to be helpful to him to
assess whether to backport or not, thanls!

> Moreover another use of "--disable-build-with-cxx" needs to go away, see
> https://git.buildroot.net/buildroot/tree/package/gdb/gdb.mk#n188:
> ------------------------>8-----------------------
> # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
> # when we don't have C++ support in the toolchain
> ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
> GDB_CONF_OPTS += --disable-build-with-cxx
> endif
> ------------------------>8-----------------------

Indeed, and we do have the proper dependency in Buildroot already, since
d36f2c73331b (package/gdb: remove gdb 7.12.1) in 2019.

Good catch!

> Do you want me to prepare that patch or you prefer to quickly do that yourself?

Please do.

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
