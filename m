Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430DFCAC5B0
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E3A81142;
	Thu,  2 Oct 2025 20:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVLkTXCJSDgC; Thu,  2 Oct 2025 20:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E9381119
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E9381119;
	Thu,  2 Oct 2025 20:59:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B36A1CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA6381117
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9nRSlSc7HAv for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 20:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20334810FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20334810FC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20334810FC
 for <buildroot@busybox.net>; Thu,  2 Oct 2025 20:58:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C5E8D13F86E;
 Thu,  2 Oct 2025 22:58:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Oct 2025 22:58:55 +0200
MIME-Version: 1.0
Date: Thu, 02 Oct 2025 22:58:55 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251002065706.1010793-1-francois.perrad@gadz.org>
References: <20251002065706.1010793-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <2b1b82885443d0a7d95d0d78906c6a57@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759438737;
 bh=qj6g3eEdnQDjQNdQ/0HxhYxe7A0lzH20TQdMVxbZlUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SLerhnOLHdFtmv2bTj4deeJ3Gl3MPHYFhAomej9TFbb/sa/AXz7JvWS/uFXI01GWM
 WdoJPQ/usAnYyPeVgM5v+4WiCKHd6nmhMwvW26lXDsYo61B9jW64HdqxVmxQMuyxUH
 hhf0aXia3nBjnZaYk2eTIhKqQmqiHUcWMHbp+yrMJWLlNSx6mmphS2j2qYRTDKmYVK
 OljTQ99diZDGrdgF4Egy7/jXMCuiunztd8dholt6GVZTePAyqBDQGY9GGeF+ZeVwcY
 mD5P6K9TeM3YqZeJ8wAXnCJsWcZp3lxZPRKCqi3sI/pNPS8eKH1MZ32OAY4V9Wpo4s
 e+0lyxv6lM4WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SLerhnOL
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.5.4
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

On 02/10/2025 08:57, Francois Perrad via buildroot wrote:
> fixes CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
> see https://github.com/openssl/openssl/releases/tag/openssl-3.5.4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
