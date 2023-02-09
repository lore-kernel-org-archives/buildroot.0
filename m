Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9A2C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA1F60E84;
	Thu,  9 Feb 2023 19:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA1F60E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWX9zFuhv_Uy; Thu,  9 Feb 2023 19:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E265C60F41;
	Thu,  9 Feb 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E265C60F41
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60EA71BF359
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 19:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9614103E
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 19:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9614103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpHcwJUcl3gO for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 19:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673164102E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 673164102E
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 19:36:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 3C8DEB00548;
 Thu,  9 Feb 2023 20:36:07 +0100 (CET)
Received: from 37-174-10-254.coucou-networks.fr ([37.174.10.254])
 by webmail.free.fr
MIME-Version: 1.0
Date: Thu, 09 Feb 2023 20:36:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
Message-ID: <4acd3e35f6bce28f5f2e6cca8e57789c@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675971367;
 bh=/gsV9YWPfOeZLD+KbdMMsF122lcMaBhC+r953WN8OS0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GaN3sig3vWDlBjYCE0+mJIZ29sPwKlxgzWVknByHnhC5njzTCJ1pHG6Eh3hbzuNZi
 9oOhPpIz2vpV2v6RJYmfT0fBARnJpnk8vatS7804v+/IsSNcXo/YCoIBZNVyMElSzT
 JovYO4MOgn4LhcVLuimL34PymAC2DFlB5FqmOI9EL4iwdUEvYs9/EC8t9aUiKdlmQJ
 KyvgNt8csZn0HQ1SYq6t6PY6kAk6Ra5E/gctx1CRCRTH5qgSDJ3pOu7M58h4fB/q+k
 m/+Rv6lVbTVhVC+lf0OQTFyOnL8+T782gJvFUz2OuJcsb1vWpPPIgNXVVcoUJwTAdk
 ZkSQqs/Gej+cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GaN3sig3
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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


   Hi Giulio,

On 09/02/2023 01:48, Giulio Benetti wrote:
> Package quickjs fails to build on architectures that don't support full
> float rounding. To support all kind of float rounding FE_DOWNWARD,
> FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD must be defined in fenv.h.
> Since package z3 locally implements this check let's make it global,
> rename it to be generic and use it for both package quickjs and z3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b6/0b67381e3643c134c92cbcd1c5dc258fd760cd7e/
> http://autobuild.buildroot.net/results/cf2/cf249a82c83d3c8503205f4c3c5859dd9d52afdf/
> http://autobuild.buildroot.net/results/9b3/9b37c6c55a5b468657af26ef9b57d4fe24d8fde2/
> http://autobuild.buildroot.net/results/4f1/4f13cf7d353260c6b8934dbdcf267bea884b356b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

To comment a bit on that, the complete condition is a bit more tricky:
- the CPU arch FPU HW must have all 4 rounding modes,
- the libc must expose a fenv.h header,
- the libc must also expose all 4 rouding modes.

glibc generally exposes all the HW supported rounding modes.  I
initially excluded uclibc-ng, because in its Buildroot default
configuration, fenv.h is not enabled [1]. I believe it's possible to
have some uclibc-ng configuration that are enable and exposing those
rounding modes. See [2].

So this proposal is correct but possibly discard the case in which libc 
is
uclibc-ng and its (custom) configuration exposes all FE rounding modes.

I am not sure if it's really an issue, as packages with such
requirements are mostly tested with glibc anyway...

Best regards,

Julien.

[1] 
https://git.busybox.net/buildroot/tree/package/uclibc/uClibc-ng.config
[2] 
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/extra/Configs/Config.in.arch?h=v1.0.42#n180
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
