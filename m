Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7324C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4BB6077D;
	Sat,  5 Nov 2022 22:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4BB6077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fSkJv4wn4Gx; Sat,  5 Nov 2022 22:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6250960671;
	Sat,  5 Nov 2022 22:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6250960671
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE8A71BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E8F4054A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E8F4054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkgqSSTUPgPC for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:41:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A53A40629
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A53A40629
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:41:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3553B100002;
 Sat,  5 Nov 2022 22:41:04 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:41:03 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221105234103.4aaf8b03@windsurf>
In-Reply-To: <20221103224206.3984607-1-james.hilliard1@gmail.com>
References: <20221103224206.3984607-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667688064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjEhgSI9ycS2jLjU4ptdNUf+9QqvWESB2UTP+CdbytQ=;
 b=K+Gk7aSk2hFXsQoITMXa/m2mmY2as+wwuqBRn0zaHfQQF0byhUMi+ZxtdNtM7LAFQFlc4a
 ij/Gv7izcfXtpYiNR3SQhqZWrkLz+C4XLVLTisCuRydHAfQQnPBPZj93RBq1Y94cXuGAWL
 DTMWX871yc1ijnXhRZ9FdaFMxr8Q2uBGzpCEHvO/06fXT7wNaXjUcHd1+/FM6zKn8vgZ7C
 rAEtYJw9p/CwJiV98K/BAhqRFtrn1Rca7hZvyYfZsISeIVirgkj3a3MAW+74aK0ll2Ixvl
 Q2Yl2y1DaN4UWJnDOmgIIolWn0lo9W8eCBdI3qDyP42jbkDQ/C9yETF+3YZ6lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+Gk7aSk
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.65.0
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

On Thu,  3 Nov 2022 16:42:06 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.65.0 annoucement: https://blog.rust-lang.org/2022/11/03/Rust-1.65.0.html
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
> the Rust toolchain under 1.65.0:
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust
> 
> In order to verify the compatibility of packages depending on Rust 1.65.0,
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

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
