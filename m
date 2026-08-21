Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6221FC5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9728128D;
	Fri, 21 Aug 2026 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfVdbL6gn9n0; Fri, 21 Aug 2026 21:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787346580;
	bh=ILqsqFgriM/B7kMCKZT0+zHVQ8GS/zDdeEJPpdnu4bE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YusZC1gPoI/meTavPOayb2W6VdAiP/HOH19aTrEhXW6Y/uaikP9L/4yUxJw+F12ZL
	 bt8+qz/6iYYLPIyjD7zBoMVtXl72kPDYMax52z1FgM87eHXhjaQCwmPppkBDzcznII
	 +BiRyGP8Tz5ZPChsa6tsM9wFf7MzY8F+kvzigIFXbt5mHXScjIk0m72QVJDEql6yXi
	 l04EWLrG2mpbj13tLcT62vsM5IjNp+Fs9RNUlEzVh8BQd9oOHIYIiFMEcSYRDDTni9
	 uV8I9LTy3mxui1ssoQ/kaOW0KaIYfY/JCkBoBrs6vYtzdGOK6HBOnQU0jxviMc2huN
	 5e3dIxpJZD1cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C433381281;
	Fri, 21 Aug 2026 21:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9A4D386
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAF75409F7
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AwTIzOzE81h for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 21:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0189D406F6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:09:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8AC3313F880;
 Fri, 21 Aug 2026 23:09:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 23:09:33 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 23:09:33 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aoR7ez3vQcTtkViY@waldemar-brodkorb.de>
References: <aoR7ez3vQcTtkViY@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.18
Message-ID: <55341a46afb6228ad52e4d2563541c35@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/uclibc: PPC fix e500 fenv support
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

On 18/08/2026 17:34, Waldemar Brodkorb wrote:
> Problem found via Buildroot autobuilders, seems to be some
> bitrotting code. Tested with qemu_ppc_mpc8544ds_defconfig
> and a hard-float toolchain.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.net/results/464/46448883b1682718aeff066d204349d8e9a3b1d1/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
