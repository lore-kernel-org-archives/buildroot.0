Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA2EC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7931423E8;
	Fri, 25 Apr 2025 16:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2o5895nfpsR; Fri, 25 Apr 2025 16:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1294842393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1294842393;
	Fri, 25 Apr 2025 16:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C3A159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B929F60830
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI4vksmNKJOG for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDF8860802
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF8860802
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDF8860802
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E245B780375;
 Fri, 25 Apr 2025 18:48:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:48:56 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:48:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20250423173349.474898-1-thomas.perale@mind.be>
References: <20250423173349.474898-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <6e797cb5449fc9e813b5b603e94119f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745599739;
 bh=YI1d7esk6+N4oQx/124Uw9T+7M66I0GC4Xx+/FdliTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fMvJvs5c8FmjHLLNszSaCan4q5Qst82P9rkk5WL5ztRn89Jcr1XbMG0aqt8uRFqnM
 /RN/agmLQV8ZBOsBtdTaSIcQy+lnkxnfr7z/ZOT/R88LIlsuNYjGlcQYMNWj8Ipdf1
 Yseo7TXV/zLK/eOwjXiyY9eMpfyOLVDEFBT6p3swiyJKaoPj/70ZewXaATEY9l3Euj
 6PHIIu5zeX+4BabPf3llUGt6Ar2clRrSw4aDZMM3bhPyh0klB4xJekKUOimNnK42PP
 ChHgQdsBHdoogBoulF5GULOpP0sBY2zoSwieyKnpWGkZkd32uF7oG7DoUij0uwh4CR
 x3npllToQHrdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fMvJvs5c
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: bump to version
 1.22.2
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

On 23/04/2025 19:33, Thomas Perale via buildroot wrote:
> This version bump removes CVE-2023-7152, which was incorrectly 
> associated
> with the micropython package in pkg-stats.
> 
> Although the CVE fix was already present in 1.22.0 the CVE only applied
> to the preview version of 1.22.0. The CPE ID of the 1.22.0 matched with 
> the
> CPE ID of the 1.22.0 preview version as well.
> 
> This patch bumps to the latest patch-level version available in the 
> 1.22.x
> series to include additional fixes, rather than just adding the CVE to 
> the
> 'MICROPYTHON_IGNORE_CVES' list.
> 
> The LICENSE hash has been updated, as the licenses used for the ports 
> and
> libraries have also been updated in the LICENSE file.
> 
> For more details on the version bump, see the release notes:
>   - https://github.com/micropython/micropython/releases/tag/v1.22.2
>   - https://github.com/micropython/micropython/releases/tag/v1.22.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
