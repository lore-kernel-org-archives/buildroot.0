Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1FE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCE8605E6;
	Tue, 31 Dec 2024 17:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12sAXYDJ-PE3; Tue, 31 Dec 2024 17:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FEC6063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FEC6063C;
	Tue, 31 Dec 2024 17:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D6BE968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B87D8101D
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7k4Aocy2Nrls for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80AA08055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80AA08055A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80AA08055A
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9400A2003CA;
 Tue, 31 Dec 2024 18:30:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56728])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:30:22 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:30:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
In-Reply-To: <20241231151003.1765652-1-thomas.petazzoni@bootlin.com>
References: <20241231151003.1765652-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ad38f64c0263e037256fea903d7cfd7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735666224;
 bh=k2PhkZXAc5di6NPimFhnBjNj5TgI/l+eZFRZzpW5Tyw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u9OhdIXuCELUkVPDgFGHZPPrXNibGroS8OZYe2rIGVU/4J2kOIYnchJzmWzFui8lL
 i3CUR3Y+GRnjy2whvI/jJLVqO15qXWaUf/mQTZZDCvaXFjBxKL6KxuYwbICYdL+CQS
 fXy0ToCHN2DXvXU3329OhfIzUhvaCzh38KTVCwEIoW6R0fKBvulTj9+UfrAzOaZMPF
 POFOHzSLX65+OXlGhuxagG+FW2aKjI19nQVbHgf+WW8unzrC14A03m7UmQAUdkcpM7
 tTKzSizb+8R9X3zXvJWUtRE3/VqGNRCPU0zjeTgnhAnRDwuZWXVWXnZBZlBCk+BJVy
 e5zLKqfpp3MMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u9OhdIXu
Subject: Re: [Buildroot] [PATCH] package/emlog: backport patch fixing the
 build with Linux 6.12
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

On 31/12/2024 16:10, Thomas Petazzoni via buildroot wrote:
> The emlog kernel module code uses a function that no longer exists in
> Linux 6.12. Backport a patch from upstream that fixes this issue.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/9233db6ca0e70d8e90a3ef59e521d1398724502d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
