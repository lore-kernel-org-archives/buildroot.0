Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90737C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B20A80DAF;
	Sun, 13 Sep 2026 11:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSBQ56IlOs68; Sun, 13 Sep 2026 11:03:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5023380C92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789297397;
	b=aWYbkHZIlaA2krXvjqNc4E9gmEKK2WXfYtRGqY5VrULTGNV5iCygEjCsClv6MsOtImma
	 z6f4hgntby05O9wQdh/YAI4LOjcerz76yhWOJoGeyJt1hC49qL+ipie4HCAKRmJISu2Rj
	 i4+RbN6ny5sSlUo8asBrSqFLo08Tfv9+jd2iKsdL+d5LuBOO8qiCVR7mu0BzHVwVBT72E
	 HFoGCGvvzpZeo6M31T5pj/dPJr5cVipSafVSJAmf1l6qPHvZ1TYqi0oCTTr9Gpeh04PFu
	 Grwf/lgaTdpsXrjAqpuPf4qKOEdubSTpyYH5B0U2E1bsiX4elBVpozAAkxjzvK/y6Dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789297397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sJHOADOoS3oPA2P1iel49d1O//vx+C/EJ8IWQJ+UFyw=;
	b=pn74o9PK2EOm7NXp6qm4GDnlo0a5V6MUIiYind47jDUDHBPgDZmtI5GLTiDI20n818jh
	 fDZ4Qo0kCCXQ51KVjvc74zmjuADyBePyQYhPg0SiSZ9g+Ir4zhqPGZ+kyJ12WlpM/3IYV
	 LqH6WbKOlhX4n1fRGjm/CVEt10oCwHzTpITSfB+0NpFcbn/AH7eMaCG8iNE67E2sh/y55
	 bZJT5p3hutTIjfLnjCXliBAVlXYVE0EpWBU3xhcK4ahL1+cXtfRiX9Yg2z/djSqoEid2J
	 8KaZamWAn5ByMbJrGmeul8/+Umb3C6g+qwhVIezqAl012sPhvTkv1qOh/YYQzQrYVQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789297397;
	bh=sJHOADOoS3oPA2P1iel49d1O//vx+C/EJ8IWQJ+UFyw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CX5JtgOYj78FVU6K6/DipwB5DxCulaLZY1BOwue6J4VNi+RnFp8QGTvzQ2OVNnyWc
	 v9n0fSf/AkvcK0/fGJwf7nZqgUN9Q71m3L9mHE1QIw9l7AHrK/YByiInCYkNtbAbcl
	 vj4BvrhVsEfUiUQSTZ3GdbF0RERx9gNfM7QpDj6r4DN0MIPuE6HYzNF/N46oZT+oVe
	 i2jLPqMtv8W+TK7Vbx6AzP5loBnKebfQLwnWq+rH/Hrd+kum7ClaaorEz4Dbd0dPjw
	 Oi8CO7a9qyRWYZp7GRz8Ql7MrEwvDJ7GqCVlTRJrBwWZga9eWJULPYkqEUFm9DF1KM
	 OCLnv4Xu1DHhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5023380C92;
	Sun, 13 Sep 2026 11:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 276AC32F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2BA80C92
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOa_780yp2Mx for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 11:03:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E33BC80C79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789297395;
 b=JU+KeN57bVJweYVUSAIqz4m1Ss1htw/uCMkR0r9zP2V02Gf/SXViQrknJq561u5Y9+kV
 qJZA01f1mqElbAcimfIfn9qejb5ge5vmuEkeYYTdHplwNAnm0fil5MTDjxNVAFaxYY4uY
 HQ+4vVeI4/jjpviWF+zr/NqQcu74XQzhZFluktJAl3jid3tvahKGrASu2M1lOhq7qiUJV
 XGkdzU0N4ckWuIrf9dTBAA1Wdr1oA45zpgTdW7zp/1N8V7RWgQql5pZNwyuV2QUEo9LYn
 RHgvEJ/4CN/ZlukwE4cZ3C/9teUwflCP9Agxb5ovCFPlAqTuEac7IcfXuZydkmW14MQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789297395;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=xuw5q9q4NS7y0sjNQ6Ph+oyfUjjRcxgnKSFnjc3USn0=;
 b=M/Egoj3OSZ1aFyTjHGuP1FjWP49BNqA20ofAcigSyxdyt9WjmPT6JG874OFioaG8f1KY
 We7setP8kG/mMbrr3Tp2WFPTmc6LOOWD2PNTRA2/lmx3xrQSDnQbHEAqFxkJyoHhlKPcP
 K8EYa+XVyeebpl7ajaVEcxZ5r8qgt92UMabUamcXstF0QLIp1aqOoiHGj6vYlwyVBSJar
 B9nMnjzibsvRzZzsfukrHjkVQfzVab79ADGVScmqZLBRsuInlSDInPvyOa1eDPT6dGjJk
 skN/lbRBqADUtgs/ZvoDvhHYumTbUBYGXGnGjkL2IC9zAfBDGeY0EfVCfQlZ4kOHmvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ERYphgW6; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E33BC80C79
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27559780368;
 Sun, 13 Sep 2026 13:03:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 13:03:10 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 13:03:10 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260908080807.413351-1-shirokovalexs@gmail.com>
References: <20260908080807.413351-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c72561e5d4bee3aa8bcf58b3b50166bf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.45.1
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

On 08/09/2026 10:07, Alexander Shirokov wrote:
> Changelog: 
> https://github.com/zellij-org/zellij/blob/v0.45.1/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
