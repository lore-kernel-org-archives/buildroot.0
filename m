Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89591C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D070813E6;
	Tue, 14 Mar 2023 07:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D070813E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDdw2N14ndAU; Tue, 14 Mar 2023 07:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D776813D2;
	Tue, 14 Mar 2023 07:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D776813D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 313451BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0375241805
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0375241805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00cf9EcUrlVs for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:53:39 +0000 (UTC)
X-Greylist: delayed 00:07:15 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25CDB41802
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25CDB41802
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:53:39 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 8A318BDE2684;
 Tue, 14 Mar 2023 08:46:19 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 14 Mar 2023 07:46:16 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: C D <dellicker@live.com>
In-Reply-To: <mailman.10087.1678750430.50374.buildroot@buildroot.org>
References: <mailman.10087.1678750430.50374.buildroot@buildroot.org>
Message-ID: <70f71def3775c5412b70ddae1b3caac0@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1678779981; bh=wcC0hqFVsTivCf8W3o4ZKyD89XdVpcFfn2p1mqXkJp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=PgAKOw3ghhGKbZhXiFp9ppKsgA08XYK8sVhXu8eck/BWZwgECxmTIeGPt9wrXBjBU
 IHXmRY522UmA+VQM9ij82Ipxl1Ehsyq7IWLTfTuNwWvz7+UolWFTCQkXHfN+ffIavN
 G/ITrVrfAuaVuSgoTwCOw0XgkfsCjYbv/7Nfy7jc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=PgAKOw3g
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Chris,

On 2023-03-13 23:33, C D <dellicker@live.com> wrote:
> 
> Good afternoon,
> 
> I'm running in to an issue with a package linking against libubsan and 
> libasan.  I've figured out how to compile Buildroot so that it copies 
> those libraries to the correct output/target/lib and 
> output/target/lib64 locations, but it seems like the package is linking 
> to the versions installed in my OS (RHEL 8.7) in /usr/lib64 instead.

Did you use BR2_TOOLCHAIN_EXTRA_LIBS? I would expect them to appear 
under /usr/lib[64] on the target.

> So, in /usr/lib64 I have libasan.so.5 and libubsan.so.1, and in 
> Buildroot's output/target/lib64 I have libasan.so.6; when I boot into 
> Buildroot and run my program, it errors out because it's looking for 
> libasan.so.5.

The libraries and pkg-config files need to be present in the toolchain 
directory, usually located under output/host/<toolchain-name>/sysroot 
(normally ./usr/lib and ./usr/lib/pkg-config).

> What do I need to do for it to point to the correct library location 
> when linking?  Is this a Buildroot config option, or something I need 
> to set up in my Makefile?

This is highly specific to (a) the build system used and (b) the 
interaction between Buildroot's and the package's make file.

Standard include paths for headers and libraries are preset in the 
toolchain binaries.

Buildroot sets the binary path, and standard environment variables 
before executing make in the package build directory.

If your Makefile uses variables that can be overridden, set them from 
the Buildroot package make file, using e.g. CONF_ENV (autotools) or 
MAKE_ENV (generic).

If the project Makefile uses pkg-config to determine include paths, you 
need a build-time dependency on host-pkgconf (and probably set 
PKG_CONFIG_PATH).

> 
> Thanks,
> Chris

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
