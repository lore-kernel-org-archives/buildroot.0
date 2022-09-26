Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878A7C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3703A60F79;
	Mon, 26 Sep 2022 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3703A60F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8IfLVeLlqji; Mon, 26 Sep 2022 12:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6109F60F6F;
	Mon, 26 Sep 2022 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6109F60F6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ADD31BF9A4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 766DE60F6F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766DE60F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShJKG9-3aYN6 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:04:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23157605D6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23157605D6
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:04:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69C43FF814;
 Mon, 26 Sep 2022 12:04:12 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:04:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220926140411.48cbc132@windsurf>
In-Reply-To: <20220925054525.1841072-1-james.hilliard1@gmail.com>
References: <20220925054525.1841072-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664193857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gA6OeuFmelDOs+PRW/JcgNS7PurV1wrq0YqD52/75Pw=;
 b=kgxpeCDeWrs6epnKgFUOS5dmgyA1QjegvplvIMlIGx8YPDTJ4MbwvP95KjxPJCTwgPVW45
 +ydiyOWLzGMibBSxa31TVUZcjCy9rZl0rTB2sgcldz50L/jHu7EhZO+jKBoj0+vaFxIoee
 FdhM+dBq+1K5t13KgFthIS0qxG0dkebRhM+JbkgubWM+6WGf4iI+Sqwev7aZBv7Af/0Ht6
 LoyyJ90cEy1s3qU2qwIrSaK3JbW1fXKtlYZMFVwEoPUozoFhg+7kQhcS61nzfPYk5GUMax
 0WvfblHbjst0A7HTxtw/XcFINx7buqBYyMm7Rl8rqNO93xmSc5Lhp/7RKikcjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kgxpeCDe
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.64.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Sep 2022 23:45:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.64.0 annoucement: https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html
> 
> Newest version of the source archives have been retrieved with their hash values,
> and the signature of the .asc files have been verified as follows:
> $ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
> $ gpg --verify <filename.asc> <filename>
> 
> There is no typographical error in the packages according to the check-pakage utility:
> $ ./utils/check-package package/rust-bin/*
> $ ./utils/check-package package/rust/*
> 
> The testsuite tool were successfully run for rust and rust-bin packages to test
> the Rust toolchain under 1.64.0:
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust
> 
> In order to verify the compatibility of packages depending on Rust 1.64.0,
> tests using `./utils/test-pkg` were run.
> You may want to execute the test-pkg command after creating a `.config` file
> enabling the corresponding BR2_PACKAGE, for example:
> Create a file `buildroot/ripgrep.config` containing "BR2_PACKAGE_RIPGREP=y"
> Then execute:
> $ ./utils/test-pkg -d test-pkg -c ripgrep.config -p ripgrep
> 
> Results:
> librsvg OK
> ripgrep OK
> suricata OK
> bat OK
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   6 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 131 insertions(+), 131 deletions(-)

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
