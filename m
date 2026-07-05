Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC48FC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF0B4085A;
	Sun,  5 Jul 2026 16:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDjxkbHBm-Rw; Sun,  5 Jul 2026 16:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A358140669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783269404;
	bh=3cjAjQNYyzj8duy6OH9/wtUOEliyUyvfhuCCsF7MAaw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BZZoit6eTlsrmtq8oWoHjV6uh4sGMqjv8cB31OampQ5rRHgjDUyjoV+zkWgYhcyOE
	 AQEC+6x5o+4J0xMFgXwWPzHfpSIL5u5/mmfL1xqIa5Yazs+MKQcvtycKCX+do/fqPm
	 OIRA66sKPPsMtLNayyL2fOdndMBYaiudCI1GDXdlJuc1z5CXpquceHg+FgZ47NbRjL
	 GWDgdVI1szW+9XgxBR+f6aYxAddX5eMaWjK40hamfOhlM7ZjJ631zsLCjujimEs3y9
	 Sjddp9jOsABWEm6jxo89nN7Yfv8xHRjS0Qs+ezMimvltCnas8U+ovy8pjJeyAS7RHl
	 jWDaXLtKqHgCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A358140669;
	Sun,  5 Jul 2026 16:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBE2316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6446400C7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRVhsf_mGjlg for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B430400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B430400AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B430400AB
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:36:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6B86B2003CC;
 Sun,  5 Jul 2026 18:36:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 18:36:37 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 18:36:37 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, "Alvaro G . M" <alvaro.gamez@hazent.com>
In-Reply-To: <20260703130802.1789931-1-yegorslists@googlemail.com>
References: <20260703130802.1789931-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <5b7344a9896e7a857a54d9db5f2544e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783269399;
 bh=DVSxRlT4GEqVpy4Rq0h3BfcBRtc/pzpTwFSsdxe5Gkc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mxqEhBhtBy+mhl4IIlc8aK84cIxNqlv5ODAm+RGu5oj35PfLjygBrZpsLb3lt78mF
 sBb3uo1WmROjJqzOy2QcG3EK2Q170riUnC9OPRPZdsqDEFXSqQYrZ54F95XpmIQ+K0
 B6BDTbeE6JaSCCZenpLqVnqAwgo/anPRFyHwHFVUrJ4vOVdcB4GZ4ncpTu5JDS2gCO
 zo3fJ5Gyrnfp2NLCHGS860/itSCMGIELShpFcCENEVbusa9ge2ho7mlBBzm4mu/ebm
 i+abm6sWLc9aZ4h0R289caoFsw9vx7jHrw5PtV4f0MyKi/JIS0/ggL/uqwdV0ViaWh
 JSqlNTC9a9VBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mxqEhBht
Subject: Re: [Buildroot] [PATCH] package/libxmlrpc: bump to version 3341
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

On 03/07/2026 15:08, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This version fixes boolean usage for musl toolchains:
> 
> Use <stdbool.h> whenever possible to work around musl libc incorrectly
> defining __bool_true_false_are_defined.
> 
> Fixes:
> 
> https://autobuild.buildroot.org/results/5719bb7f5bd709cebc8012341c0b448a8fec3aba/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
