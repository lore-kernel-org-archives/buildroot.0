Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4469D111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B46B40578;
	Sun, 30 Nov 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWXD-j1ukNnD; Sun, 30 Nov 2025 11:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2FD404EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2FD404EE;
	Sun, 30 Nov 2025 11:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61172351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5363481D7C
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeiA1TlzHYNd for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 11:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B949A81BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B949A81BD6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B949A81BD6
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:11:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A05E719F574;
 Sun, 30 Nov 2025 12:11:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 12:11:31 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 12:11:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251122222358.1913345-1-bernd@kuhls.net>
References: <20251122222358.1913345-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a9d2e2be6d4539c652385e0a30b0faad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764501093;
 bh=9vPXFw8Asq4+JZ67/o0t5J8nvq/6CWRG6vSn80hun8U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fnE/O+MnRVh8eVnyqgXgJ/AmuixDgcjhuuX9Z0Qr8nHAQohyQL7X6ZkGs1z34rkUk
 dtarOAkkZVqXMq+I1QQjqUpl2EZaqrVhRQQBWBX3hiMah0B5BJ9iL0Yw9aNI7c+Y7g
 8f4dJlL9kEVbc2Vgykd15rsb2w0vdR/BVq26grJL/KTym5ZT1LqKE3V8j1H+qmfDwI
 xkNJr409QXR98gsTNLJpIfFiTP/fxepyd4poS4YshuxjemzOssZ4Cj8UnWZHbYO722
 mCT10P4kZOHI47eay+4zxrPTPM1t3hUkbZ76MXoosIqEqbJJfFEnAXeFaOCcKLqyBy
 9oXR7QJaLIz/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fnE/O+Mn
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libupnp: bump to version
 1.4.25
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

On 22/11/2025 23:23, Bernd Kuhls wrote:
> Changelog: 
> https://sourceforge.net/projects/pupnp/files/release-1.14.25/
> 
> Added upstream sha1 tarball hash, switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
