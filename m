Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B141E937EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE2B1423B2;
	Sun, 12 Apr 2026 17:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5BrijDA4E_c; Sun, 12 Apr 2026 17:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 047FA422CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776013467;
	bh=M/G0sZwQOQoCtoKPJUA0PzoviOocVXZ9GPXrCtB0SHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8aUWaG1rpvdfQG9mDhE0ay1yuwa7dZVC85UPlXt8Nk+mTFZ5gAApkRwSITvIKln+
	 f6oZzGR5OFa2nuSuupso2H+wDZQkhp9U2vg0VM9GHjwGwNQttJFHgTgLA4k/YwNyUH
	 OIxGSemOxouEVAlOZlPKbV1mfG9WgqJub1DzsXKB8gCfSlfAq7nValeEAsfFeRBrGx
	 c0FDTTkIfFlo1Mir/AaBx5GQvqkRmpNFwftDeHVq0/OmRWKN+UpCmMthhb7ban7g/o
	 nzEefqHukeCHIBlBGcfawTAiLMxb5sVzccWIDPxS7UCsFxieXzfMTfhhV5paLDSELx
	 IBw3iXEtePFdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047FA422CF;
	Sun, 12 Apr 2026 17:04:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C520194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E3958453C
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzGEus3xx3ys for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2067E844C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2067E844C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2067E844C9
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:04:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 398005FFBA;
 Sun, 12 Apr 2026 19:04:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 19:04:19 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 19:04:19 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Boerge Struempfel <boerge.struempfel@gmail.com>
In-Reply-To: <20260410145709.271512-1-buildroot@bubu1.eu>
References: <20260410145709.271512-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <d0ef374a5bfdb9a82a5c4abbb4a43a50@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776013461;
 bh=BE0SV+0lVID2Pb8cW4V5GV/Put+u81MfSDZjeVgtQXQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DqMqyEnxIpvu9m0ukzDBgFXFCs9D/CFHmT8MWMtqFlg4+m8grfqlCXJP9Qy6+3fcQ
 53mHHA7rA1PIQUJzG7aZ3UMocIhrMyNuGYh/COfr9b1ZkMPb/p3sKq+co3oZrj+PIx
 fpbEdRwMKIQjSxsXNeo196zYaEBST5KpAsHprFJeOjX5+FrxFMq7t4R517bGajKKjQ
 fggxB7iPgUzGRP+IcKICh9gw0lVLi+7YAhGxQV+B6FheUcFTi78b1CHpLjSbhdpkxQ
 tmZ3rLAiWDLURDiFg3IvWgf9RrhpOJDKhVCwP0YYPn3DjL3E+29GInKDyChoa30CEA
 VbXGcSka+gemA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DqMqyEnx
Subject: Re: [Buildroot] [PATCH 1/2] package/libgpiod2: security bump to
 2.2.4
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

On 10/04/2026 16:57, Marcus Hoffmann via buildroot wrote:
> Bug fixes:
> - fix buffer over-read bugs when translating uAPI structs to library 
> types
> - fix variable and argument types where necessary
> - sanitize values returned by the kernel to avoid potential buffer 
> overflows
> - fix memory leaks in gpio-tools
> - add missing return value checks in gpio-tools
> - fix period parsing in gpio-tools
> - use correct loop counter in error path in gpio-manager
> 
> Improvements:
> - make tests work with newer coreutils by removing cases checking 
> tools'
>   behavior on SIGINT which stopped working due to changes in behavior 
> of the
>   timeout tool
> 
> See: 
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks. I added a comment in the commit log
that the no CVE published for this. We usually mark bumps as "security"
only when there is an advisory, but since the changelog was explicitly
mentioning those security fixes, I kept the "security" but added the
comment. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6ac53518a0ceb0611ee08adef500fc8d2994d21a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
