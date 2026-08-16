Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52AFC5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DA580EC9;
	Sun, 16 Aug 2026 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXkEO4hWfArD; Sun, 16 Aug 2026 07:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A4980ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786864626;
	bh=AS+YxF8Mbxr+H+Kk28qmWCbC29aNr/gf0JCLeI2AHJQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=REoyUQYu1eFtJmRn1sZK8Lc5vjPI//NcCpeGD5hiOvib7+cWxifGKcdVzr8PhEoVH
	 bP226PadZQ/feJgP3BdV1LF/LtUt5TnytIodweBKDaeE4hy4KNcbfpbm5Kb42FEj2f
	 UlQg/LkpMMekA2e/NS8xpIDbbpTABTMUhhVPl+Z4sA0D+KBrqMdQ/mXw/Yd8KtTzz6
	 58T0K3C0Zyjx0K6ow302zlNQapwC30RhHKaF7dlHKp3OHDUsBFOXoNd1nR7GkeJ87E
	 iV4l3+z+YVu16hwcqNKhx9vQm+54DLUS5oc9iStaHumRaTbAO9HaT8hhPNSE8aa20B
	 Djo3tJebMwKZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A4980ECA;
	Sun, 16 Aug 2026 07:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52570334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4174E80ECA
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20nJBodY4ZbE for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 344FD80EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 344FD80EB6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 344FD80EB6
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:17:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 531B45FFB7;
 Sun, 16 Aug 2026 09:16:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 09:16:58 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 09:16:58 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <a89c6eb42eea4e1609f0a75dc157191e@free.fr>
References: <20260811045801.234968-1-petr.vorel@gmail.com>
 <a89c6eb42eea4e1609f0a75dc157191e@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <5588dc00d19f533a6e87325c19d92330@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [RFC][PATCH] package/nfs-utils: bump version to
 2.9.2
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

Hi Petr,

On 11/08/2026 21:35, Julien Olivain wrote:
> Hi Petr,
> 
> On 11/08/2026 06:58, Petr Vorel wrote:
>> Remove patches upstreamed in this release.
>> 
>> Release announce:
>> https://lore.kernel.org/linux-nfs/dc0f6f41-84be-4a70-92db-89890bded3ab@redhat.com/
>> 
>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>> ---
>> [RFC] Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
>> exportfs [1]. This is a regression from 2.9.1. Buildroot uses
>> --disable-nfsdctl => we should probably wait for the fix.
> 
> I agree, we should wait for a fix before merging.
> Please, send a v2 adding the fix or including a newer version when
> available.

For info, a fix was committed in:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=67ed1bdb1af1c70a5fd3b377a997401b7676b827

So you either include it as a package patch, or wait for the next 
version.

>> Kind regards,
>> Petr
>> 
>> [1] 
>> https://lore.kernel.org/linux-nfs/9fec9f1b-1c10-4a20-8282-dfc9addb4ee8@est.tech/
> 
> Best regards,
> 
> Julien.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
