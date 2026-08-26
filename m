Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC8C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DDA80906;
	Wed, 26 Aug 2026 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whJU9vfLQtSh; Wed, 26 Aug 2026 21:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787781132;
	bh=swxJ47kl+LcfHpxbr4Sg+5T49dvKu4eoNuTdmwOMpqk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YacPDH7tZB1aH0nWGyqnskCJKXPRW2o64pUt2O5u89F+43rHvDSPU/Fxjs78dqWwq
	 xV+i0/Q8sXj/vtP73TRH9gFjW2Zrqfr50uGqOBGv2rjOMe6WfuzIgNJ4I9PFQBRq7w
	 Rf4rXIw4rj0k14WBuIyqVJr62E0PJ+hQBffcit/FX1vwjSRXlm9S4EUPSuEn1/tfrg
	 +16iU6Voq9RynhDD/fYgDD2f0fY7SyAf1EpVGJ7KTBkCDLFRVeOjCwAPDIBFMPKKNR
	 erssr/3V7yIly0BT6/oUxUATeNdLlQhCsvRGEZgClb55oz1qutPCYh+yi9rdbcVR3/
	 TfBjglhdKl01Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F8B80560;
	Wed, 26 Aug 2026 21:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC8D3A4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15F8840766
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0ek1mi4vhDE for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43C5E40746
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:52:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A78102003C1;
 Wed, 26 Aug 2026 23:52:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 23:52:06 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:52:06 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826193134.3720281-1-romain.naour@smile.fr>
References: <20260826193134.3720281-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <5c4fc4a0ba9e8485cf58724f89b5525f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] support/testing: TestMdnsd: improve test
 reliability
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

On 26/08/2026 21:31, Romain Naour via buildroot wrote:
> The mdnsd runtime test can randomly fail on slow runners.
> 
> It's hard to reproduce locally (only one failure after a few attempts)
> but we can reproduce it easily by removing the while loop entirely.
> 
> It means that the "sleep 1" is not used on the Gitlab runner.
> The timestamp of the failed job seems to confirm that [1].
> 
> 07:06:55    [BRTEST# while ! ifconfig eth0 | grep -q 'inet addr'; do 
> sleep 1; done
> 07:06:55    [BRTEST# echo $?
> 07:06:55    0
> 07:06:55    [BRTEST# mquery -T _http._tcp |grep -F 
> buildroot._http._tcp.local
> 07:06:55    [BRTEST# echo $?
> 07:06:55    1
> 
> So wait a bit for mdnsd to be ready.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152862
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
