Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B1EFCC04D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FAE83D65;
	Fri,  6 Mar 2026 18:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59RhjND289R8; Fri,  6 Mar 2026 18:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B0A83CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772820471;
	bh=6xwVVDFL2Xl99t+qWB3UE6SpSEITOrWDLmsScY6d5tw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aZNRz3COpWIqmQcvrThK6tcho5YodnG/KCjZZu25Ng0t6MpNzN/krIU2NqAvIB3iA
	 7ZkPjcAZFLtKYpaxfKeXP/LsvYYk/tks++0LPoRKt7J1a+j76YmEGN4eZjzkuplAPR
	 klD40CFfMiPJk6eOKZ7u+XXcy/7V5CA/Y9U05MwxDS2g6kBuPB03zuujZZ3RfVN5Qi
	 kv5HSlMoQq7OnQqSYhbeVamGppEBPWvbyHrGflTRcFBezGc6Y1sxRKKoDdYd8YM+ku
	 fgYiGwLLKhEc5gBRDaW+fc0G2yuCdeTgf2Kl60uhCEL2QfRHzIZXq/pL5R+TFR6IIi
	 +9gxRTWw0RNJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B0A83CE1;
	Fri,  6 Mar 2026 18:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F57725B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74C2761331
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrajOfjJAAlt for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C37D612FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C37D612FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C37D612FF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5034360134;
 Fri,  6 Mar 2026 19:07:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:07:46 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:07:46 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304164104.1764264-1-giulio.benetti@benettiengineering.com>
References: <20260304164104.1764264-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <52af06b15df3151d9d6631174a9754d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772820467;
 bh=jPW6wCAlNKF5Jz2eMYAcTgeEpj+qwFYiu5ANEekmXvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=omZGMMpv+q81mIvmV+iR/Sg1GEv74fFHTsibCUsOKaQwCKjJt5RItDjvLz1hyPBsI
 5NpLrAjZsG/RI1lfJySEPDAkR+OBSBcs+sF2CxXXsjE4w8ct4F+UAaP0ceXn5frwQW
 YEt7HGBMpqU5+9+M4QwqCSLPQuk0AexB1qFwAo8axRLeesUGxdH4BZp/1VSKNVUWeO
 MS7jVUhe5yLpsoigGgHvDZwtzuzTadN+N+dX3QiBtvqLRYv6hLRoYPtgl7Ym8eRlPW
 BkwBo9CNu5INXz0RJgDYybun/TRH5ZR9hM7XSFm8Rst9DxCQ7cxV4IR3uwYGIzJzFh
 eUaedVrecq3Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=omZGMMpv
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2026-03-04
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

On 04/03/2026 17:41, Giulio Benetti wrote:
> This version extends the Linux version we can build with from 5.11.0
> back to version 5.10.220.
> 
> Fixes:
> https://autobuild.buildroot.org/results/fa0c3acfcfc94b0600842ace6d8b09ba2c6c593f/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
