Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D71BC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 11:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEBF40316;
	Sat, 12 Aug 2023 11:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEBF40316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvsbymqPg9bY; Sat, 12 Aug 2023 11:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D8F4034F;
	Sat, 12 Aug 2023 11:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D8F4034F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651EA1BF282
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C254031B
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C254031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9OmuxJN3bAR for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 11:18:08 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E74E6402BA
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 11:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74E6402BA
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 49A533520C44; Sat, 12 Aug 2023 13:18:05 +0200 (CEST)
Date: Sat, 12 Aug 2023 13:18:05 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZNdqbZF3dTPmZbr3@waldemar-brodkorb.de>
References: <ZNdBDn3B5k1Xgl4S@waldemar-brodkorb.de>
 <20230812124356.6dd3e574@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812124356.6dd3e574@windsurf>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691839085; bh=EDfuRF3YMbU+5xzbZUO45WZnuSnAYHKV+lkQcsTsP0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAomD52Dt57OLxVB92+bBX+Mt0KKQrHrUjcUW8msVhfR5IURCgBL/dd9Hr+FW8+f9
 7T/HCAN5c5T1MMV256tXNXcgbOOq7GJRBc5dInUh+oqZ8cdRTS2oXI9tfjKjdWmmyc
 hf7/rCiit9eY1BhAKF0tqqbqR5/5AVxvpA9E2Br/W+b3I37f3FpV5a59qykU3GX7bp
 o74rpjQIloe/VVouqwybrpCNvb3vo0xd0L+GRVmQbcpOlVL82yaIx6/0YEkm9WJuSs
 S9rSSjQWhUPqmFfFFN3XNSV4DQTKA6/mWFZjjEzs88RUZQ4rUJiRmHPhW+1or36WqK
 a6C36tU2gzCuw==
Subject: Re: [Buildroot] [PATCH] package/libedit: fix compile error
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

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Sat, 12 Aug 2023 10:21:34 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Header file uses ssize_t so sys/types.h must be included.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.net/results/439/439538b23776a58ff81c38754a19ee92c3590a1f
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> > Author was informed via email about the issue.
> > ---
> >  package/libedit/0002-add-sys-types_h.patch | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 package/libedit/0002-add-sys-types_h.patch
> 
> I have applied to master, but after significantly improving the commit
> log. For all the "fixes" that you send, there is almost always a
> critical information that is missing: since when is the problem
> occurring. Indeed, we want to know if the fix needs to be backported to
> one of our stable branches or not.
> 
> So here, I had to do that research myself, to realize it's the version
> bump in commit cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423 that introduced
> the regression. Since this commit is no yet in any release (other than
> 2023.08-rc1), there is no need to backport your fix to a previous
> stable Buildroot branch. This is really a critical piece of information
> that Peter Korsgaard will need when reviewing patches for backport to
> stable branches.
> 
> So could you please always, always, always to this research and include
> the relevant information in the commit log? It will make things a lot
> easier when reviewing/merging the patches.
> 
> The final commit log looks like this:
> 
> commit fe42fa8017b10602ed57ee066f8a9710f0f8e7ca (HEAD -> master, official/master)
> Author: Waldemar Brodkorb <wbx@openadk.org>
> Date:   Sat Aug 12 10:21:34 2023 +0200
> 
>     package/libedit: fix compile error with uClibc
>     
>     In Buildroot commit cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423
>     ("package/libedit: bump version to 20221030-3.1"), the version of
>     libedit was bumped from 20210910-3.1 to 20221030-3.1. This broke the
>     build with uClibc:
>     
>     ./sys.h:96:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
>     
>     Header file uses ssize_t so sys/types.h must be included.
>     
>     This commit adds a patch that fixes this issue.
>     
>     Fixes:
>     
>       http://autobuild.buildroot.net/results/439538b23776a58ff81c38754a19ee92c3590a1f
>     
>     Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Thanks!

Okay, sorry for that. I promise I try to find the needed information
for my next patches. See my conmon patch I sent today ;)

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
