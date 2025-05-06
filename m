Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB1C3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E99D60DDF;
	Tue,  6 May 2025 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH1dAcmrtwoQ; Tue,  6 May 2025 17:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C42A60DC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C42A60DC6;
	Tue,  6 May 2025 17:36:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38419EDF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 347874090A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Md61whzOftLP for <buildroot@buildroot.org>;
 Tue,  6 May 2025 17:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3833140901
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3833140901
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3833140901
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:36:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6440A780969;
 Tue,  6 May 2025 19:36:26 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:47334])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 19:36:26 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 19:36:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250501232946.25084-1-fl@n621.de>
References: <20250501232946.25084-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <39b3ca1130fbb6818ec06e0aeeea5056@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746552989;
 bh=HUszLIVgvBe3P/jn7odQ+YWWn/zIh9Cw0gDb7GPf6PY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VDb3qXa4yK7W1KemtGmw3wLsFDyOOh+JzmRfkYkUgB+3y0zeRP5ik60n4sQncG2pp
 FLIrVUyoXXWxt2OJv+ePlxS5WGDAnxva12dnRr2Vz0oKqBVuC/a82pomFD1W45fxiS
 o6bahsn94BdDP+aBmuf0vA6YCjEzztQmj+sbdkPGWt9X+WZLOeKqfFJquPE2ZcJucq
 sSSXfNmKBNjJNbK9g1IiJ20xwc4B2MBaH2ylpbq1MbVrCxsBFDiF1jNh6RPqTiDeM1
 ikcdzfH8Rl8RrkGXk9U3IVKSJ2FnDVw/St0s/8mP8mUZ6yosnTncRXNnIwJOmQxuMS
 72sHFphcLqDXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VDb3qXa4
Subject: Re: [Buildroot] [PATCH 1/1] package/rockchip-rkbin: bump to latest
 git commit
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

On 02/05/2025 01:29, Florian Larysch wrote:
> This version incorporates stability fixes and support for newer chip
> generations.
> 
> The license hash change is only cosmetic, see the corresponding
> commit[1] in the upstream repo.
> 
> Fix up defconfigs as needed since older TPL blob versions have gotten
> removed.
> 
> [1] 
> https://github.com/rockchip-linux/rkbin/commit/385bf9f1700cc4b7ab8af1ec96da02f4837c525a
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
