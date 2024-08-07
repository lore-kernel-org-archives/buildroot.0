Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3542EC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F276C405F4;
	Wed,  7 Aug 2024 09:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVInXnLT8M6Z; Wed,  7 Aug 2024 09:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6627405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6627405FA;
	Wed,  7 Aug 2024 09:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 749421BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62177405FA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXAy9FB0nbZl for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91094405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91094405F4
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91094405F4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:35:52 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2954D3521201; Wed,  7 Aug 2024 11:35:50 +0200 (CEST)
Date: Wed, 7 Aug 2024 11:35:49 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrM/9Xro3IRUA8NY@waldemar-brodkorb.de>
References: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
 <20240807112829.45e1c4cb@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240807112829.45e1c4cb@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723023350; bh=7ISCeAL7tjEvL1JfTjeC8ovHvYgsIDeWUJfVOT5XrH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RdCSKnYwzYgA1lT08QKiu35y/OrLMiU4Jr47FkZw8uZYEnA3rEoQIa5Eb8QwGObGH
 yXC/Yvtc7x4XL5ci/lrjo5i8rvj3Pu8cltYKCvgjHGmu5z5MHc+jAbmLBgtsnCr8Ev
 ZsJvKGXZJtq5rokfBY1l50VFEUHdhMEMUicgS4kGLcAmEXaGfdWi5vEkTlPz+hJES3
 z2Cpj6Gict1+15yP+hLm4fTcvDf6DY9YwJTxi3iQY7Da4GjoFCTMxWogfmLJOSmEyL
 Df8bshcMjViDmIof6dcY8FoPzkTplem1LXLVFZXeLOC4WZiw/6mvgUpwHjz1r3JPbb
 c3+DteIf2SxWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=RdCSKnYw
Subject: Re: [Buildroot] [PATCH 0/3] Upgrade to Binutils 2.43
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
> On Wed, 7 Aug 2024 06:46:03 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > This series of patches update binutils to version 2.43, doing the
> > usual dance:
> > 
> >  1. Add 2.43
> >  2. Make 2.42 the default
> >  3. Drop 2.40
> 
> Thanks for the patch series. If you don't mind, I will keep it for the
> "next" release, once we open the next branch. Indeed, we want to cut
> -rc1 soon, and I don't want to merge this this late in the release
> cycle.

Sure, feel free to add it to next.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
