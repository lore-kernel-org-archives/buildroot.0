Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28086C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38EE60F9C
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D38EE60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92498607BE;
	Mon, 26 Jul 2021 21:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExZ6E0CXsBAD; Mon, 26 Jul 2021 21:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1199607C6;
	Mon, 26 Jul 2021 21:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C49221BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31698379C
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PNCzsFMC0CT for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:47:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B875B8376E
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:47:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 93DE4E0002;
 Mon, 26 Jul 2021 21:47:36 +0000 (UTC)
Date: Mon, 26 Jul 2021 23:47:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210726234735.067da058@windsurf>
In-Reply-To: <20210725111231.359830-2-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-2-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/3] package/clapack: Remove
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, Benjamin Kamath <kamath.ben@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 13:12:30 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> clapack has been unmaintained for a couple of years. It is
> semi-automatically generated from lapack sources using the f2c
> fortran-to-C converter, which itself is pretty much unmaintained.
> 
> Remove the package. Remove the dependency on !CLAPACK from lapack.
> Automatically select lapack from legacy if possible.
> 
> Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Benjamin Kamath <kamath.ben@gmail.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in.legacy                              |  9 +++
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  ...bf2c-to-be-built-as-a-static-library.patch | 32 --------
>  ...est-build-sensitive-to-BUILD_TESTING.patch | 80 -------------------
>  ...-to-run-arithchk-when-cross-compilin.patch | 70 ----------------
>  ...add-library-and-header-install-rules.patch | 23 ------
>  ...add-library-and-header-install-rules.patch | 24 ------
>  package/clapack/0006-remove-uninit-f2c.patch  | 24 ------
>  package/clapack/0007-off64-t.patch            | 16 ----
>  package/clapack/Config.in                     | 33 --------
>  package/clapack/clapack.hash                  |  5 --
>  package/clapack/clapack.mk                    | 22 -----
>  package/lapack/Config.in                      |  1 -
>  14 files changed, 9 insertions(+), 332 deletions(-)
>  delete mode 100644 package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
>  delete mode 100644 package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
>  delete mode 100644 package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
>  delete mode 100644 package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
>  delete mode 100644 package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
>  delete mode 100644 package/clapack/0006-remove-uninit-f2c.patch
>  delete mode 100644 package/clapack/0007-off64-t.patch
>  delete mode 100644 package/clapack/Config.in
>  delete mode 100644 package/clapack/clapack.hash
>  delete mode 100644 package/clapack/clapack.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
