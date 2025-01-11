Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8737E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CFFD611AB;
	Sat, 11 Jan 2025 16:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJVBCz-D01vF; Sat, 11 Jan 2025 16:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1F2611C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1F2611C6;
	Sat, 11 Jan 2025 16:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60DFB940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EA8C82F13
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49j6VH6dmt3u for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0766582F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0766582F0F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0766582F0F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 28A4B60140;
 Sat, 11 Jan 2025 17:06:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37794])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:06:05 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:06:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109192354.2361883-1-james.hilliard1@gmail.com>
References: <20250109192354.2361883-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c21726001774ccc1e79596ec409f5a65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736611566;
 bh=o5WvYKv02EHlS77/7+/1s364lxTasDHSf/ZU6rYTJmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fzOEXLN1JUo1FkEErF+KfaSv8eDg16VJSyDqv01yLD2uAp95sxh+i0dSPdZuFdY4l
 xeaZEOCGXmGC77QMh+tT0oh5BRs5yfNJsmk+jTaifNFCFlOjAFiKTWbN5IOayJ9DU6
 BseuIgXvg8/8vmCCd9bq8VnHvS/4GKjx0TvjI0iOYo6RQ9aA6eE5Iy8DD0yKZsDvXm
 2Ge4geW82VlKlRrZyYVr0qUBEd4+78zx8jiyrp7nz/nJmNOO0HDJLIXaqIBEVM7tFE
 155l9abefD+esT7b52QjO1qB+5ecE63wC7hNOLs/5ivTdGHUle7AlwSyCXtMSf9Gqh
 wxOSq3gRah6dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fzOEXLN1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncclick: bump to
 version 8.1.8
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

On 09/01/2025 20:23, James Hilliard wrote:
> Migrate from setuptools to flit build backend.
> 
> License file renamed without content changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
