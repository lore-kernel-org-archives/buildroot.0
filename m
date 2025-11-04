Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B7BCCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 18:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB8A82300;
	Tue,  4 Nov 2025 18:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlBom_BbPD-o; Tue,  4 Nov 2025 18:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612FE822EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 612FE822EE;
	Tue,  4 Nov 2025 18:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8207462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE9BD8226D
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyZmga-WBU6K for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 18:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B44698229B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44698229B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44698229B
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:20:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3CC6413F89C;
 Tue,  4 Nov 2025 19:20:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Nov 2025 19:20:30 +0100
MIME-Version: 1.0
Date: Tue, 04 Nov 2025 19:20:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251102205454.3428417-1-bernd@kuhls.net>
References: <20251102205454.3428417-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <eef5ffcec06654c7a1d95b3d2e77c67e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762280435;
 bh=r1NqOLBzgsxgQYBSYf6WkD4STYw2dOxzUdD4zRovj/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jHskg+bgZKTwERKiDQVRaXaDtk+FTGWeyBuilQNWJAgASCdwg6OfdZU0C+eycJM32
 xyQmUwOjoNZ3QCzWjBrLTzA+aG6YfWO6cuoN0ImWWCX1OpKFDpqUHNQliEuDm78LHS
 CjNsxeLMKwdSHRU+fFyt9mJQa44rQ8fEZTne4lk2nl7XoCqAcP32pK2hQmch8e88+Y
 RG1wwi6jvPVs3jk6/I3nL3b9a1udvy0DfZvG3zDw62HQB4Dnt59vlxoR/pkZLDs7NG
 /+zo/xDKQPCTQr+chEZRlHo0gJKdbj1OpFuY4hXl9xukRO3ne5X9jQfykSvRYA2BwM
 mPESdS2xJGmeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jHskg+bg
Subject: Re: [Buildroot] [PATCH v2 1/1] package/llvm-project: bump to
 version 21.1.4
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

On 02/11/2025 21:54, Bernd Kuhls wrote:
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
> 
> Added upstream tarball for third-party code to llvm and compiler-rt due
> to upstream commit:
> https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
> and added a fix for compiler-rt to make use of the extracted 
> third-party
> code.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
