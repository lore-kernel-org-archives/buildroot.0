Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D907CC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59689812DC;
	Sat, 30 Dec 2023 19:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59689812DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxfyWxw-jm5B; Sat, 30 Dec 2023 19:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 943BF812E0;
	Sat, 30 Dec 2023 19:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943BF812E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C082A1BF4E3
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A661D40321
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A661D40321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKuXa50ep14l for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 19:44:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCBBF4030C
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBBF4030C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49302B00573;
 Sat, 30 Dec 2023 20:44:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Dec 2023 20:44:33 +0100
Date: Sat, 30 Dec 2023 20:44:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZBzIdHGdJufQNWn@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda> <20231230190019.434e1b4b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231230190019.434e1b4b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703965479;
 bh=m0VYOt+hRv91NmTvVdHJjXdfYoroiLn6afdSKqjjf+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VU+pLsQKvAmO7FN9PX5/JvG9tdfoLcUOCWFmF0keXODEnJzgXADfg7YdglA+qJLHM
 yai5o+igM1pfIlN8lRqktzp3g+Zoh06GgbX2s3Sw7lOQucwkvX2AZ3zOQ+6/pyW+hb
 8M/St08kzadjPHaL/2vzqYg8INGSegru8PeUtDxmfrhdCUqrQfDQ8p55fG0Tg3Nak8
 nb5LZFaxvh5vV3HbdbtBOZbdOUQW9SOVE1H98ncCD8QMEkkU442zYDyCT4xdx1ZPnW
 CE8zBe+eztXyV6G+xFtgMVEFqisfCHNJEaFJjeGSD+vUPRoR/nIGj+McXgoPaxyz8V
 lOElMerZNp9qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VU+pLsQK
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-30 19:00 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 29 Dec 2023 23:13:35 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > If that's so, then we have a big problem: the hashes for all the
> > cargo-based packages will change, and thus it means we will have to
> > name the generated archive based on the cargo version used to do the
> > vendoring. That would apply to:
> Note that I also encountered some hash mismatch on some Rust/Cargo
> package recently, and BR was falling back to sources.buildroot.net. I
> did not have the time to investigate at the time (I was looking into
> another issue, and didn't want to enter an infinite recursion of
> problem solving quest). And now, I don't remember with which package I
> encountered this. But yes, it seems like we have a reproducibility
> issue.

So, I tested with commit b7938d2, i.e. before the rust version bump, and
ripgrep already has a hash issue:

    ERROR: ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz has wrong sha256 hash:
    ERROR: expected: 6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8
    ERROR: got     : 9d9769e45ffe6089f58bc19fa39dd6b6299aa0c3ad90508d21dfa27a3d3416d5

In 2023-01-01, it was already failing but the reported hash was
different:

http://autobuild.buildroot.org/results/43d/43d9b993a019c9c46701924f664476c2ac900b2b/build-end.log

    ERROR: got     : ed72a5ad6592c2c605ed9712e896872fd3858b94895601dbbb9f7d2a94b105af

Then on 2023-06-25, a vendoring suceeded (the last ripgrep build failure
reported in autobuilder):

http://autobuild.buildroot.org/results/15b/15bea8d3bc8765ec9088c5bc380d482caee1b6d5/build-end.log

Then, I had hash issues with host-sentry-cli, too:

    ERROR: sentry-cli-2.20.3.tar.gz has wrong sha256 hash:
    ERROR: expected: 2188b8eead4f2b6543725b23852427bea164e8dd76bf1ce33f41ca0c03cfeee7
    ERROR: got     : 4db94489e7c427ff092483529eee56229fa764b619669f9f9e6e663cc4a05abc

The other cargo-vendored packages were all OK.

Then, with the rust version bump to 1.74.1, the vendoring status is
unchanged:

  - ripgrep fails vendoring, and reports the same hash failure
  - host-sentry-cli fails vendoring, again with the same reported hash
    failure
  - all other cargo-vendored packages are fine and don't need a hash
    bump because of th rust bump.

So, we need to understand why we have two cargo-vendored packages that
are not reproducible...

More investigations later on...

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
