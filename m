Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30105CD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19AD61BFF;
	Sun, 31 May 2026 06:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKNpr621iiif; Sun, 31 May 2026 06:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81D96164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780209674;
	bh=CJ7df9EbAtdkvyPkGo0q5XuvD8eHJ6e8C3BpdCf27TE=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=krl/c2blC9XDvzy6CL8yAXCTUe13gdGR2MeYlXoFBn6l8hjSailj7GdVLgqIEhn+N
	 RDQhNg5nzXsjw6fXW73loiEmyoG0+NXdwR7dj29aDe4aOyaHnL74FLZmwKbI2gnvWQ
	 jqIvDc/lOfv48WNugOTa78ZjTZDoivABAAaxu/ZwNs4kRQNchJNx9HOswhI/MG0nWP
	 Hpn0TfRMu4R9t918c9v5r2V1N3QwE6moI6Y7z7vri4OlzowIvwNxG1sUGhWnJMdGq4
	 DL3OELK/bkADEMwURCt3xD0jmLlIFowjNgrHT5t0/gZw/JmcdqC0OpKt+MTD+jm3gO
	 SK7A4VpXSRBSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B81D96164D;
	Sun, 31 May 2026 06:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B10F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3BE440422
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW3woDb5rg63 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1626B403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1626B403DA
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1626B403DA
 for <buildroot@uclibc.org>; Sun, 31 May 2026 06:41:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTZrB-0005U4-3s
 for buildroot@uclibc.org; Sun, 31 May 2026 08:41:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 31 May 2026 08:40:47 +0200
Message-ID: <pan$ccd39$d3526d3b$b2ce412d$712d2cdb@ID-313208.user.individual.net>
References: <20250514022327.583983-1-james.hilliard1__760.175105982341$1747189434$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: bump to
 version v3.3.5-53-g9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 13 May 2025 20:23:27 -0600 schrieb James Hilliard:

> This package has received quite a few updates but doesn't seem to be
> making releases anymore.
> 
> Quite a few of these updates will be needed for compatibility with newer
> mbedtls versions for example.
> 
> Lets switch to a git describe based version for now.
> 
> Drop patches which are now upstream as well.
> 
> Signed-off-by: James Hilliard
> <james.hilliard1@gmail.com>

Hi James,

this patch was superseded by https://patchwork.ozlabs.org/project/
buildroot/patch/20260409084305.3960494-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
