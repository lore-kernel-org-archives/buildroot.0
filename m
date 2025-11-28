Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B350D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A5280C14;
	Fri, 28 Nov 2025 20:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScC282jXz1Px; Fri, 28 Nov 2025 20:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6207F84879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6207F84879;
	Fri, 28 Nov 2025 20:21:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 219671A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13DA340832
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okihIfIqamdE for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3091D4082D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3091D4082D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3091D4082D
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:21:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 78E8C19F59C;
 Fri, 28 Nov 2025 21:21:32 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:21:32 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:21:32 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251124144922.2851295-1-buildroot@bubu1.eu>
References: <20251124144922.2851295-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <c666a32746b772b1e1e578a41aba7285@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361294;
 bh=E+I+GtkQ19Du+HuQO5brTxw3I2jSZZfFg3qlmiLcSis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E5qQF6TAbrCQ1bLgjBfP+5iGBOp2mW+39JkCsDYgJ5MiAlMn5LzGAwXiGNii1Vl8U
 AQO47pb2UvAJRvdzYFd0bXjZTh5WqrlokB98q3gMfH8iW8M8Ua2zUHJMi8Z6MClXJs
 W8qoWdm4KtsDWXiFv4UcUokBMj9+KHLXsE22fMDlvJ6PPwNJExryXWEZC8O0EW01xw
 a2sfu4d7r28Sb+jX1ORlXrl/NtXpxRIeuYtAS1q+x27cQjrcJDx91rJX1LUxwDkIe+
 DHFPBXJ0lN6ukiSnfKzTTtO76+WPBTolX2FJEyhmVAcRRJt0pDUVQXcZeC4U6K5lwS
 lzKBn1/4jF2qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E5qQF6TA
Subject: Re: [Buildroot] [PATCH] package/python-dotenv: bump to 1.2.1
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

On 24/11/2025 15:49, Marcus Hoffmann via buildroot wrote:
> Changes:
> * https://github.com/theskumar/python-dotenv/releases/tag/v1.2.0
> * https://github.com/theskumar/python-dotenv/releases/tag/v1.2.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
