Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD423CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D32F40F88;
	Tue, 23 Sep 2025 16:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzdBvkpcITIP; Tue, 23 Sep 2025 16:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983E240D5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983E240D5D;
	Tue, 23 Sep 2025 16:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83000129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 694D281E03
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1VgcoeYAEQj for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A12181DFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A12181DFD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A12181DFD
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:37:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3D18313F88F;
 Tue, 23 Sep 2025 18:37:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 18:37:22 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 18:37:22 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20250923131805.161368-1-titouan.christophe@mind.be>
References: <20250923131805.161368-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <f47dd3a626ade1ae02a1eeb1bb8738fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758645444;
 bh=Lz1WS+mxK73NtcqGdF4GckG6KUfB1MMkGHWdV9mea1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nBW84eXVhsR+zeJOLhSwKB9jX2DxAHSVpr1aVS+g2XWHBVTpK+B64qj8FK9cIHL/b
 lzBJnsONKs5V7ZOdz1+fNqqoQEW5Iij0HQ+lEyNzTkAYGwnMuBoXunZJ3pjiNn5gXz
 YesfVB0vOS02Xc8JtTxlqkd/oAwV3+CiwxHSIHWB5VdB15MYUVc2HBNNjngcV7icrp
 t5sTe5RAfDv+atuo+sWu6ghmTq4mV3YfHxnLiEOBtybtL8JcZI5VYshvnD7J5HuT01
 cQvu6M1jXTmlumEQxAyUzdIjYgzizoNio5OJeBFa+VABhTWBz2TJqmVom0GYBEWNmw
 BRtiphn5ekL3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nBW84eXV
Subject: Re: [Buildroot] [PATCH] package/syslog-ng: security bump to v4.8.3
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

On 23/09/2025 15:18, Titouan Christophe via buildroot wrote:
> See the release notes:
> - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.2
> - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.3
> 
> This fixes the following vulnerability:
> - CVE-2024-47619:
>     syslog-ng is an enhanced log daemo. Prior to version 4.8.2,
>     `tls_wildcard_match()` matches on certificates such as `foo.*.bar`
>     although that is not allowed. It is also possible to pass partial
>     wildcards such as `foo.a*c.bar` which glib matches but should be
>     avoided / invalidated. This issue could have an impact on TLS
>     connections, such as in man-in-the-middle situations. Version 4.8.2
>     contains a fix for the issue.
>     https://www.cve.org/CVERecord?id=CVE-2024-47619
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
