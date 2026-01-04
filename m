Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB58C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 12:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0041A404A3;
	Sun,  4 Jan 2026 12:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQh1MOv6Ch3o; Sun,  4 Jan 2026 12:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27987404A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767531128;
	bh=12NaOQ6Uv8dcfAmYjoOiXeAPlrGN68CXkC9VJV4jhUc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=akoiQ5gJ0JgR+XwJoEulR929IFjHshZISAz0NH5ciI+vOpn23L2m37bZ32SKD2pVO
	 XjJJ3Z9293H/uJvN53UniCLDBd97bD8avaCkDPKH0JBWUZmK3Z3za/X2KT1bEYnwUz
	 uE6vrZidrVM2AyehefhbyOHzyKR0GTg5tz0l+19P1+SCVdVx5CzkEv0hDafTRmii84
	 J2frsQblXIAMDPtXiXjXuwOe8K3BM+eSCMzJMNL6ZuwHZvOrW/t/2B7vwiu4hy33IH
	 sCQebVqY7ODdIKPTaTzXh/rqJHO7IS3abpNzOmtQj5XXhuymsU7jRDhIfi39FRk+Cu
	 PksyN8W8HOrYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27987404A5;
	Sun,  4 Jan 2026 12:52:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0E2249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C29C860758
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg26SR2OwUFB for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 12:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E734760730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E734760730
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E734760730
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:52:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BE325780375;
 Sun,  4 Jan 2026 13:52:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 13:52:00 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 13:52:00 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260103114046.2461857-1-fiona.klute@gmx.de>
References: <20260103114046.2461857-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767531123;
 bh=hw9WZ4GAjaaTrL1Xn7bJe/p9g/Uio71JWXSpGoOIaj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u9LyxJQByFuuzTsJHhrvnnprGvCwvSS5H/BBuyCtWpU95Zrga7LedF07Yr7V7nePb
 +uLwIKVdkEM4LX7hENymWqd+psNI52BmOJtPueOgZhmv30HIwlpjpc3ymWhIbW9vWv
 QRfjNxrrWyIyjGk39zOour1CryTFQesZr4wfwGmlNE5I38Dvvb6Bm84EebZonYzTni
 hT0lsj9E5bqXN9afHd6S/zQRBL1V9Go3HkwaEORB0pOWzYTpI6Hj9zpUykRw+ejkLF
 2KsRreTWLZNKSi0RaxT/9tXNfqPDDd67Ko7SVnfOnv+XrfZfsSF72BRqStS1XojK0h
 OTPmIYPH+QP/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u9LyxJQB
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.4
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

Hi Fiona,

Thanks for the patch.

On 03/01/2026 12:40, Fiona Klute via buildroot wrote:
> Upstream changelog:
> https://github.com/plougher/squashfs-tools/blob/4.7.4/CHANGES.md
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
[...]
> diff --git a/package/squashfs/squashfs.mk 
> b/package/squashfs/squashfs.mk
> index f2cb0ab25e..04b328ccab 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SQUASHFS_VERSION = 4.6.1
> +SQUASHFS_VERSION = 4.7.4

This new version is introducing new build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2243847808

For reference, the previous version passes test-pkg:
https://gitlab.com/jolivain/buildroot/-/pipelines/2243853301

This is likely due to the new SEEK_DATA usage in lseek(), which
might not be always present or might require _GNU_SOURCE to
be defined. See:
https://man7.org/linux/man-pages/man2/lseek.2.html

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
