Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3344C5DF97
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 13:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97DEF40555;
	Sun, 23 Aug 2026 13:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mew3QfgaplJS; Sun, 23 Aug 2026 13:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787493310;
	bh=WnzZZckXzdVejPOXWMnQwLtJWJvN3S6S6jp7pedm7bc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qGrE/QOvXRiADTwWBJ+SQoIvCdneGxrYdbd2TEkd2McIxLdLqP6F/oxJvKviC9Wpe
	 W58x5aFkjBIvrRXCds7zyChaTU+iW56bxIc+J7kxlFCayGwNC91MpGjSQ9vEsi8HM8
	 hu3kBoCYqgMmmMdLvK4xM/JZ/bVwL4DjBrY+gKUan69je48Ra+kBO9QiS5sym1/5EJ
	 OLth1JCjkargCLXzkigKJh8YlfHng1nb0+3y/1HEHZVGtGEG9uuBf4Alf6sX1+ZhiI
	 yN3SZEuQVW+eJE48Dx2GS3ioIVLsR9txaQElJgH496wXQZ/bL9Ozk1V7tHrMLZDHEV
	 xXONTr/2ddJYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BD140565;
	Sun, 23 Aug 2026 13:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1E632FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF90D60641
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeJAWmmchDcC for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 13:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E84B60616
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 88C5DB00571;
 Sun, 23 Aug 2026 15:55:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Aug 2026 15:55:02 +0200
MIME-Version: 1.0
Date: Sun, 23 Aug 2026 15:55:02 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, Boerge Struempfel
 <boerge.struempfel@gmail.com>
In-Reply-To: <a0108d7a-0e31-4177-982a-c07a38570384@grenoble.cnrs.fr>
References: <a0108d7a-0e31-4177-982a-c07a38570384@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <140f18be9d5fcc5bae3469b3e451565e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpiod2: fix build failure on
 missing C++ compiler
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

On 19/08/2026 22:50, Edgar Bonet via buildroot wrote:
> The meson build configuration of libgpiod2 unconditionally requires a
> C++ compiler, although it is only useful if building the C++ bindings.
> This is causing autobuild failures with an obscure error message:
> "ERROR: Unable to get gcc pre-processor defines".
> 
> Fix the failures by only requiring a C++ compiler when we want the C++
> bindings.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.org/results/d1c19ffa0c599bd2ba9be965a98fc8f778d6e366
>  - 
> https://autobuild.buildroot.org/results/c6b3c9311d628bdb4ea103431767493fab9a3668
>  - 
> https://autobuild.buildroot.org/results/8e799050c5779c680ff5e5136571f57d29239f2f
>  - 
> https://autobuild.buildroot.org/results/d6d8833acfe00559579defbbf3ca34c0edbe7869
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
