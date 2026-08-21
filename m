Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9244C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 22:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55F040C71;
	Fri, 21 Aug 2026 22:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GIbnx6CnXAl; Fri, 21 Aug 2026 22:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787352609;
	bh=EQbuzrAnoRqAFPmnBp7WN13kdfJKdO1T4gotgUC4GC4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MCiHXFpHD2Cabuv6nYxIIjxY725MmTdnADSJlyKQz+WQ5za1TO0iRABoJJyhVvMJm
	 pWQ/Sh275ZZYOdjXVXRK/ZVIMK8orYyA9r+HVk9bkA9zwGkhb6U48DPtZGTXztQeC8
	 WH4u4C3DCCCoFREg4BgchxwrrLcls6l3An+pncwXlT55UQsBgiTsGGTHHllyz8PPPD
	 KfIbk0bCGgFYkbH/wnS8/USe9uNLelPt7HcmURVO2/NwHNEXRTVYXA2buOOvPLV2jO
	 HFPSGDBXFq1Rf9fEQ+da635cd8GcAnuNK+WaRQnCElzjYXDSseT0/DF0oSq81kFloz
	 8GY/S2BgQBZUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F0B40C11;
	Fri, 21 Aug 2026 22:50:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47DC4118
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A0CE40C11
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rs5KP2cAcF_w for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 22:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4470A40A17
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:50:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 897CAB00548;
 Sat, 22 Aug 2026 00:49:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 00:49:54 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 00:49:54 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260819171416.2585284-1-neal.frager@amd.com>
References: <20260819171416.2585284-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <076cd2beb9e0de8b83fe0638f579e875@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: versal2_plm:
 configure xilpm runtime lib correctly
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

On 19/08/2026 19:14, Neal Frager via buildroot wrote:
> The xilpm_runtime_lib is not enabled by default in the versal2_plm 
> Makefile:
> https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/src/versal_2ve_2vm/Makefile#L13
> 
> Without it, there is a silent runtime failure.
> 
> Add config XILPM_RUNTIME_LIB=SUBSYS to make sure the xilpm_runtime_lib 
> is
> correctly configured and included to fix the problem.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
