Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB576C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 15:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514EC81985;
	Sun,  1 Jun 2025 15:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViczZpNopTVQ; Sun,  1 Jun 2025 15:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867A181980
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867A181980;
	Sun,  1 Jun 2025 15:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF85E127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B66A240444
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNzZTUiTmySD for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 15:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED4F54044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED4F54044B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED4F54044B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:34:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 944EE13F89C;
 Sun,  1 Jun 2025 17:33:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 17:33:59 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 17:33:59 +0200
From: Julien Olivain <ju.o@free.fr>
To: Stephan Henningsen <stephan@asklandd.dk>
Cc: buildroot@buildroot.org, Stephan Henningsen <stephan+buildroot@asklandd.dk>
In-Reply-To: <20250531212436.2788813-2-stephan@asklandd.dk>
References: <20250531212436.2788813-1-stephan@asklandd.dk>
 <20250531212436.2788813-2-stephan@asklandd.dk>
User-Agent: Webmail Free/1.6.10
Message-ID: <e0eb92ad77085d87ba55b28021d762a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748792041;
 bh=bnyseC0h58XurpB8EdyW9z9mpKnF4oJlrK0E48kG7CU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Km8bxgqwMDl4pO/NocOw1p2Tbo7iZOAkFjA+BA1esYKoIL/RNBxAZKxbWtaIMOjmd
 euvXwS2Et8agLT/DWl9flRAWrUVbuP0PEhuo8VUXOZDHXSTyyPkxgJFRlWfa+ezk7r
 ZoA/4Yb88HcD+87Cz1njzxqLLftKJ2ZMs5JXXDJCx66ytzJud9yVoosTfRarfFqSku
 ljTby+uWQQ8qWBI70ktv8th89aMsDBb49VwqHd4hXPy8UoMXaFzohGqqENIRdulugZ
 aH/aTyuN3GAwzJ/19k4Zly2G3cj5NbcbVBSGJv09XbGz27PnDZmkl+sS1LYoTxkgLd
 rOPNAsrJwT+Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Km8bxgqw
Subject: Re: [Buildroot] [PATCH 2/2] package/lvm2: bump to version 2.03.31
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

On 31/05/2025 23:24, Stephan Henningsen wrote:
> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> This includes, amongst other things, the restoration of support
> for LVM_SUPPRESS_FD_WARNINGS.
> 
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
