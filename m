Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FE5C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2F040FDA;
	Thu,  3 Jul 2025 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBNb5TXcuPHS; Thu,  3 Jul 2025 17:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2EB040FDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2EB040FDE;
	Thu,  3 Jul 2025 17:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C365915F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A954D40FC8
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ri5KFT-ARYj for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE58040FD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE58040FD6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE58040FD6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:29:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6318813FA60;
 Thu,  3 Jul 2025 19:29:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 19:29:08 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 19:29:08 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250702151228.1641390-1-titouan.christophe@mind.be>
References: <20250702151228.1641390-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <c876d7189ff61e8044e403051520c34d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751563751;
 bh=7p78tFSJVHLd0wRgjNkacGXGOawvDTABbTVeBy3c50M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OwbNhU1i+haI3zfO79W80CF7GytZIFwA42xpG3rkn9/M/vOuwtud1ovSDaE0er1Wb
 1L7me2gsg7SObzcHEu/HTTtmL3CJzXEiaKXX1j7PGn2bqbyF9wwAJgL1uGxlYS67rU
 rKS1o+AmC/1oodw9WZzNggRbCM/nfh3QNAXfiDc8znEQV/DGkuLtud6VlbjfvwqW+e
 vUlkD9Da9G0/E3xb7lLLijBEHyrCYhZ0QHc9GaCOyMqtFEDwWIKncVsPyHuVbYUQFu
 ecyQpXMzqkAfaBMCEGvx6ewceFyeWZLzxCcEJD2xHvpcOqthrPAc2j50Lfkk5y4jJs
 rv5zX3kmjfcHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OwbNhU1i
Subject: Re: [Buildroot] [PATCH] package/libsoup: add many security patches
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

Hi Titouan,

On 02/07/2025 17:12, Titouan Christophe via buildroot wrote:
> Import all security patches from OpenEmbedded for libsoup.
> This fixes the following 18 known vulnerabilities:
> 
> - CVE-2024-52530:
>     GNOME libsoup before 3.6.0 allows HTTP request smuggling in some
>     configurations because '\0' characters at the end of header names 
> are
>     ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated 
> the
>     same as a "Transfer-Encoding: chunked" header.
>     https://www.cve.org/CVERecord?id=CVE-2024-52530
[...]

Thanks for the patch. It generates many check-package errors,
when running:

     utils/docker-run make check-package

Errors are mostly due to the missing "Upstream:" tag in patches.
Could you please reformat those using this tag, to make sure it does
not generate error?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
