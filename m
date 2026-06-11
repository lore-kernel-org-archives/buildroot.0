Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764BCD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFA282302;
	Thu, 11 Jun 2026 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_-YkClm-O3q; Thu, 11 Jun 2026 21:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B5E82300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781211933;
	bh=6rAbhe4Ky0ABbh+PnTCGK9vMKtzQqscFfOecxBzSrws=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GzxkS1Yr0tIvThVtXjZSGIPCE6Ca+PzXSeU2UD0lIx/kVn0Sw09fM/4NSL8jiVuqA
	 AkuArPRKNjxIXkmGbWU1JSLTtJ6FAA2QRr4hfHaaPKoYs4Ff3iyHC9tHSRtefTHIfJ
	 SGUPLMuaWrZoj8c0nSIG/V8VR9yvBWXa6EiMr0WAvI1wALGdYDAK2TAYxNSGwmtg+y
	 3ijIVx53fygTIYLA/J+PAszY1PtG/xCDkQJ8/uujgKq4otuUU7fshSamMXazr+kWsu
	 CSyA+caIuKkTfFPt3Cb+l6O/rzVMmI7Z/7ikIykQpNw+a92z/twcYRLXSn12eq+Qqw
	 YCdTpF5CsQIZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B5E82300;
	Thu, 11 Jun 2026 21:05:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 282B3F4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17BBF40E58
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOhR-h3mp5VT for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 21:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21F9940E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F9940E44
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21F9940E44
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:05:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E737978034E;
 Thu, 11 Jun 2026 23:05:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 23:05:25 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 23:05:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260608182422.1212850-1-dario.binacchi@amarulasolutions.com>
References: <20260608182422.1212850-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <8f92b0f1c9d838f5ac306f9be50459d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781211927;
 bh=y1TEJQINSJv/BbqhIReLm7Q7i5mOc00Tjtrfft7fwYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZMI4sj3/v7XTqKMPOOifphUpPUoilviBnupDq7hXN9DmYUv7XxjY/onG7lIf8iPVm
 u85xAN49PKTvuBRfZ2PhJbWqi1mS0L1juxOvWiO1EggOZ8MmXC5R04i7peYJQ2b/8B
 RGBFy22N2Mhb3HPHIrK/juPmQVYbNS01RkeVb45T2qM2vRTficEtb0nk6v9fTcr9lV
 f78cdHq4+LXbKeqGEm/udbt578Kp+YHw5AbAxNHTWhBhEbgZPbNRFcU/BWOZEjb/VF
 q/Qc10JhZxcOKRVJJOT998XZN0N0ejfkPZnWlf1xxgOP2nc4wiH2JOHVly749KXo3P
 sIIfbL1qPDeYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZMI4sj3/
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.2.7
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

On 08/06/2026 20:24, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
