Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7A5C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 961B761232;
	Wed,  7 May 2025 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9MJq4yYpQ1x; Wed,  7 May 2025 17:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0216130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0216130B;
	Wed,  7 May 2025 17:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6FA5950;
 Wed,  7 May 2025 17:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B723613F5;
 Wed,  7 May 2025 17:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCgGrl5oFlhw; Wed,  7 May 2025 17:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDEA86130B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDEA86130B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDEA86130B;
 Wed,  7 May 2025 17:20:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CBE11780502;
 Wed,  7 May 2025 19:20:09 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:43758])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 19:20:09 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 19:20:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: buildroot@buildroot.org, buildroot <buildroot-bounces@buildroot.org>
In-Reply-To: <D9OYJGBFLUT8.35SXNUQLMD2TR@brighamcampbell.com>
References: <20250505190840.1316502-1-ju.o@free.fr>
 <D9OYJGBFLUT8.35SXNUQLMD2TR@brighamcampbell.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f909d68c36a823f8329f8e7553b33f76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746638413;
 bh=dYMhqIEFgEyS91ppDvjr5teE9ZpWB3bXJxMcYPxCplk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=srPpUxQfmRFupBbRy4/OL7k9+dz+EjxV2dyzWJGjRy9IVKH5VEM3MiBFoRPR9Pjtu
 hLf5cfUre7uabUYggkzfezWAz51XsdqrAI/CSGkOdS0BIHHD8xi5KkNLv1gG9QpAse
 l6pxPs+fL7gztxumxKS80xMFTw5ZgF7WgnhT0K3Y7EDJQYCIn0shLE6X4muo1yC2Xr
 LMlOMqp/UmkwbuuM8cXrGzjSWykRqr5jQngBhRAYZ+ZW4EBIkv5fEwzxyE70LH+uAU
 qSzY0aJ8Cmuv6se4OPvzbY+NDMleYF0xC8H6nM05WlquhrhEriLYSolxSOCJjTbkjn
 AK4h952M+vBQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=srPpUxQf
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: add patch to fix build
 with gcc-15
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

On 06/05/2025 11:07, Brigham Campbell wrote:
> This patch allowed me to successfully cross-compile an x86_64 root
> filesystem on an Arch Linux host with gcc 15.1.1, which is otherwise
> impossible for me due to the same error that Julien reports.
> 
> Thanks,
> Brigham
> 
> Tested-by: Brigham Campbell <me@brighamcampbell.com>

Thanks for testing!  I applied the patch on master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
