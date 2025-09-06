Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E335CA0FED
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D41840E6;
	Sat,  6 Sep 2025 21:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnVY9t1NmLFs; Sat,  6 Sep 2025 21:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC14840E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC14840E9;
	Sat,  6 Sep 2025 21:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E8EDCA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D5D41845
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fvp1vHm0K1RU for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 21:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13E0F41840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E0F41840
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13E0F41840
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:22:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 998C7B0053D;
 Sat,  6 Sep 2025 23:22:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 06 Sep 2025 23:22:21 +0200
MIME-Version: 1.0
Date: Sat, 06 Sep 2025 23:22:21 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250829152440.2183374-1-thomas.petazzoni@bootlin.com>
References: <20250829152440.2183374-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <43fa68b785690f5c62bae73f3a296d27@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757193742;
 bh=4jScyISn8H5U9AlmGR0M579qoQZaCH8URMavROtHGII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ieEcgBUH+UeVWIYm+XFzB4C+XsbPW3lE4u5IceItJRr/hn3RWn7gNy2nlNVKRA63y
 GThE2Z4UxqDXuMboNNvHuRaPWDyNrxa/heSLSopw2qT2A4RHr8yHH3hduddy4oC9CL
 pjSNasKN/GMe6KhMshCy9eR2KF9Igmp//vDqf00YzRfCNh5xqAoPEkmaDdcg4BtUfq
 vIzUWkO1hSIeRi1KJVAlbm4K35hhHR7vwkuvswnDbvZWsPadv9lYrQoK+xH9u+X3hw
 8QfkJYHEtz5M1Neg5v5V7rQyTBPeR43tzZcE5qY8zMMtFbS9uuwbAsYhnfs7cLUYiE
 qcHUk+F2nphBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ieEcgBUH
Subject: Re: [Buildroot] [PATCH v2] package/gdb: really fix build with GCC
 15.x by using external readline
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

On 29/08/2025 17:24, Thomas Petazzoni via buildroot wrote:
> The copy of readline bundled with gdb versions earlier than 16.x does
> not build with GCC 15.x, despite our
> 0010-readline-tcap.h-Update-definitions-for-C23.patch. In GDB 16.x,
> readline has been updated to 8.2, which fixes the issue, but
> backporting this to older GDB versions results in a ~450 KB.
> 
> So let's take the approach we should have probably taken from the
> ground up: use an external readline, instead of the bundled one. This
> is exactly what this patch does. Instead of having gdb depend on
> ncurses and host-gdb depend on host-ncurses, we make it depend on
> readline/host-readline (which in turn already has a dependency on
> ncurses). In fact, gdb does not need ncurses itself, it really needs
> only readline.
> 
> Since the GDB TUI itself needs ncurses, we move the ncurses
> select/dependency down to the GDB TUI option. This was pointed out by
> Romain Naour.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/3b0ce5cfac81e150816027fc1259600ee02f0f1f/ 
> (host gdb 14.x)
>   
> https://autobuild.buildroot.net/results/e64e3cd7aa5e7315464e380982f7febaff5df908/ 
> (host gdb 15.x)
>   
> https://autobuild.buildroot.net/results/2f2616a4ac7d9cbc06ba7775eb57bdd2a0419cb5/ 
> (host arc gdb)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master (with few fixups suggested by Romain). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/d98e15a3639d9758ab3223f0a6de3a94d506e6fa

Thanks!

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
