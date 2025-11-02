Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175ACCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 17:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA166F5C2;
	Sun,  2 Nov 2025 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoEcVovpYAs1; Sun,  2 Nov 2025 17:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1826F5BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1826F5BC;
	Sun,  2 Nov 2025 17:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A35632A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89C0A84EB8
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihvP1pFonp3c for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 17:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A89E84D60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A89E84D60
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A89E84D60
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:11:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B125D7804FD;
 Sun,  2 Nov 2025 18:11:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 18:11:42 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 18:11:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251025070743.3338476-1-bernd@kuhls.net>
References: <20251025070743.3338476-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9702788ac3094a1ff4cfb0744c8d208b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762103508;
 bh=zEk8GQaw3Cvad7oieZRM+6tDtsZZfukRtqFsi9cetlY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qN48E+azkBAZO54kklkOI5Kek0p5/PwVITV3ysKsBCVF3EGFIuyOfVRzrhsEFD1gO
 l/uzrwOazzFazHw5kbhlow0x/viVHqgWZvuZ96P0IAHYeNDlaK5lrZHWgwbyShHdUG
 0HnGX2ePfmweYUg7SnHyNRDs+XpDn7i9U4CSLvEIWDQozoDIx2icwdEBFTtG5ObP2K
 jRbLJRftWPk+1F6cYPs9U0UQg+ewgE/0YebGXJodP3mNSR7z4NgjqVwH7u8fdCPMRb
 yb0xn7NknGLQnElEowlBULwSVsAzaTRwZWD49iEKHprwjb6dQB61VwmWocKJ3XkHDD
 8FbRgvwZjBNBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qN48E+az
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 21.1.4
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

Hi Bernd,

Thanks for the patch.

On 25/10/2025 09:07, Bernd Kuhls wrote:
> Release notes:
> https://discourse.llvm.org/t/llvm-21-1-4-released/88651
> https://discourse.llvm.org/t/llvm-21-1-3-released/88525
> https://discourse.llvm.org/t/llvm-21-1-2-released/88398
> https://discourse.llvm.org/t/llvm-21-1-1-released/88244
> https://discourse.llvm.org/t/llvm-21-1-0-released/88066
> 
> Update spirv-llvm-translator to align with 21.1.4
> Release notes:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.1

With this new version, the test_clang runtime test is failing.
You can reproduce the issue with the command:

     utils/docker-run \
         support/testing/run-tests \
             -k -d dl -o output_folder \
             tests.package.test_clang

Then, the output_folder/TestClangCompilerRT-build.log file contains:

/buildroot/tests/TestClangCompilerRT/build/compiler-rt-21.1.4/lib/builtins/aarch64/emupac.cpp:16:10: 
fatal error: siphash/SipHash.h: No such file or directory

Could you have a look, please?

> 
> Added upstream tarball for third-party code due to upstream commit:
> https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
