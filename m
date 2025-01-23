Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01103C0218B
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB08C403C9;
	Thu, 23 Jan 2025 21:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQlvmPugWH6Z; Thu, 23 Jan 2025 21:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991234032E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991234032E;
	Thu, 23 Jan 2025 21:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE416B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E096F40467
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgPe2aH5QcCj for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 21:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CE2940264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CE2940264
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CE2940264
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:19:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A533FB0051B;
 Thu, 23 Jan 2025 22:19:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35696])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 22:19:27 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 22:19:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20250121221020.3119899-1-james.hilliard1@gmail.com>
References: <20250121221020.3119899-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5c22ff4fee74284c73c2ba3d5f44d918@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737667169;
 bh=/LCE7psV87DDmkPFA03KzxVH2ja6iSPq3/KdRX0VW7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rMvGsPiNvN+AE1MiAtQ6WreYzCY9igaM+6fcDwIKOt4GP0A+KiJgUmMPnAMCgAlRC
 ZlxuuGmdUBYNT5PiKF93v15v+2RRmf5olhw0ueh9wCEG76S84UWSqSl16ZkSHuAsHP
 ccDGBYDmfs6KV947TENcZ73lu1sZZccm6cqsIDZYmnAsDz2e8sLOveynCatwC18bZ+
 htcJtSCY+A+4NzVj0w0fbNXb2P+7tNLjijwYd3gmDsdLET55XAgz3zDj0nSiIFTy4y
 RlPbt8ROlMCFmd9wejc8GpZi++sXJVXdf7IA110Sg40IwkluSU2Re6PUme25LcRlRL
 KHEEiiePUAOkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rMvGsPiN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.36.3
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

On 21/01/2025 23:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
