Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2117AC83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E496940878;
	Wed,  9 Jul 2025 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an394shScDlJ; Wed,  9 Jul 2025 21:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CCD4084D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CCD4084D;
	Wed,  9 Jul 2025 21:16:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9C369
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE4E960B97
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xd8uAMdn5PlY for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 21:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDB2A60B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB2A60B8D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDB2A60B8D
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:15:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BC3386012F;
 Wed,  9 Jul 2025 23:15:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 23:15:51 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 23:15:51 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
In-Reply-To: <20250709225522.0a12e583@windsurf>
References: <20250705174708.A26BE85FEA@busybox.osuosl.org>
 <20250709225522.0a12e583@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <8988dfa096e5b609d2ad78b6c5e6d68d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752095754;
 bh=kBYYta9v/j/bPgSL2C4TnoEAl5fFdjO4miVDOoMc79I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P2+2w3RJVoF0S9Xl2YYLTR1P89jbZwfnVMiLGor+me7neaCBWSkKJzLUsyol9iOBM
 /eVccWmDRTgiarXuEfvmGGA4KZVJwpTjeQrUWXxfAGTmGMUPPyO8cjJoB605waOKWj
 zgSOhIKra2u2xOU+MlI2klk5SF+ayfvVO6VYpGUMOO4o7cq+2hkoFDAy7zHdZMIe4O
 mbkw2C2KH6MOzu+h4Z9p9HsMnOpnLm1lMywCXtg2VDmyKa2gBi/VAvmJHHLWMldD3A
 bqDK08raOkO1Tdy1PobYhiPYo9+tzcsjXId4EbtW7QvWmj0tNC3oDBAeQzeSMgWzm5
 RTeC1rGRcvYsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P2+2w3RJ
Subject: Re: [Buildroot] [git commit] arch: Introduce LoongArch64
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Jiaxun,

On 09/07/2025 22:55, Thomas Petazzoni wrote:
> Hello,
> 
> This commit seems to be causing build issues in
> host-gcc-initial-14.3.0. See below.
> 
> On Sat, 5 Jul 2025 19:45:38 +0200
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
> 
>> +config BR2_GCC_TARGET_ARCH
>> +	default "loongarch64" if BR2_loongarch64_generic
>> +	default "la64v1.0" if BR2_loongarch64_v1_0
> 
> This particular arch value is not known to gcc 14.3.0, causing this
> build failure:
> 
> Unknown arch in --with-arch=la64v1.0
> make[1]: *** [Makefile:4546: configure-gcc] Error 1
> make[1]: Leaving directory 
> '/home/buildroot/instance-0/output-1/build/host-gcc-initial-13.4.0/build'
> 
> See:
> 
> https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95/build-end.log

To be exact, looking at the build-end.log, this arch value is not know
to gcc 13.4.0 (3 and 4 swapped). This value was introduced in
upstream commit:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b4ebdd153b2b068082b452772095260b03b78cc2
which was first included in gcc 14.1.0.

So config BR2_loongarch64_v1_0 should select 
BR2_ARCH_NEEDS_GCC_AT_LEAST_14
instead of 13.

Jiaxun: could you send a fix for this, please?

> 
> See:
> 
> https://autobuild.buildroot.net/?arch=loongarch64
> 
> for all loongarch64 build failures.
> 
> Best regards,
> 
> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
