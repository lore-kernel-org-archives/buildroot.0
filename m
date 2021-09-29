Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97EB613A6
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A97EB613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79AFD82862;
	Wed, 29 Sep 2021 08:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaL5NkR21ZtM; Wed, 29 Sep 2021 08:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D275C82681;
	Wed, 29 Sep 2021 08:25:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 620811BF23F
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 510564039E
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64Fru2u6UijX for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 08:25:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA5EB400B5
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 08:25:11 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyKYE-1mk23C3XYq-00ygit; Wed, 29 Sep 2021 10:25:06 +0200
To: Markus Mayer <mmayer@broadcom.com>, Arnout Vandecappelle
 <arnout@mind.be>, Petr Vorel <petr.vorel@gmail.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <a3acad98-edb0-1ac7-8d84-a3937a405646@green-communications.fr>
Date: Wed, 29 Sep 2021 10:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928195533.1736944-1-mmayer@broadcom.com>
Content-Language: en-US
X-Provags-ID: V03:K1:ggDoao8RSSYuULCrLp4Pt22TsDpLJvMd7/td15Kj1KDS4WMSjaC
 SKbPE5I4jw8vw4Q6uMmHSldlnHG7SdyEVNNlEmN9enXutJ/89TPmnL//UpBYcV+C0JUEBR/
 G65NRKVtzFJ0N0g9XIuZEab4bRd1SriE4eaoLOUGZV2nsCxt6Iqf/sz2zAempz+ARWUiyfT
 C+J4wCz/iyqQR3GBgbiyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4adwbULM6jU=:K630He0600JxEnKB8kpq0o
 vvXM9CGKKddmqxMfYCRrJ94bsqNChGhtLOKcNeMIKMBYzFxxgb/Z49rLDWJzuvD0wmQviN2oF
 BECd4tmhfWyy6qHjg8plZ1Yfje/m42K+oFeojGK4UV9qMrDKK9FzpQkBpJ+PwkIZSnC5Q1yDE
 fFRAvhsFreCV7UY+c9ENk8bArxy6713Knd/7FBwyVNNBOHMBYxTldTWei7gy8X0DLtUKs3x8Q
 5OmE0PlFXddtXCcnQVi38MyQelIj4Jp3BhUJqNwLlPdaSV9Yo0ghxuWaNk4+9P+WXj1yVJS9p
 FsRgMFCyMq1v/3JIDXyi7H837lNEbkiEXYpH4zvQNz/w0gzROZiBAlwhXym4jdthWCXefvu2n
 wz5h1kaAzUj3T75bj4l+66gMkyX+dQJ+Bz4oqZCK7qS4w0Edk6ovSoDedfb4SYY5tRWBt/uR6
 mBYTB780A+Us55HqijWnMlBNHgSNbrVLLAovD/g+1+jAb9E1DNznHrpwCq2m0dmLVQqqDhK4d
 dnPrP43048hirWpwcaPg7Dp6RpzHyhn3NeAqfrjDbgmAQVqSfZL1bD8FhjYbx8AoxhwuJZez3
 digCgDbo7scyHhmHRRoxw8cyUEFz2r87v2K0ZcFbWUX5yQpWlsSifs9p5cvWJ/3PRQvCKJYoP
 RNLQvwfI4mVt9tRagZhPhdnjPHVZxVuXkDpSdIwSxHdavlnruQ2BV5zy//kMAjQJ0GVxXxmAY
 fj1pUEOsvmpT3p3uJB/6sd7p0SZVE6upjw3w7ZRQOpsxcco3MoJBpHj2z46TBRo/XnJpaQKAM
 NqSjlnc
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/09/2021 21:55, Markus Mayer via buildroot wrote:
> Please note that "command -v" in bash does*NOT*  do this! Bash's
> "command -v" seems to behave just like "which" used to. Yikes!
> 
> bash$ command -v $HOSTCC_NOCCACHE
> /local/users/mmayer/buildroot/output/arm64/host/bin/ccache
> /usr/bin/gcc
> 
> bash$ `command -v $HOSTCC_NOCCACHE` -v 2>&1 | grep 'gcc version'
> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)
> 
> I can't stress this enough. "command -v" behaves differently for bash
> and dash! This does not give me the warm and fuzzies.

POSIX 2008 is very clear on this: additional parameters to command -v 
must be ignored, so bash is non-conformant.

Additionally, the dependencies.sh script should probably quote the shell 
variables that it uses. This would have caught the problem much earlier.
Unless HOSTCC is allowed to contain multiple parameters, but i'm not 
sure if buildroot maintainers consider this to be allowed.

> As such, relying on "command -v" seems a little risky in that it opens
> up the possibility for strange build errors that others cannot reproduce
> and that nobody would ever think to investigate as being related to the
> "command -v" implementation of a specific shell.
 >
> There is also the issue of some developers working with different
> distributions. Somebody developing a feature on distro 1 might create
> build problems for others using distro 2 and vice versa. Neither would
> have a way of knowing ahead of time that there will be an issue.

This is why there are standards and why respecting them is important, 
otherwise it would be impossible to get anything done.

command -v is defined since 2008 and any shell that misbehave has a bug 
that need to be fixed. Of course there can be workaround here and here. 
For example, there are 'command -v CMD || type -p CMD' patterns in the 
main Makefile already.

Meanwhile, 'which' is not standard, and right now, it misbehaves on 
Debian by filling the screen with warnings.

> I am wondering if it might be prudent to provide a host-which package,
> such that Buildroot can build its own "which" command if the system
> doesn't have one and stick to using "which" despite it being deprecated.
> At least for the time being and until "command -v" can be explored and
> evaluated a bit more.

This is a chicken-and-egg problem. How do you compile host-which without 
being able to test if gcc or make are available ?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
