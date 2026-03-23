Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1175F483F7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C4C40B3D;
	Mon, 23 Mar 2026 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sa3cplCWU7PP; Mon, 23 Mar 2026 20:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F9440B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297678;
	bh=WlcYoWiRyL6eOR195JAVpKXdsT4cgsnof7sHyVHUWS4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TRaw3b+lA1XfJ9LMBX5QdWqGRcLyQdrVACc3J2/ri6ivPznCEmf03KV5P+bjH1AcV
	 05z7sm7wN+FUDCrnvlU2P9tQQHoMglp56ljSl3WVOrCVKXHP92qmIsSmooXj7grIIe
	 XynSyold4KaSMXeFJp4NHbmfwOGH/r+JQoHa3YXeKN6wvyZOstqelDm4g0+osnVArp
	 KHIlctmqy/DJ79V1n4d+UHl0Wzg/JGf7AQkCBhVOEXNvnIaqqiDP/ZLPqlvsqQyxw6
	 lOv0Q8hbY655tIzkZY3cYH9WjOoMa73W2kesx1dkLbQ4lPyKtlJWcnG+CdJfOfDnt7
	 mKDonTlGi6ieA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F9440B39;
	Mon, 23 Mar 2026 20:27:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CAB0353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E76340B39
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8DyxEBlb_qj for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F2B240715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F2B240715
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F2B240715
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EF30AB00583;
 Mon, 23 Mar 2026 21:27:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:27:52 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:27:52 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260323102431.250660-1-giulio.benetti@benettiengineering.com>
References: <20260323102431.250660-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f46ccab821e795752e83cf64d7cc0db9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774297674;
 bh=ynlLWLfN9r3/CLPft0h/f8BUPf0od7k6A3ffhan+ACY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H/7FRITbCLUe2Igs8cadyvejvsxGxWqw1a1DkkWjeWNbKY99WjCyOf911HOjydFzE
 BSAHwb0mywoFZpU0eHt2wUVTkl30fTcgDBpC1YrPGAPZt7+OMTkPVWMVdQXQa+4n0V
 ie15N4j+U/HShubJl/4ie9IKbnSFwBTORyX9AuY0bWW28Ve1cmVoX3yGM+ln6q0KJL
 p2fGVQEV/ZMDoMnHUe8Pkuw2IuGTHEpFyFsL4waK7B8SCXdaprjDJjhbQ18DcukM5H
 /Yh/mV9Vdoyz84j8MQEnbv4aU8Xl3PheC/DHzmBSo59qG32fQpPFjOAuLHROR9ohlz
 SPY0VUtYqF/Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H/7FRITb
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.18.2
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

On 23/03/2026 11:24, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
