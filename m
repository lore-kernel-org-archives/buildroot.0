Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E8DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0721F41F2C;
	Tue,  6 Feb 2024 14:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0721F41F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TY5Hi6gsRcNN; Tue,  6 Feb 2024 14:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3916F41F2D;
	Tue,  6 Feb 2024 14:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3916F41F2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C73E71BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C07BB81A16
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqs3X2Bp9iq2 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4700818A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4700818A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4700818A2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:53:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A83413FA36;
 Tue,  6 Feb 2024 15:53:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 15:53:14 +0100
Date: Tue, 6 Feb 2024 15:53:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcJH2rjRQQwKTbyN@landeda>
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
 <1dd4afa6-e225-4e79-bb3a-21d0e04c7571@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dd4afa6-e225-4e79-bb3a-21d0e04c7571@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707231196;
 bh=cZ0MaQn/s0UKRFDDra389YkO8zbUiIO2eB5f6vOCmAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GynpY5o4ctPb6gR8TENSuv3fK4/iislS7YTbQZKDdleU6tgMxDnCrihNSPP5LuciN
 44hEh40H0wJEoHzh1juhq1m66N2fxHCTRqwHLkGmYm2Yu2/clT9gHx6dhkE5NRPEIn
 KX3MOyrRy/QZYc8Ka8iT7Z4737rJpVhxb0r607OTHr3jDeCbnEhqJokk9QqMYJy+Cm
 8ekHuskhQMFGW5KaV7VH8G1M/YS+pqAmBUuO32TNH261TQFhMIPoFgbIgHbfiothBH
 3PTzc6JJ3ivYPgBLxH7zOnvTo0GAbq0l1X4Bjt7+R4YMwOmTRa2HOt+M58NHIM3rZa
 A0iwNWrqEqASw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GynpY5o4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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

Antoine, All,

On 2024-02-06 15:09 +0100, Antoine Coutant spake thusly:
> On 11/01/2024 06:17, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> > -PYTHON_RPDS_PY_VERSION = 0.12.0
> > +PYTHON_RPDS_PY_VERSION = 0.16.2
> rpds depends on the crate pyo3. This crate uses
> "std::sync::atomic::AtomicI64" which doesn't exist for 32 bits
> targets. That leads to an error [1].

I have been discussing this with Romain IRL, and he explained that the
issue _already_ happenned with 0.12.0, so this is not a regression and
thus reverting this patch will not fix the issue.

Is that correct?

Also, will std::sync::atomic::AtomicI64 ever be available for 32-bit
targets? If not, would that be considered a bug in the std lib?

> An issue have been opened on pyo3's github [2]. A fix have been accepted [3]
> but it isn't in the last release. Thus, this version bump doesn't
> fix this problem.
> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842
> [2]: https://github.com/PyO3/pyo3/issues/3614
> [3]: https://github.com/PyO3/pyo3/pull/3619

It is not going to be easy to carry this change as a patch in Buildroot:
it would require that we be able to patch a package during the vendoring
step.

In this case, we'd need to do the vendoring (because we need the pyo3
crate to be downloaded), then apply the patch (with mangled paths) to
add the new dependency, then restart the vendoring. In the generic case,
we'd even need to be able to repeat the process in case that new
dependency has to be patched and so on and so on... That's not going to
be easy, by far...

Meh...

We can't even update to a random sha1 from the rpds git tree, because
they do nit even have an update to switch to a newer (even if
unreleased) pyo3.

Meh, again...

Not sure what to do...

What about adding a dependency on BR2_ARCH_IS_64 to python-rpds-pym and
propagate that to all its dependencies?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
