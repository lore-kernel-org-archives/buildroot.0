Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF23C001B2
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7423360777;
	Sun, 11 Dec 2022 10:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7423360777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqL-qXYShBlq; Sun, 11 Dec 2022 10:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2BC605D8;
	Sun, 11 Dec 2022 10:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2BC605D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 563621BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F1D7812E4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F1D7812E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UQCS3Y176ni for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:42:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A88812D7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9A88812D7
 for <buildroot@busybox.net>; Sun, 11 Dec 2022 10:42:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D13A3C0007;
 Sun, 11 Dec 2022 10:42:22 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:42:22 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221211114222.22ee2257@windsurf>
In-Reply-To: <20221210095435.3050998-1-francois.perrad@gadz.org>
References: <20221210095435.3050998-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06/4Y2H37+Us5IZvdxgoSvHcgVMHIHG+phXWjBTpxeY=;
 b=N4FUiXYt2x27n3IWBN22Ud9qfrzFeZg64J6LzbwkhqLTSr5ozLYQ425/aPMeU3+S5TpIB1
 APKNMv5TNUTPRbo0ci/aeduxIJtF0gHnq9d8Qw3wB9RnIDAo666Z3zOwVV9u6MxUckM+Q9
 eXYR2swd79dvqbwfU+23z0K3bL6iQQv30Zh5UAFHDfl0zRVWuzQC/qUQ3jeP1AyXc0uA1d
 yQ/iQmu0/V23B17sZAa4Xg6N5Rp1TUuJthIX1Q1fIPMqE1klDBKgL4FwofbsBKysR7p1/Z
 lcwZdzlP9fGaIyx1waE+ZPdhCcKslgYhQQfTie8cKsbg0ztrmFV4qvMTL6CF7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N4FUiXYt
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.1.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Dec 2022 10:54:35 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> fix CVE-2021-33621: HTTP response splitting in CGI
> 
> see https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch | 2 +-
>  package/ruby/ruby.hash                              | 4 ++--
>  package/ruby/ruby.mk                                | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
