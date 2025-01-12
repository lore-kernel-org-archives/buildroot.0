Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E8DE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E90360623;
	Sun, 12 Jan 2025 11:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyMEPlKl67-U; Sun, 12 Jan 2025 11:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EFE6065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EFE6065C;
	Sun, 12 Jan 2025 11:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9FA68
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A66E4027C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KptLH-7jtc5m for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BECA740259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BECA740259
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BECA740259
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1CE8213F861;
 Sun, 12 Jan 2025 12:37:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:37:58 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:37:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111191102.2965266-1-james.hilliard1@gmail.com>
References: <20250111191102.2965266-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <49568468526e594e69449db2a3aa9f2e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681879;
 bh=/eBTqVkyapNEHz4oxT5hKSOP3mxIguSo3uzHhUfxrsI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QvonizxuOgjY5lks9YAX1/I5WdHbWb6ApaOHAV1FxahP3SB6uVgBMTz3+vit5k7o3
 mwlQKCNpLDWR6iFj+4GqUv7Kswnk3nK40j+e0TTjH/MDULt9uQIPdwuov2VL4xi30O
 Aix4w4GAD3Mia22QylvD1c2GmI/7U8yqO91zd4B2iGnZpyWIGzQyCPIJ9CpNmFJY5W
 QWmEuQly4vH9XWn3QqXxtmNHsioc/tAwpdKpdaNFFGRqgeATV1n7IH3nBuFZa+49uW
 5QMSmVApIFP206HE539BWp54EXGY0hLZZNJrqt4vDPd/ZrUPthzwXFMJRZP4LLjvdd
 H/gXJd1yGEcJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qvonizxu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ws4py: bump to version
 0.6.0
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

On 11/01/2025 20:11, James Hilliard wrote:
> Drop patch which is no longer required.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
