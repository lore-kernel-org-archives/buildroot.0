Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE0CEB2C6
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 13:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21EF608D0;
	Sat, 15 Nov 2025 13:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjsgBFV9GKuO; Sat, 15 Nov 2025 13:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A87460877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A87460877;
	Sat, 15 Nov 2025 13:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E0E158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E662403DB
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSfaMUCYb8t2 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 13:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F92A400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F92A400C4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F92A400C4
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:43:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 13E7DB0053D;
 Sat, 15 Nov 2025 14:43:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 14:43:29 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 14:43:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251115103347.3462638-1-bernd@kuhls.net>
References: <20251115103347.3462638-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3748c5036910cb2118c7d69ed4238acb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763214211;
 bh=i4P6cbd5dGEajV/PbfEED0+VwZjQ58zJD/tYr3/W5Wk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H1mQ9ToFnOlX2kZI/kcO476SzAq05vDg6RNCf5gTv7ugX5ISaYS7rMR2zSiulmdvQ
 /uDDFCZTmrvyXfuJwNEoJ6WC8GZglb7bOeXczS22yklZtORlB4xRKdUkN+I5pkdO3o
 AVjW0BP9uJ9zvuWQt8YQJROFWmJOIi1jTYXmuyHr4u/qn9wSWUf7SCfnLaD2gk/7pN
 yImKic7TtUklFAANDLKPq60wkHuDyWVEGckyF9m42W4mCCepb/DLO/dIZUgiMKrCOl
 y9pzs6Saj0901+YldCqvT/PsFEY42KDHRzfdIXwOgXLVxJFGzwX9jtuAENNWAcRi8U
 D8Y7raqUgfd2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H1mQ9ToF
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
 to 20251111
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

On 15/11/2025 11:33, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20251111
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
