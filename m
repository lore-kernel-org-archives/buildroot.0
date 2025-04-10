Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43016C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6F1605D2;
	Thu, 10 Apr 2025 19:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3oz2tYly_de; Thu, 10 Apr 2025 19:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4201F608C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4201F608C3;
	Thu, 10 Apr 2025 19:39:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43415138
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D49608C3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdKHjAzpRlkm for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27488605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27488605D2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27488605D2
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:39:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 20D5E2003C1;
 Thu, 10 Apr 2025 21:39:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 21:39:27 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 21:39:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
In-Reply-To: <20250409163334.687686-1-thomas.perale@mind.be>
References: <20250409163334.687686-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <b5d39a52c443ed5364e6d6a728e34f94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744313969;
 bh=czu16FgLH/7AYGIpQbH+arjcEOtXv6eovMDfvhKvsz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ECeTw7XuXvsKX2It+2cxkrPqGyzvpyI3dOtaMv/Rd4KoVwn3pC1G8kr4j8yU7p52H
 PYAKSsNo1wDAKZOmjJJ1ZqUOn0SDnCukjpapVrTbnwjkdUGZ/ohx2W2DCVj+ACdZrx
 MIrQP4TRttkM5wJcTzhZOyxJ5wNbCuZteOl3Qsnsfp8LWZkubOWYwOoQ2mq+KYYQdp
 xBG0i0++Gd+s9GNs11/Q93mv6xBAOLC70O2Zt4ihPS2zcc/9VvVM+M2l2xmxbYjh6M
 Xx9AShxGw+GbqiNLS5lfdk/sFvgaWNDEotz2qP9YfqoPqEWP3fxWo6iVBjTcKnTjMv
 UtPW+pObBHtCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ECeTw7Xu
Subject: Re: [Buildroot] [v2 PATCH 1/1] package/libcoap: bump version to
 4.3.5
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

On 09/04/2025 18:33, Thomas Perale via buildroot wrote:
> The patch introduced in [1] that fixed the CVE-2024-0962 is now
> available upstream in the 4.3.5 release [2].
> 
> For more details see the release note:
> 
> https://github.com/obgm/libcoap/blob/v4.3.5/ChangeLog
> 
> [1] 9002b818be package/libcoap: fix CVE-2024-0962
> [2] 
> https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.

For info, I also fixed the LICENSE file hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4df4d1d31240aa4d1c49dcbcb9694ce32eb626ba

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
