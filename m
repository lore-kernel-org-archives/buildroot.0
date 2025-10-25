Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67385CCF9E5
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 21:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAE9812F3;
	Sat, 25 Oct 2025 21:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRw5SyJJpf5j; Sat, 25 Oct 2025 21:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A0B812E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1A0B812E7;
	Sat, 25 Oct 2025 21:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E26D43F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246D140A56
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypVCpSWJe286 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 21:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A26F940A44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26F940A44
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A26F940A44
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2B417B0051E;
 Sat, 25 Oct 2025 23:11:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 23:11:29 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 23:11:29 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251021081029.693626-1-buildroot@bubu1.eu>
References: <20251021081029.693626-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <c9696b95137c1da69ed3bbf1ffac0811@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761426691;
 bh=LtsiCAco3qAOhsVbq0xhhboeZmiCZhIQCvgC5cEBUj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gnFVM4KnCqsi/Ad6rEAyIHy61VIImNR84EuvvzgA1aapXgCUl2+b7UMZ4C/BgYItm
 b4OlAFONWLDJrBxAazxRMvG2Pvm3CdgNmnEcn32RkibW6TymeK37tlpv9l95l0aVjd
 /mca+M1dA6n39IlIFVSYFne7urhYYNHReh1EFP5fH8N0zZTmdtdHy7DzZl8FmwyUjp
 muXv55DFWP9atAPIHOHb8QAhqTiGprEWe0C7clSYyxJqL5B4u93//J82Ro1rmr2JQB
 YPi3N5iMzFk2qRqyGlgxS08q8K46XlL0ha1Cva0XpTYEVFVe/b92RbN+CYC7Dh/7zz
 H5C2lkBDMWacw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gnFVM4Kn
Subject: Re: [Buildroot] [PATCH] package/python-wrapt: bump to 2.0.0
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

On 21/10/2025 10:10, Marcus Hoffmann via buildroot wrote:
> LICENSE file changes due to copyright year update:
> https://github.com/GrahamDumpleton/wrapt/commit/ad97a2aa802391e2cffd31b601801214436d7ddd
> 
> CHANGELOG: 
> https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
