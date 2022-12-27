Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CA6C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B49881420;
	Tue, 27 Dec 2022 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B49881420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cu-DhNAnPxL; Tue, 27 Dec 2022 20:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DD280C2B;
	Tue, 27 Dec 2022 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DD280C2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41A2B1BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CE5B40386
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CE5B40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvwvy605fozc for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:50:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7CD340260
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7CD340260
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:50:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E33D360004;
 Tue, 27 Dec 2022 20:49:58 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:49:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221227214957.3ec9866e@windsurf>
In-Reply-To: <20221224013507.2479567-1-james.hilliard1@gmail.com>
References: <20221224013507.2479567-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672174199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=597JQycjeN0267VKpoiMWmduT2PH4++W0dKGj6KdhHQ=;
 b=WjOhDjVW+8j8jVgZwVJzKRVUk9S1VjvZs/kLTd5WmLO/ADFkwmrESIFIlzlagUHWlWBRWJ
 kI6zIup+FirB+S7WewtH4x6ARyOZHAyZiN6aVbYRKwrQxaR+U58LV/1Zc6KR1ZlC8gFkV+
 TK6bRcHnZl7vPRS9iSuaEKScmS9kDZHjx6OChQJHAVNqXJ8aoAtb8fHUuFP4VRjK30ElgF
 h9+ZaF7pPAeZjKE1kiOSYPtvWoEDxbA+J5vM3khOcBkZds7UgiRIsaIjB3bCjLTfVtg1JE
 o5fXagiH7eszYPFDf9+yIf4xHpJcLN52IjpjqouGAN9nWGoRoBjDjJ1Jff+K9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WjOhDjVW
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.66.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Fri, 23 Dec 2022 18:35:07 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.66.0 annoucement: https://blog.rust-lang.org/2022/12/15/Rust-1.66.0.html
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
> the Rust toolchain under 1.66.0:
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust
> 
> In order to verify the compatibility of packages depending on Rust 1.66.0,
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

Hmm, you know that instead of creating one snippet for each package,
you can create a single snippet that enables all those packages? It
would actually be a useful snippet to add in the commit log as it could
be useful for future updates of the Rust compiler.

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
