Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2161C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9953360A6E;
	Mon, 13 May 2024 19:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlH99Ot-OjDs; Mon, 13 May 2024 19:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4532605EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4532605EE;
	Mon, 13 May 2024 19:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06FF61BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8013812FA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHfarvZgHNmc for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC5B181299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5B181299
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC5B181299
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:49:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C50A21BF205;
 Mon, 13 May 2024 19:48:58 +0000 (UTC)
Date: Mon, 13 May 2024 21:48:58 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240513214858.0d76a1ff@windsurf>
In-Reply-To: <20240512203452.836377-1-fontaine.fabrice@gmail.com>
References: <20240512203452.836377-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715629738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FO3TJGc4JadFtER8KnBFmaQ8eVVA3ZRF/tpMkoAEVY=;
 b=dRWfDgGEdirIxP3VsRgg9Lzf367hL51djud5X89pVKSRatWS7T0TKcHjOntpH0bkhpkcJ1
 pb7ipHX9bfsqqAH2Q3fIGLHxrkDTyl5IhxKfDnMUUmxskgTmlKtBzu68dgp7bfj5blQbfF
 0UT/Zt8m78CyKIB/JdN8hsNbwq52ePzYdv4doWlo8LI3R0vLVYOtH65Db9wWUz12h6Dmkq
 RGuaE9GNLccCJc/DIEtRCnXPFd1njA16BiUvWdXzXyX35N7XPwZmMLEuQggcPTHu1HSpmC
 h3LmPO7qNccmQgaCF/F+tApvoWBdYTyb+++j6KCzjAwog0FGHLK7xnPwvoqTEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dRWfDgGE
Subject: Re: [Buildroot] [PATCH 1/1] package/duma: set HOST_CFLAGS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 May 2024 22:34:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set HOST_CFLAGS to avoid the following build failure raised since bump
> to version 2.5.21 in commit af2cd694e3903131d6e2f00646adfa83a89a23e2:
> 
> /usr/bin/gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0   -c createconf.c -o createconf.o
> gcc: error: unrecognized command-line option '-mlongcalls'
> gcc: error: unrecognized command-line option '-mauto-litpools'
> 
> Fixes: af2cd694e3903131d6e2f00646adfa83a89a23e2
>  - http://autobuild.buildroot.org/results/28be2acc6d58754c7431df81d0b63b30e6af8554
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/duma/duma.mk | 1 +
>  1 file changed, 1 insertion(+)

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
