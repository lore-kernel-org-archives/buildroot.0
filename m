Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710DECCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB4D4080E;
	Sat,  8 Nov 2025 10:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIc_sYlNtxmD; Sat,  8 Nov 2025 10:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C71407F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C71407F6;
	Sat,  8 Nov 2025 10:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9201B2B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77EA180AD5
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMn_Veb4HYLD for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93E4180AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E4180AB2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93E4180AB2
 for <buildroot@busybox.net>; Sat,  8 Nov 2025 10:33:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8D6272003CC;
 Sat,  8 Nov 2025 11:33:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Nov 2025 11:33:31 +0100
MIME-Version: 1.0
Date: Sat, 08 Nov 2025 11:33:31 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251108074758.391634-1-francois.perrad@gadz.org>
References: <20251108074758.391634-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <af497e075960d5877152f3748273ad62@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762598012;
 bh=mAJm9PoQsKlf1R7Bkv/Q/+TMFiZMI037GYuTLbvvixg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tNB/TlUlCHnNiW60H9N3zpZueLY/AmSfUva5bvhl7CdX85JLebgnoeYR2RF6O1hCh
 Jxcx+mwhYI0Wp70R4QvMI992g8Sa/bNOPljfUhxyHkwl+qKKmICjsdrE72Noqs8hXH
 nU+4Bk4yHNna+u5nj6x6QwHIVqfwq8fb7Jigtt8UGcnJaAPcuahpiBQFsB3figOj21
 NHtbWJGVjtFYqlPCAaXCtysZfrVv7JasJjZuxe+ulmXjVw/KOUJ8uuMQ0w0NQyVS4P
 /fZDN6LTUDVRh+c9+673LOXbMYSPCdMo6Re/0cuqtYOmCFc3+082mTbRbrPdAyV0ZW
 qWsGzqVgEzKyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tNB/TlUl
Subject: Re: [Buildroot] [PATCH] package/janet: don't use
 posix_spawn_file_actions_addchdir
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

On 08/11/2025 08:47, Francois Perrad via buildroot wrote:
> fix build, see 
> https://autobuild.buildroot.org/results/c3378c138980b77ad5202223e7e1dbd8443bcf93/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
