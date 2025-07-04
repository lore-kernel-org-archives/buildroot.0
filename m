Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB59C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F73B4080F;
	Fri,  4 Jul 2025 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dA9ppECNvrF; Fri,  4 Jul 2025 16:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B6A4119C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B6A4119C;
	Fri,  4 Jul 2025 16:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 975A77AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C68860BCB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wy6vRyig-Bp for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCD126162F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD126162F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCD126162F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:57:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BB237200412;
 Fri,  4 Jul 2025 18:57:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 18:57:07 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 18:57:07 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250704092421.1886266-1-titouan.christophe@mind.be>
References: <20250704092421.1886266-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <0ea256f03ae300c8158d618707a879e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751648230;
 bh=hlcfM6crVBk9boBPkMsXeOYLaOMRXFr3fiEahmKFCYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ML/sTR3s0f//UH/S9pJr4CJQnST7rQNAT2jINF6TM87hMT1eBOsJgVFBMPTxea2p1
 s2EB/zZRKrh0BzRUIvi0HOtJlKMmR8i1L+5OBJIN6wfpEEYw465bCOK9a9tWWfMV+2
 rKkvNKpsxTlkh3yNt1dkKNDFzMJsVFn3ihSNoVNmWea33njl7ULDzqKnbtEtGh6kei
 aspMo3E0AXPr4lPBLXdJ1WMQBsDCQWFRqPsC1H6gZ/uk52uWozsVSHKM/9V+WYPz8X
 HSSdflk1w4x3p0BEC/UOjyJPlW/1yPDbcNv7YTH9zfdZ8fY9773+Q46+XgeO8XfZYk
 fFqQFAz6tcEqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ML/sTR3s
Subject: Re: [Buildroot] [PATCH] package/libsoup: fix missing upstream tag
 in patch 0001
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

On 04/07/2025 11:24, Titouan Christophe via buildroot wrote:
> Fix the patch message so that it includes the "Upstream:" tag expected 
> by
> check-package, and remove this file from the check-package ignore list.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
