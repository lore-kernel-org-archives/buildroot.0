Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDF8C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 07:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 531FB400B5;
	Thu, 15 Aug 2024 07:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWPCwsNmhjZC; Thu, 15 Aug 2024 07:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0650B40375
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0650B40375;
	Thu, 15 Aug 2024 07:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDCBB1BF5A9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C82E8402C4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs_nc9JCPASw for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 07:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D6D3402A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6D3402A9
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D6D3402A9
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 07:23:01 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 915D63535C10; Thu, 15 Aug 2024 09:22:59 +0200 (CEST)
Date: Thu, 15 Aug 2024 09:22:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zr2s0yK7LbaHn+Uq@waldemar-brodkorb.de>
References: <Zrz+JUwTsNaKI8sK@waldemar-brodkorb.de>
 <20240814221950.458101ad@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814221950.458101ad@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723706579; bh=ckHpmnbpEcSwJzkI4n3dR1ge8RdVfumhmNqtFNPuh2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dW/nBcActXDMfGqyzab32RhpRK9GjHGc3pwoBKLrYpTpLWl4Tav0QN0kt0/UkEXrJ
 Ers5gN8yDu4ZncHnVeiC+7RPhZL6e2Z3Fh40cXMpUtFHGcebOQCeqYKtMFVDsRHQib
 yJYNbli5KVNBxesiLwsqh6uPh7T9oNzEXJQ9YI5bpP+z3Eut6vyfSrSrSYhX/H/KGs
 LzFS4Dw1wY34gnRH6x6n1wu4QinN9t9fX4BXEdcgMynOgHSJh6bzL/bz6ODIPzZogd
 F5+ZsejW9lNy2jnN73k3TfQgnZ3DtyzFnVmzTlH0Za3FSoGiJQHwA4Rj346NHfkHLs
 oM4DNT+TZDHug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=dW/nBcAc
Subject: Re: [Buildroot] [PATCH] package/iproute2: fix musl compile errors
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
> I've applied to master, but I have a couple of nitpicks, and one real
> request.
> 
> On Wed, 14 Aug 2024 20:57:41 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Add two patches to fix musl compile errors.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.net/results/8d7/8d713bd911f8d6b97272a7bb5dc2c188aeb99b05
>                                             ^^^^ you can drop this part of the URL
> 
> Also, there should be an empty line *before* the Signed-off-by line.
> 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  ...laration-of-function-htobe64-in-gcc-.patch | 43 +++++++++++++++++++
> >  ...laration-of-function-basename-in-gcc.patch | 30 +++++++++++++
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
> >  create mode 100644 package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
> > +From Alpine Linux.
> > +
> > +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > +Upstream: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
> 
> This really isn't an "Upstream:" URL, it's really a "downstream" thing.
> Indeed, what we want to see is patches submitted to the upstream
> project, so that at some point in the future, we can drop them from
> Buildroot.
> 
> So could you submit this patch to the upstream iproute2 project, and
> then updated the link in this patch?
> 
> "man 3 basename" says <libgen.h> should be included for get the
> prototype for basename(), so it shouldn't be too difficult to convince
> upstream that it's the right thing to do, and not just a musl-related
> fix.
> 
> Thanks a lot!

It seems the Gentoo People already reported it upstream:
https://marc.info/?l=linux-netdev&w=2&r=1&s=musl&q=b

Would you like to update to this link or wait until the commits are
upstream in git?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
