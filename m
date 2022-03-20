Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8FAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40287815AC;
	Sun, 20 Mar 2022 17:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-ZAilSAxbnp; Sun, 20 Mar 2022 17:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73688814B3;
	Sun, 20 Mar 2022 17:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 715E61BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F8EA60AD7
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBGHboOMEbV2 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:34:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E754960810
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:34:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D38720003;
 Sun, 20 Mar 2022 17:34:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVzRk-00FE0s-5j; Sun, 20 Mar 2022 18:34:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220224001455.206249-1-romain.naour@gmail.com>
Date: Sun, 20 Mar 2022 18:34:28 +0100
In-Reply-To: <20220224001455.206249-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 24 Feb 2022 01:14:55 +0100")
Message-ID: <87a6dkply3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: TestRust{Bin} use ripgrep
 package for testing
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > TestRust and TestRustBin has been introduced at the time when there was
 > no cargo package infrastructure or any package using rust compiler
 > (Buildroot 2018.02).

 > Since then the ripgrep package has been introduced, initially using
 > the generic package infrastructure and converted later to the cargo
 > package infrastructure.

 > Due a recent change in rust/cargo removing the cargo config file [1]
 > the test TestRust and TestRustBin now fail to compile since they build
 > an hello-world crate outside of the cargo package infrastructure
 > without the correct environment for cross-compiling.

 > Replace the 'hello-world' crate by ripgrep package and check if it
 > can run properly in Qemu.

 > Fixes tests.package.test_rust.TestRustBin:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202545

 > But doesn't fixes tests.package.test_rust.TestRust due another bug:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

 > [1] b6378631c2609742382984f6f7b93c1d9d2cdb78

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>


Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
