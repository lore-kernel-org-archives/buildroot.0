Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D51CD0402
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6143440394;
	Mon,  5 Jan 2026 20:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfvzsicWMjXt; Mon,  5 Jan 2026 20:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB98403A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646284;
	bh=AAtIJUKZePBO2g1Si9EfNZ08OFZ7yYzbs/PK/OZ4Z5A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GQyf/60t5ognud6VnXPXREwq2h5maoi+GFy+x/b0IqQL82XQ2y4M2dCmlnXYx+OfY
	 MiTbStTv0Mqd5yOYKL72laf5HgIih4+1m5uxp4SzOraVquxhBZLj+FJSYiS3yBO9Wu
	 vYX9/e1oD+z+j26Pi21rhknp+VzRkgBN5uk2sXowLL7HHQ8tLFpeih2m/oQvd5uYi2
	 3YxLUlL19pz4ih6/fa/A93Q61vPqj7JEo2rd9Mr+GsXhFUCnkdkTPw1mnV0Dq3zzSM
	 V8YuSiP+3ZZsjXsaKXBX8bqgOzh21jCu1VDsrfQDNxDl8dmSte9yqc/FFK4qS2iKzQ
	 X2FMMXXx8l81A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB98403A3;
	Mon,  5 Jan 2026 20:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CC7E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F74780C74
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F90y1UmS3ehm for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE9B380C70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9B380C70
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE9B380C70
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:51:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 53E5D2003C8;
 Mon,  5 Jan 2026 21:51:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Jan 2026 21:51:17 +0100
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 21:51:17 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260105144048.16235-1-fiona.klute@gmx.de>
References: <20260105144048.16235-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <cd14035323da161f3272206b68407267@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767646280;
 bh=P9u5uRiFqMKisVO+QSOUKMNAnOGdyDSg2nSdwmbAv7A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uCy7+HhhkQz7lrAZWmqXO4cBjrJqFJ8DB0tB5tMbREYTH9vRh2843/bi1ttZHTBDx
 +0vmED5aVYm7/irzY1mMbUCdcoARK6UwAmCJzOg/vv5WKfyV3GGQUanTF3Z+HjjCcH
 X5riFsj/QhLUelUrIKrE/VwnXX1QylMaTQsFzB47M0kI5O/p6T6lzTBkyxs5nSDD+s
 r+BunA4gQ04ZulByRv53ypSs00rR59tFuyX+XoKsOhAYBgSg+U1gAnNrZAXyyEIPat
 Ns5sXNi4A0SBSFTtZeHOB582YOG3Sts3hJs93iumAaBQKTnF9Qs50CpVtLWPypeds4
 xsfY+FgW3Tv8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uCy7+Hhh
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-rich: add missing
 dependency on zlib support in Python
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

On 05/01/2026 15:40, Fiona Klute via buildroot wrote:
> This did not show in the runtime test for package/python-memray
> because that package already has the dependency, so the Python zlib
> module is present in the test.
> 
> Package was added in commit 26bc4b51a808d73c09598035aa94f9c37b273218.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
