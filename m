Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6571C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B61F400A2;
	Wed,  5 Mar 2025 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kljsz2cto1vr; Wed,  5 Mar 2025 20:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598CC400BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 598CC400BF;
	Wed,  5 Mar 2025 20:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B64E195F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5BFB404C3
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOhGeBXW22Qh for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 20:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 926EE404E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926EE404E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 926EE404E8
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:25:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A676A780510;
 Wed,  5 Mar 2025 21:25:00 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 21:25:00 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 21:25:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20250305184400.3555236-1-peter@korsgaard.com>
References: <20250305184400.3555236-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c79734f194e4eb3603669d00b97a3c97@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741206304;
 bh=FIPM2h6xVEQxV+yVZeJaq7vkcOBkSZUwIynl73pVmNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C9Waq9jpsw1f8lup4tsHawpx8ZXC/8lJFBCkqyPt5ECJcIuOuvKvT6HJRsAn3CGxs
 8zU7gQZZPpWeciQ+4zdEdhq2/mKrq9Sb6vmFEjz8XYAJ2XRBnxQJIVnIeXogW830KW
 kP6xMt/n49ErfdrRb3qxv8q1AP+aC1fHcGSbGZns1QjzfFqefeWdveuxRmZA2F8qy7
 ndoFfh28gvP01lkurlAifRIc2fP6FVkDxhQBVeSeZMlbUtp/BMi0HUa+HpSQrvhTEu
 nMgn4cLjuPk2H2kI/5ff2owkavZHlNsj/sndgeadcYrhsVqnJiC9P3zmSYsVnWtF5h
 k8RlR6wYmRr9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C9Waq9jp
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.23.7
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

On 05/03/2025 19:44, Peter Korsgaard wrote:
> go1.23.7 (released 2025-03-04) includes security fixes to the net/http
> package, as well as bug fixes to cgo, the compiler, and the reflect,
> runtime, and syscall package.
> 
> https://github.com/golang/go/issues?q=milestone%3AGo1.23.7+label%3ACherryPickApproved
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
