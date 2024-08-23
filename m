Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B30DC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 11:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F403C81EE4;
	Fri, 23 Aug 2024 11:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tpg9F_VfyY0T; Fri, 23 Aug 2024 11:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A7F181EE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7F181EE5;
	Fri, 23 Aug 2024 11:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 766751BF304
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 11:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635BE4016F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 11:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DS2hwwCFm-a for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 11:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 167CB400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167CB400D1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 167CB400D1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 11:03:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.6.60.93]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1ssyef3XFi-00An3p; Fri, 23
 Aug 2024 13:02:59 +0200
Date: Fri, 23 Aug 2024 13:02:58 +0200
To: yann.morin@orange.com
Message-ID: <ZshsYmf4qZcXkEZX@probook>
References: <cover.1723543467.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1723543467.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:gk3Rmlhr8a8XUsSt6VHa9/KqoK1K2XnfYevjFa+L2ij/moZRiny
 A79pG40IUj/TxF6ELVEVuoh7yl3/iX4u7xhKXbgXrplRdJGP++cNGjKlKj5Yw4R58SV7hd6
 ddY7SNZeAwo8bt/BjDPvOdVcm2w4IgkJjxnw6d6jj/n5k/zKV2mCdsSkN6rpBm/Un1NzgxL
 1i/rsWPWElgvjWaFtMD5A==
UI-OutboundReport: notjunk:1;M01:P0:N/IS0Y3YOkg=;RoWxxRp3GFOlmetqCmrsPZpToSK
 C2J7iHnxS+68h+ZTuraOWQgVfwRw8RpHVmogI28rItwiEv0Yq4lv9U50i96tmWxJgE9EAfwAT
 e2a5sODkkfmcIFTNFk7Va21lqcCwo0HuukHxmp1iBUn2go0M7wnrINJ3cxnajKlJ+Qiu4j1ec
 y3vcn/CBziTvDeeEVwP7VKuAjVZF26GnzGmqT8w51EXjgEfa4OVnphIBmCipy3dmihF/Xv3jk
 /mcE9HYZlbKP5ll9QXEmPSMtdiED4fnOWnQPs6Vgsg4+48kQT1nsr1RvOc6TjwFj0qu+Oww8R
 iejfMoWRShjZLCcyRa+KZQM4s2DqDFS2YAvDkSMZft8yHrAYG4oNjBZnq9yUAc1olEwr6N42q
 uJJkCXs0Ix46Kq/xo/7/ndjVj1iBh1PTkgmq3RFAtFPO+HLT5uQKtyyZHZZ+uOYUFF8TI8emr
 DOA815hfkJ8pH71O45lDfz2Wpzw/bs5TP8acgSJRmgshLzb7vklA/wAxMTzzEbk7uTWo/1sB4
 nH604Iw2i+3yolIY12RMvnHEdGSO8ooEjWpDlv21gt3ZIZQ8lzsYesuRCMMN2oCp1uhsru3wc
 cXL1mQZK1PGSirDALjjvU7C4+/I+kQsJ7KuIY3eBRDbjS4cLIlcFsFkdr5qEAkM62gcZPChja
 ANaDjPF39Wq8gCZ4sgUr0VPTlADbcV/wX5J6ATehH5+t+wwB5+IN+5QZKiZOP2Wbz+2IJCQow
 YhVPpF/NJMWsbb0ClM69wWWWHF8Lp+t+r5A++Sc1iZi5KcmLAERfL9/zmb/y5za40EwFe/rnJ
 Y9jyE8uQ9rhLeb3s09scFsWA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724410980; x=1725015780; i=j.neuschaefer@gmx.net;
 bh=WvCmhaPqhceL6qLZRE2OBdy49bTNqZoMKCdcHjL9ojs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=If0HF7Hb2JelkHWh4YMUGbgSfaczBPlgnWUGmD+md6MkzQHKXhqHqWtgE3qmmsP5
 uE/d3g3mhFFkVuH3sJyrcaK7U/y0mcjN4l1dggEY/WeWFfWzWLynmZt/7FaHxKwEh
 IJHnX1E1jyZP+9+StIDtZijNam5/YvH307ZI+b0LxpLBYgSgdni9sAKESgpQMmlKE
 MDrNAdOYRWn6kL0hFxgqIY1GQ1j6KgIwNg8DChTHE86e8v1DdNXhtpQWY4X5CZgCf
 uEpxtv5YYOiSnk92wHHSoLgbLnzb3oyrCDePz9gEtqK1ifFX6a/0NY/2FM3gAttZg
 ZbrzlqqtZtCpYoUZrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=If0HF7Hb
Subject: Re: [Buildroot] [PATCH 0/3] toolchain/wrapper: move -ztext to the
 toolchain wrapper
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 13, 2024 at 12:04:28PM +0200, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Hello All!
>
> Following a discussion with Thomas , we were both left wondering why
> -ztext was not handled in the toolchain wrapper, like the other similar
> flags are.

Simple answer: I didn't know about the toolchain wrapper at the time :-)

> This small series is an attempt at making it so.

Thanks for taking care of this!


 --  jn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
