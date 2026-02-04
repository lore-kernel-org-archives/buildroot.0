Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2240AE9539A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA43B40BFA;
	Wed,  4 Feb 2026 13:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA1-UCwlniWT; Wed,  4 Feb 2026 13:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E019B40C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210818;
	bh=7bTIW00lr5xMY/ETd0yXjPQC+Lxt3DVwtlD8kLImC6M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fwh8tXSjToMip6y2BBhwMOKp5JpSxgSseGYBMDDAY9MMr/rJWqdThSgTdN3uaIDg/
	 XF7mrGzSz4tOTVc5aZeGChqEk6Fwk7csO+upiwpXBPg2TbtvfCUyH4NKKtkHpRwtdM
	 MFXmaBZAQBxbxg2hdQC3EBVhHu0EPxYUr41U3mTnaC6A8W7i1hgbQq0QF6LUmf5z5k
	 y8WKkzsqrSszYtgXqdpru3gFBxWlVzT8FD9dTDxiPSIrcdvWTW6Rq/cMqZnwq8Qwgv
	 Jd/Y8cV3oobhoouIRSEk2+OJNBdL4xYiAZqROTGRCkW3HuoH74P6qOYMqfO/7ue3+e
	 194JAtwtPyUeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E019B40C24;
	Wed,  4 Feb 2026 13:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAA87F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D408160AC8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv-2wfoQkD5a for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E105760ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E105760ABB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E105760ABB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:13:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1DF9A1A2BE5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:13:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E227C60745;
 Wed,  4 Feb 2026 13:13:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34847119A8891; Wed,  4 Feb 2026 14:13:32 +0100 (CET)
Date: Wed, 4 Feb 2026 14:13:31 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aYNFw5uzI8QWyF0-@windsurf>
References: <20251216093534.2558659-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216093534.2558659-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770210812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Gq5rpizo8NviwBlnyA32bgc+mVdf4N/1mvCuYM7/soQ=;
 b=sqg1AoHp6q78D/5k1aZUbMC/rr+B04B4ytTIlikJAIIzgkSpkueOJqYF87Rd+dnpu7bKjW
 N7jipcOzoRKhSM/J7jHy981gJUrbgib1a4iwYFK3u3UBkrmC6PmOqo+uu9i/ElHMPNNdQd
 ZqCOY/wA2VTreJwUNvjBpo2kddEWmJGCCm5CGsU4YnsZICiI41A5UlSsMtldJ/Gv3CLwDM
 TQfmWAgsDu2GIPRzPtMkBMVDITpS6NVX5eA7CYe0fNLcXp8NnTgPoCZc3FzIX72r4eJ1Bl
 TkpCBKxWZJxE47RMWIWnQKcKaEtbUD6UznuR7gD8faKV/xoFlg5PB9RwcB0vQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sqg1AoHp
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libite: fix missing deps,
 requires fork()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

Thanks for the patch. I've updated the commit title to:

  package/libite: add dependency on MMU, requires fork()

which is a bit more useful.

On Tue, Dec 16, 2025 at 10:35:33AM +0100, Joachim Wiberg wrote:
> Unfortunately, parts of the library is not very no-MMU friendly atm.
> The below check fails due to runbg.c requiring fork().
> 
> $ ./utils/test-pkg -c libite.config -p libite
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: FAILED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 
> The dependency was introduced in libite v2.6.0, so this patch should
> probably be backported to v2025.02.x.

Why "probably": it should be backported. So I've dropped the
"probably".

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
