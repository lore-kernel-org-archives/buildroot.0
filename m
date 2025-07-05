Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386FC8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6984040CB9;
	Sat,  5 Jul 2025 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3EwQ_xxvKZR; Sat,  5 Jul 2025 10:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AAA240C73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AAA240C73;
	Sat,  5 Jul 2025 10:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 013867AB
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBBC740061
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvHELYgpqrNe for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 10:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C46840051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C46840051
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C46840051
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 332E213F880;
 Sat,  5 Jul 2025 12:07:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 12:07:46 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 12:07:46 +0200
To: James Knight <git@jdknight.me>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250701185642.2173-1-git@jdknight.me>
References: <20250701185642.2173-1-git@jdknight.me>
User-Agent: Webmail Free/1.6.11
Message-ID: <b78f72de8f08c03822af10ad95f425c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751710069;
 bh=+S+iovFVMu/rzS33hqpmDMzf1bWgJE0XyGIa32NtMdk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GwGDWz5cYePlbV24AViGL1EDmJzmALtyAlBMuaM0r8gJU+GyWmLzHaSgiTSJO7Al+
 1kf2ychjdXSCnr5KF5YWpT0UY4Vm3iaVpJoCTNVDs/SDKoCc/SDu+7jMn4b+QsP5mB
 30Z38iL2qwqhjn5iELPMDHqA1ABEqAMvcuaMC3h+FgECKby3IevgAISeezTT4XM3jb
 JUk+L4GJupGiInzdtJAZo1bDqWgsNSLYdx74XPpBrd+y4amyxiUoSoOx86w6hGqr5l
 UUDoX2ryFR66crLiA1KvV8IRd3ZmsdfMPil8e0zOJNrQDbe3HryPB4+uqvh+6WPoq0
 Ut0s/4PoUqcmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GwGDWz5c
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-package: handle missing
 files
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

On 01/07/2025 20:56, James Knight wrote:
> When running check-package before completing commits for a change, if
> any files are setup for removal, check-package will throw
> FileNotFoundError exceptions instead of generating a warning state. For
> example:
> 
>  $ utils/docker-run make check-package
>  Traceback (most recent call last):
>    ...
>  FileNotFoundError: [Errno 2] No such file or directory: 
> 'package/.../0001-some-removed-patch.patch'
>  make: *** [Makefile:1264: check-package] Error 1
> 
> This commit will now catch FileNotFoundError and populate a warning
> message:
> 
>  $ utils/docker-run make check-package
>  package/.../0001-some-removed-patch.patch: missing; unstaged file 
> removal?
>  package/.../0002-another-removed-patch.patch: missing; unstaged file 
> removal?
>  427843 lines processed
>  3 warnings generated
>  make: *** [Makefile:1264: check-package] Error 1
> 
> Signed-off-by: James Knight <git@jdknight.me>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
