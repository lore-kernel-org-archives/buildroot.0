Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF434C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 18:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A0083EE7;
	Wed, 15 Jan 2025 18:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gh8u1MHnJIMD; Wed, 15 Jan 2025 18:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9962083BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9962083BB8;
	Wed, 15 Jan 2025 18:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E3BB89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 18:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC8E40173
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 18:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFnGjXqI6hLa for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 18:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6823E400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6823E400FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6823E400FC
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 18:34:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 13EC6B0055A;
 Wed, 15 Jan 2025 19:34:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40402])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 19:34:27 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 19:34:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250115163310.164964-1-peter@korsgaard.com>
References: <20250115163310.164964-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1db7717b637f09ce57b158614037a934@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736966070;
 bh=jjHROlinBrmetvmrlFeKz6sYSwrMsltR432LBT0vUzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TmSTKTUnmrJ4poUdpKLPQxIgI3JtSL7dnFtEqZQpIrO1CMVSLdk+KT8PQpkwMY3oX
 rtY0IWDNWSqZFToPnX3i8ot4fuPLpSOsSO8fAM84mh4t4p98Nc4lMTXCALkzaNL+1O
 QUVw0ciME4MtvxVs3ChRrx54OF1sXCV4Lurj3HXgF52/ZKXq3tCL7hGhnXzdKJBrwh
 vdPZBY8fl4SpdCw4ZYTOQiWixquSBKju617LvnslFv9jCGqgqEFri+U8OdX6oMPYx9
 9tend1SKiz1HgxM7c/CPi5nPbq26A59iJZBLhcTfnF3IYCYu2C9CpF0jrT1TSRDtcx
 kFta6meQyysHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TmSTKTUn
Subject: Re: [Buildroot] [PATCH] package/rsync: security bump to version
 3.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/01/2025 17:33, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
[...]
> For more details, see the advisory:
> https://www.openwall.com/lists/oss-security/2025/01/14/3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
