Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33231C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C8160AF1;
	Sun, 30 Oct 2022 11:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C8160AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDgEknF_BbCd; Sun, 30 Oct 2022 11:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1885460ABB;
	Sun, 30 Oct 2022 11:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1885460ABB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC7251BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4CC0812E7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CC0812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHanPeNm4nty for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E8F8129D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96E8F8129D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8807E240003;
 Sun, 30 Oct 2022 11:10:47 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:10:46 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221030121046.380d3373@windsurf>
In-Reply-To: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com>
References: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzOj9Mx9/SrOtr7A0cekl8uIvDa/pxGUMcN93wuIQ44=;
 b=ncvOsIy+9+06ZWNxIB7OwYAVJlWsplgF+ej+YSl8NQvU9tuqD4G6Ke+vwn061OIqCLa7Li
 ovkazwDGD130ajNs2xjcAyZBa2qMqiIMtBR0Z63ErbgvPiRUm4cvI44uwGZijPCf1f4Bih
 mTz3/f4VLhCqZzxX59pSxM1V52RyCQGRACK23mN10TMbzt09JBvdLCd3KqtXjP02hxPlpv
 nRhmVkhpqimAxz7PRsbNoV6A1MNeYppyY/DD2YpREaM4fgE4OU1M9BILO/KsY1OlCeZlv5
 kMzOHB0znOEr4g4E4bmo9yT7H9bs6Hk4uBupkSh8f080XgUvYwG2zLG6Ro8Wcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ncvOsIy+
Subject: Re: [Buildroot] [PATCH] package/nodejs: drop support for the MIPS
 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 19:57:05 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> The build of NodeJS fails on mipsel due to an issue in the V8 code:
> 
> ../../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4106:48: error: call of overloaded 'Operand(int64_t)' is ambiguous
>  4106 |                 Operand(static_cast<int64_t>(0)));
> 
> There is apparently a lack of maintenance of the MIPS port of V8, as
> is discussed in the Github issue at
> https://github.com/nodejs/node/issues/26179.
> 
> Until this get improved/fixed, our best option is to drop support for
> MIPS in our NodeJS package.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/0e6ee80c77bcb77afe18410e8d9da93b738cb0a4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/nodejs/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
