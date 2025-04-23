Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D69EC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F1F832C2;
	Wed, 23 Apr 2025 19:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxd4d_kxWjxD; Wed, 23 Apr 2025 19:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7568319F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7568319F;
	Wed, 23 Apr 2025 19:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D671319F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86DF403F1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9bQYMFvT5rg for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D59C540288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D59C540288
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D59C540288
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:28:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CCCD878032A;
 Wed, 23 Apr 2025 21:28:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:28:27 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:28:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250422145553.1278313-2-elmehdi.younes@smile.fr>
References: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
 <20250422145553.1278313-2-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <ce4f1cb6afb11f889069e542fa79d31d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745436508;
 bh=9zUo23jpv3lnTweyYM9pXKu40mYtfc7+lfPG/2AD7fE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cfzvn0ie8JBnVkZVmBVH5jktHNMRkm3zvCNJorzVlAfVznq5Wmb7ZytQPhYQFnj/r
 fb0YXIW/ihpJH7vuJRZgFIt3zEupxEVRQ/k73W4Uu0FQGY606hPJp3rNQ6uTpTivYu
 E4YXq8l5Du5xH5FlRH4sSH8FJ3V6q8KajIunVbrfTpnGOo/ni09HuvFVgd4qsPJ7ZT
 iVanKRbUw7/CaJZiWI4ECM93abOOpYgAy7n6zs4cFtSSmv8V5BM7b+gvfhc3/hjL99
 DrdyvRt5fr0aXw78DcYufqOFPmK0WjBvXGt1pn8EFCKzF31xLJmhE0bJ66OeEiW7N/
 jiU+QsRxq4ivw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cfzvn0ie
Subject: Re: [Buildroot] [PATCH 2/2] package/dust: bump to version 1.1.2
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

On 22/04/2025 16:55, El Mehdi YOUNES via buildroot wrote:
> Release:
> https://github.com/bootandy/dust/releases/tag/v1.1.2
> 
> Note: version 0.9.0 of dust fails to build when running
> the runtime test on the armv7 architecture due to an
> unconditional import of Atomicu64.
> 
> 	error:
> 
> Compiling config-file v0.2.3
> error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
>  --> src/progress.rs:6:18
>   |
> 6 |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
>   |                  ^^^^^^^^^
>   |                  |
>   |                  no `AtomicU64` in `sync::atomic`
>   |                  help: a similar name exists in the module: 
> `AtomicU32`
> 
> For more information about this error, try `rustc --explain E0432`.
> error: could not compile `du-dust` (bin "dust") due to 1 previous error
> 
> This issue was discovered while writing a runtime test
> for dust. upgrading to version 1.1.2 resolves the issue.
> 
> More details available in the following issue:
> https://github.com/bootandy/dust/issues/423
> 
> For now, we bump to the latest compatible version
> which builds and runs correctly. We can't bump to the latest
> version 1.2.0 since it requires a cargo version newer than
> 1.82.0.
> 
> 	error:
> --  The package requires the Cargo feature called `edition2024`, but 
> that feature is not stabilized in this version of Cargo (1.82.0 
> (8f40fc59f 2024-08-21)).
>   Consider trying a newer version of Cargo (this may require the 
> nightly release).
> 
> The upgrade to 1.2.0 will be considered once the patch for
> Rust 1.86.0 is accepted.
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
