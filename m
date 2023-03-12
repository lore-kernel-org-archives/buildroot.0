Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A058C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E65401E2;
	Sun, 12 Mar 2023 22:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E65401E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Nf3_WCRcpAP; Sun, 12 Mar 2023 22:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 210C4408D8;
	Sun, 12 Mar 2023 22:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 210C4408D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6FED1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 805C481990
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805C481990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZfdHVxrCtFF for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:54:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 444058197D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 444058197D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:54:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 5CBC3780344;
 Sun, 12 Mar 2023 22:54:17 +0100 (CET)
Received: from 37-174-98-73.coucou-networks.fr ([37.174.98.73])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 12 Mar 2023 22:54:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230312133434.3081ee6a@windsurf>
References: <20230301220159.161476-1-ju.o@free.fr>
 <20230301220159.161476-2-ju.o@free.fr> <20230312133434.3081ee6a@windsurf>
Message-ID: <c7ca2041d49a6736f92eb7b1fd51d342@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678658057;
 bh=4CqzR3djD1RyTQheuV7AML22OiXENTG/eBOZlfgZJM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TOB+opbv3fH7+f5N6ReLQAATUk6gOuT7sbjg1NT8bxaCeZV3S9Oq0Li/DBEsYKno9
 d1zDFtdoQc6Pes/dADrPNsPp4oHdzKu11hYE+QAHe8U2ecKPhNSEB6qiT7Ks3k3fCX
 C6i4L2LRlHS2F4KiI2MrMWRalgkv2Z3aupYqJJfUWrtUpySNCFwCbOKiK0IxT3XRQM
 kRiAtadotuy9GV5gqX8BffTGC27M1lwEL4pdhVBBIALINaQWBdH/UaHFOmT9ocOWQQ
 WdO3ROL5DlLCLnXNMNKW0rnD6mbXTZMxeiQoPUpSgkFxariaIOSRh3b/SXkgbVa+6u
 Ad79nfi2d+sFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TOB+opbv
Subject: Re: [Buildroot] [PATCH next 2/2] package/kexec: add
 KEXEC_CPE_ID_VENDOR
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 12/03/2023 13:34, Thomas Petazzoni wrote:
> On Wed,  1 Mar 2023 23:01:59 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier
> 
> But then you also need:
> 
> KEXEC_CPE_ID_PRODUCT = kexec-tools
> 
> indeed, by default, the value of KEXEC_CPE_ID_PRODUCT is the name of
> the Buildroot package, lower-case, so currently the value of
> KEXEC_CPE_ID_PRODUCT is "kexec", not "kexec-tools".
> 
> Am I missing something here?

You are right!  I indeed missed the _PRODUCT.
I'll add it and send a v2.

> You can double check this by running "make pkg-stats" on a
> configuration that has kexec enabled. In the last column of the table,
> it will tell you if the CPE ID is found in the database.
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
