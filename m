Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E29EB3625
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FA441C9F;
	Mon,  2 Mar 2026 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C30P8ze4W-E; Mon,  2 Mar 2026 17:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9348841D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772472209;
	bh=VafTy6LwZigDi2AA9Dbjzi212zC/m83F/k9FuVbkMeg=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wwn1y611VsU3JmjkZu+Ia82l9u2Dd2+8RmXqw0QG9Qq7jMbpSMrm/QglrnuvrdzhU
	 QPha+XvBr7isEV9BrNKz0KBfi0xy6UPyIi7QigA/FjNIm2EGzUeSlI/iD1lp70jLuo
	 2a7AyG+ts4jxPj4JzPh929LcWz3iHaPb0BSfp/jFUtpicMawW/zr7FsNNkJVRcjW0J
	 5SgyYtnw+WbZyJUqtLLvqNAhx1+eyOpB+C2B1usJ2JjzBSi9iuDjIGWTY5ca/8mQJI
	 f1UCh6u/e20DmLSvo8GZVTuOxJtb+5o9RsQE7gxHl+Szk38gnDEpD8rK3K8BmU6Yb3
	 vcTH8DPnygjxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9348841D10;
	Mon,  2 Mar 2026 17:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A4A231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 17:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A3941D10
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 17:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6MPld8yF3Ry for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 17:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A184F41C9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A184F41C9F
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A184F41C9F
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 17:23:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DABC631E0CAF; Mon, 02 Mar 2026 18:23:23 +0100 (CET)
Date: Mon, 2 Mar 2026 18:23:23 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <aaXHi1j_b4fRSI-V@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
 <294c54a635aa57d40cda161b8af98f8f@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <294c54a635aa57d40cda161b8af98f8f@free.fr>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1772472204; bh=P7iOPtgM6KB0PLGWVt/PKmaynY6OA07Ndx0t2+1eBiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ld8PPSx/SOsu7XE2gX11c5/RfR6/w4cIJJ/PR9Jr9yeIKJfg2bub7NQ/74CVCM7gd
 Z9dKnmEvSbUEG/HF4tDotEMOnow5hRSydFVkueHN1HqFXHvXVQAECdqjoSJ9qHEzgl
 HfZ8pbIXFxf01HbxoKsIaGhn26Gka1cPYFHWEZ7khMSWwvTTvk+bSwE/x9nGaWnrtc
 qCqPuioDONDlNivk140nQFM4ik88hFCQzFnSgmWL1U305Hdm3oT8RUb5mU1pzveiYq
 xiUWEmYTaPk/JLf6VE1ylf4ciI9H3tVsSur9iVgLGUjNH4OnxJJfNW2dQSc1QgOqkr
 KxWdZ8vXIW8nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Julien,
Julien Olivain wrote,

> Hi Waldemar,
> 
> Thanks for the patch.
> 
> On 01/03/2026 13:42, Waldemar Brodkorb wrote:
> > Following changes made it into the release:
> > 
> > Joris van Rantwijk (1):
> >       Fix adjtimex() with TIME64
> > 
> > Waldemar Brodkorb (8):
> >       sys/stat.h: remove _STAT_VER/_MKNOD_VER
> >       fix gettid() declaration
> >       add statx syscall wrapper
> 
> This new uclibc version is introducing a test failure
> with zfs. See:
> https://gitlab.com/jolivain/buildroot/-/jobs/13308829775
> 
> Running with the previous uclibc 1.0.56 works fine:
> https://gitlab.com/jolivain/buildroot/-/jobs/13308875027
> 
> It seems related to commit:
> https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
> 
> Do you have any idea which component should be fixed?
> (uclibc, zfs, or the rutime test_xzf?)

It is uclibc-ng fault. A fix and a patch v2 will follow.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
