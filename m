Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F55C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CBCC40BE8;
	Sat, 29 Mar 2025 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRtSMiAWdSiA; Sat, 29 Mar 2025 20:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6941140BF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6941140BF0;
	Sat, 29 Mar 2025 20:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D016412A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B697F83A45
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-hUKxPk3wWH for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:46:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDC6983A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC6983A5D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDC6983A5D
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:46:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0191519F5AF;
 Sat, 29 Mar 2025 21:46:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41212])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 21:46:00 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 21:46:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323072519.3477-1-bernd@kuhls.net>
References: <20250323072519.3477-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <9b8722ad90e7894e0772a12f99c26f81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743281162;
 bh=ld0W3iCRLMVpYfwIBc4LudpzQl894t8VkZiEhc/VYso=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RGcyIVlO6P0tNoKkLMLSNA3Dc3Uc9Fd/pGmPKmZmYf8mjIQdD3tjx9Tqhv7iCmmLU
 aoOsaZIezNp36HQfEpTyRYwph/gUCF+k/dXjP77h/F5xotTt25tWP1H1nXOzmeFC0V
 v66LQ9iB27Wiyp/mreaNWgMx2cVNmuHAuvmJ38PX5jERRxXdy2vlJdboEd/IKXcAO2
 CY757rnlOx8wN6JGwAZk11BshsDuQmZLghAPPZa0OlgriVV1mKiOjj61gKIW5w71gv
 WkV2eZ0gkQRgH3ApLaCIYGpm4JzifNT3FQ3ZGXG10Q6A8X8d7FcKjIlikGv9wSBQwH
 ndJNyl3yCXtNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RGcyIVlO
Subject: Re: [Buildroot] [PATCH] package/freeswitch: fix build with GCC 14.x
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

On 23/03/2025 08:25, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.org/results/33c/33c41d8da8190933d863ed6f75e5d586d1c22a2f/
> 
> Build error is also present on the 2024.11.x branch:
> https://autobuild.buildroot.org/results/7eef69e6587783307cd9231abdc4a2fee60c075f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
