Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2FBFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FD08129D;
	Sun, 30 Oct 2022 11:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9FD08129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9n4_nhvXDQAh; Sun, 30 Oct 2022 11:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2DF80FAD;
	Sun, 30 Oct 2022 11:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2DF80FAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 618581BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B73F402F8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B73F402F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8qp97P0sai8 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D78401ED
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8D78401ED
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:10:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03DA940005;
 Sun, 30 Oct 2022 11:10:13 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:10:12 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221030121012.16d94116@windsurf>
In-Reply-To: <20221026193606.3943977-1-thomas.petazzoni@bootlin.com>
References: <20221026193606.3943977-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlOIRhfty2NDc5MQsst5ziBXNOw/RLLEJ2Y1ekiTD3Q=;
 b=IE9HGGqIBosAYL1l8cxhm8os1VMguV7DZSJYwK5n1VlZ1Wsvj6nZqpoLoDWI/s2OGSaw3q
 ywsZArKRHcvkzGpFK/nBqJ+z8zTzGl9dGpBr+MuoVYvYfxC2ZgugwQjOuY7HDxJmDzZB4r
 D4xld1yaSWpWzl78R6a1nQw1DezkJlW28pWBej4+oKioKByoQL88joAEE/on9NCEe97JAg
 vGq0ZUc89b7/QTaFqyc1dYffmCo236iDQjjfBt50SsMV0f8OUH/Fsrlabp1iv9GJHDBtXC
 NB6/Zyl2SAz3LHGoOpvTWGHBJIMT3fRK8baAE7uGm/kpOtzT2qQjc78SouaUjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IE9HGGqI
Subject: Re: [Buildroot] [PATCH] package/sentry-cli: fix build failure by
 bumping to 2.8.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 21:36:05 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> For a very long time, host-sentry-cli has been failing to build with:
> 
> error[E0512]: cannot transmute between types of different sizes, or dependently-sized types
>    --> /home/buildroot/autobuild/instance-2/output-1/build/host-sentry-cli-1.59.0/VENDOR/socket2/src/sockaddr.rs:176:9  
>     |
> 176 |         mem::transmute::<SocketAddrV4, sockaddr_in>(v4);
>     |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |
>     = note: source type: `SocketAddrV4` (48 bits)
>     = note: target type: `sockaddr_in` (128 bits)
> 
> For more information about this error, try `rustc --explain E0512`.
> error: could not compile `socket2` due to previous error
> 
> This socket2 create issue has apparently been fixed by upstream commit
> https://github.com/rust-lang/socket2/commit/fd1565af4a82e765754d5baa3ff6e61a2627cabc,
> as it removes/reworks the problematic code. This commit has been part
> of socket2 since the 0.3.3 version, but sentry-cli 1.59.0 uses socket2
> in version 0.3.2.
> 
> The next version of sentry-cli that has moved to a more recent
> version of socket2 is 1.61.0, however this one also fails to build
> with:
> 
>    Compiling sentry-cli v1.61.0 (/home/buildroot/buildroot/output/build/host-sentry-cli-1.61.0)
> warning: fields `schemes` and `name` are never read
>   --> src/utils/xcode.rs:41:5  
>    |
> 39 | pub struct XcodeProjectInfo {
>    |            ---------------- fields in this struct
> 40 |     targets: Vec<String>,
> 41 |     schemes: Vec<String>,
>    |     ^^^^^^^
> 42 |     configurations: Vec<String>,
> 43 |     name: String,
>    |     ^^^^
>    |
>    = note: `#[warn(dead_code)]` on by default
>    = note: `XcodeProjectInfo` has a derived impl for the trait `Debug`, but this is intentionally ignored during dead code analysis
> 
> warning: `sentry-cli` (bin "sentry-cli") generated 1 warning
>     Finished release [optimized] target(s) in 55.05s
>   Installing /home/buildroot/buildroot/output/host/bin/sentry-cli
>    Installed package `sentry-cli v1.61.0 (/home/buildroot/buildroot/output/build/host-sentry-cli-1.61.0)` (executable `sentry-cli`)
> 
> So we just gave up, and went for building the very lastest sentry-cli
> version, 2.8.0, which apparently builds fine, at least in the
> configurations that used to previously fail.
> 
> Yes, such a huge version bump is probably not ideal as a "minimal fix"
> to backport on our stable branches, but that's probably the best we
> can do without investing too much effort into this package that is
> otherwise poorly maintained in Buildroot, as nobody stepped up to
> address the issue even though it has been failing for months.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/883b83a5ee44206e0d67a30787bf5d60765ac1e4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/sentry-cli/sentry-cli.hash | 2 +-
>  package/sentry-cli/sentry-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
