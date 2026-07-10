Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DF6C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 17:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D9F60627;
	Fri, 10 Jul 2026 17:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqChGiCJpMbD; Fri, 10 Jul 2026 17:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E9A56060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783703430;
	bh=CE/kr52J+ib2vi4275e05RsBW4jgIMlAxACbC1jwFUU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F8zsGmNo1AmutH5vj7fDkSenkNRtfvQM+voXduO7O4wg48iXFxN67yX1DaXC+M/61
	 mWwfJovrSspv3rJ1K3P3NFVbgbl/JAX3RoK95WJ1Gyyu7pSr0PrSSKkGHWG9dRD6Ov
	 W5zhrfz3DxpQ+afaib7zwLiQ33qSe+t+ST/b1LtYjN7ajVE/hRf9dLL2YCPWxSDClg
	 exTTUuLqUObIuOtwpEJfqaennmy5+knF9Yih8312zRVwCj8ihtUubkbLimSzvxrhGc
	 HpNHW+RMc3ApqUVpcdRMolvRKThr7nG5/YZ7Obt2NP/LxZf51BkVWvHYT8dacvbXgL
	 O9en3N4Hbfoiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9A56060C;
	Fri, 10 Jul 2026 17:10:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02425320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E84E16060C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ry7Z77MEOYy for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 17:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E7F6605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7F6605F5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E7F6605F5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4C1B02003D6;
 Fri, 10 Jul 2026 19:10:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 19:10:24 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 19:10:24 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260625150012.1505793-1-dario.binacchi@amarulasolutions.com>
References: <20260625150012.1505793-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <57b64a0502e065e7a1a1e677eb058d3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783703426;
 bh=Pklm1p/sOmtc4DI8L1/9ewlgJCRcQZFPz7z1+wK8TAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NevYPw/lciQ8/EFYPcs/vk4Ah7KAO9H7XLyqrjVylj2Ct0opEZ47fFT/yFmyLs43g
 gcbt9etuvCdFbGCSuKP//NkQcLxzUwB6uIHio/IyNMHUI5t9pJw0lebn8tRc2rB00H
 KgELrxmgAaE9rZJD+K9SwYL4IDtn8I4l5k80KMFX3nhnkjvVVLddssoZ867G5te41x
 Lw7mFXRf1PEdwKghSJgEFQPzujM04TOIYrt3xTJyC1BKUAOeSiGW8bQhr7APMOjv+j
 zOyWoDnWPWUe/3fVaHxMbygY/rs6vsY7Pgc69C6qJdrVcwM/sdUSrEeuQnjs8sCYOu
 +NEGrP+xz7Vog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NevYPw/l
Subject: Re: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.14
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

On 25/06/2026 17:00, Dario Binacchi wrote:
> The removed patch has been merged [1].
> 
> Release notes:
> https://github.com/jech/babeld/blob/master/CHANGES
> 
> [1] 
> https://github.com/jech/babeld/commit/f8e5fbb33690b516b8516590def5136e6619de4c
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
