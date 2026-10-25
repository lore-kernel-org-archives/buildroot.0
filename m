Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909E606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pNn3/EzT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3B66060B;
	Sun, 25 Oct 2026 17:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qanYwuew44Gz; Sun, 25 Oct 2026 17:38:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69F4D60600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949929;
	b=hcMIBRzMUIBgrubncg7vIU+J/lgQwbG91z0QG2jnwaqNhSxVvE2OGcbUAIYYYLeMphFE
	 KrYSb9/Q3lo/gurvWdnJgHoLYMI+igOzGwSuac02MeR2GEkFLHsISklKr56t2xyv8E52S
	 n69O0swixRYd3GWKr4T0C/DH0rM0pw0ACJnQxTLWuBwv8ePSMcHAYE02elWhACO6a4sZv
	 6LcdcaMxLMoU8ym5yzn2hctpNQv1eoNpKp0CMfeRVaztMp4PV20VTDsr43sm44hpVlzPC
	 vhDN9wE5qJvKRMXCLdchwS043Hb0/HoliiUvpYH3nZUrdpomsD9cExkE+7HSM/DDcRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U6Nx85zMkAFH+p1BNfJTmepztCC9zJkHJ07H8zurXnU=;
	b=amin3sF8TWQnW4lrxoy+3C98/M+efg0WaHnNLPrF5xPIqOVqNpsoklNICZe43L0h7NiT
	 Ugcu7kpNMbChVScQwxB4Bz5BuWz6rj7Em9yqow/cv2TxkNaBxT7my4ohtQgHogmrocHZs
	 LJoCZ/JJoGcowBUEhl+peIO+PxdMI+loV/5XOP0ptreyxEWKhu0rkwWcnHtwiBW2rTxhr
	 QBErC/fOlR5J6JHHkOgcwq5hqiyEQSa384lPkj/ALe6gk99bzQkorsGSaV88e9ITLmyuX
	 lZHqelnJ33dKU5OWOGcz6qmZGf0HWruJ2A79VYts44qjCObXzNtdRFVtLYyaZGIpi5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949929;
	bh=U6Nx85zMkAFH+p1BNfJTmepztCC9zJkHJ07H8zurXnU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pNn3/EzTVRTialUwxtBGqXdmsa84iPnbMDVMVZ/mgT8LP7zADBkHjwMsxz7dpDerA
	 xufimbWU0oOxCFNh33pX7ABlEq6e2c/Ne/tYSRyZX6BVag0gwLrql7AXDzqeaVGVLz
	 1sqEfKsCCCfrWIopavpY34NUiGDkeex0fKMwUcKXlvqsHiQ+YWbOqLb/voVblbBhrm
	 C34lluDE1qyFsvjbvqL920LljIp0nw2bqEG4T2r+uZufg/TMiNfb/vK2Ttnmd97Am7
	 05BRT/ndDUWRGkgOvRgs+7JivzYttilYYM6zarciJNC5mYgYRczeVnCFcqIPP+D27n
	 NAFRmtpUdHnkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F4D60600;
	Sun, 25 Oct 2026 17:38:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 114A4235
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF8540098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZJHdHiFvDlU for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7982D40057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949926;
 b=FVFg6Sr9kk3LBOyUOu5Y8z+LN1W8eUXvJ5emJiXqaDTlX5K1HJR67orm5Lchb/DqAVfG
 NSrDcQHIrpkLCS1zwkSWBEvVZ6Ctzlgi9UGbZ/bCttNArpP/f52i/HYkfxu5DGIkKbOuw
 y5c+l0lpnCdVYUKsbrLTG9Ms7gpSM1o0m97yboXdOkTt42rymfxEyoV5O8dtjs/KXfa65
 fkaHqA7GVfZHnF19GOoskbaWfjTIEj2yYcWFGy31BYU0JecAqQ/Rm9wUXbYo6RvwwL9zN
 giINSDSe3PFQoowzwyha1BKtulBzY1uQyCKH+RONZBEWZ0B0SzQcy0I6ACdsU9ZWC0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949926;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TOzsbwdLB8QkydINQPXh7xZzL44BLZbrqrUSlr6xq2g=;
 b=MJP/8f1ed76qqAXLogdFF+xrrzZKCVScR7IOXJPpJmdhFZ7lTcM8FUjyt1rUe4A7OAH+
 b7siGz+ABPHjl9la+mE6pE0pXugdoSKczKtFS9sAm5Wt0cc0Vn5YjQycsflxG8wSJh8GU
 3OPrvMN8e+SCI+aR6yiOAgOgKjoDYY9cP1xoHeQ64zH4ekDJ0FwnJmVM6GKWZBk8+PVtJ
 Qzq74/rx8I2zwf2D1hipbFp5MY5b6T+tSgGZGCg6YwfiZt+0ZtOw6kMoX+XGPYfcSP5Gx
 DxQrsX1pcApDO5zHHQKefM4NSnTWr21OsdU06KvS5oWwoHhGABfa9jhxVogFapc3WRQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dHiVcELr; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7982D40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:38:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DE9C24E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:38:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0C5C60740;
 Sun, 25 Oct 2026 17:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C58FB10328E76; Sun, 25 Oct 2026 18:38:42 +0100 (CET)
Date: Sun, 25 Oct 2026 18:38:42 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at4-bu3oFwEQrLnR@windsurf>
References: <20261024082424.3219244-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024082424.3219244-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/uclibc: declare wcsdup() for
 POSIX.1-2008
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Sat, Oct 24, 2026 at 10:24:24AM +0200, Yegor Yefremov via buildroot wrote:

> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/936a08b682e761afba98ef3800265add951201fc

This link does not work for me, it requires authentication. So I've
replaced it by a link to the github mirror.

Applied with this change. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
