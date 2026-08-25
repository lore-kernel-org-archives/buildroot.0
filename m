Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E9C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D706072A;
	Tue, 25 Aug 2026 20:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK1Xe_ML19iQ; Tue, 25 Aug 2026 20:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787688665;
	bh=+icvT90+8umZOXR95CQk/II3mZ+PrYNYx+KEBQpPCHU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KH9frL2LOk3qdKAuVDZFcG/7397nBLoRutuxxKnQyn19AhuQFSm+SWG2QFSVEorw9
	 DgRTAKvqh4jse2Z3gbnTJ5N++Rk0hmrH0Ix4yAS3ZuKRG/+LrZVtrDDaqYmcrHGpOM
	 FV5hFkH6KtxBN2dY9RqyFVa6/ZQyih2Blr2lkKFzhEPmKS5fuwefZneGTVQBG7iiZ5
	 9MesgkL2r0lLxNeavtHj684kYr5O/LnNp+QF0l+95BMU2trzF84GxNXGwd1PFBbcRS
	 6A7NoPK4CnKpATo+LSNLjkYNA1wJQ/n9hva/S2jQAwpo0uWXHrbI6WyBoxNtxoJZ7f
	 Oqxu5yw5ngDCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1096070D;
	Tue, 25 Aug 2026 20:11:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A79D334
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703E740639
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEpOHgZjl9yG for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFB864053E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:11:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 71F4E13F880;
 Tue, 25 Aug 2026 22:10:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Aug 2026 22:10:55 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 22:10:55 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20260825093406.1932342-1-thomas.devoogdt@barco.com>
References: <20260825093406.1932342-1-thomas.devoogdt@barco.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <783f56518d838b7dd85afc5e23ec24e4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/expat: fix no high quality entropy
 warning on Linux <3.17 or glibc <2.25
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

On 25/08/2026 11:34, Thomas Devoogdt wrote:
> xmlparse.c:150:4: error: #error You do not have support for any sources 
> of high quality entropy enabled.
> For end user security, that is probably not what you want. Your options 
> include:
>   * Linux >=3.17 + glibc >=2.25 (getrandom): HAVE_GETRANDOM,
>   * Linux >=3.17 + glibc (including <2.25) (syscall SYS_getrandom): 
> HAVE_SYSCALL_GETRANDOM,
>   * BSD / macOS >=10.7 / glibc >=2.36 (arc4random_buf): 
> HAVE_ARC4RANDOM_BUF,
>   * BSD / macOS (including <10.7) / glibc >=2.36 (arc4random): 
> HAVE_ARC4RANDOM,
>   * BSD / macOS >=10.12 / glibc >=2.25 (getentropy): HAVE_GETENTROPY,
>   * Linux (including <3.17) / BSD / macOS (including <10.7) / Solaris 
> >=8 (/dev/urandom): XML_DEV_URANDOM,
>   * Windows >=Vista (rand_s): _WIN32.
> If you insist on not using any of these, bypass this error by defining 
> XML_POOR_ENTROPY and be vulnerable to hash flooding;
> you have been warned. If you have reasons to patch this detection code 
> away or need changes to the build system, please open a bug. Thank you!
> 
> This is caused by the upstream commit "Autotools: Stop using 
> /dev/urandom by default"
> https://github.com/libexpat/libexpat/commit/d30eca113a44562137d59835cf2255ea32d11ba6
> 
> But since all Linux systems have /dev/urandom, we can just enable it by 
> default.
> 
> Moved config options to multiline layout to fit within the 80 
> characters.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks. I also added extra info in the commit log. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c22fc74f2b4e5b6082203ecd839d530058e0106d

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
