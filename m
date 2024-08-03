Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D72C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 11:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB40404DF;
	Sat,  3 Aug 2024 11:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc9aCgXDL4Xt; Sat,  3 Aug 2024 11:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFEC404E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFEC404E2;
	Sat,  3 Aug 2024 11:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACAF1BF37C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 11:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3845040198
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 11:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIbA3SfEvOE5 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 11:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CF2740118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF2740118
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CF2740118
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 11:05:45 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E6DBA35364DE; Sat,  3 Aug 2024 13:05:42 +0200 (CEST)
Date: Sat, 3 Aug 2024 13:05:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zq4PBulXFJ0Bcq9H@waldemar-brodkorb.de>
References: <Zq3NCVPhjeIDwGnW@waldemar-brodkorb.de>
 <20240803115210.55905c7e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240803115210.55905c7e@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722683142; bh=hix+Usk7o7KkUGiDJzTFk9jhEW8cBtThBDgPpKcaE3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oj4v7dBpfjSl3bSku38+cu9tcKxmWQgN3qxt0rZrYiBJIEwWgw/G9DBN8BScRw7XA
 8CLki90Z2ZG6hZJBg8AQBJDKwh5J/OmYnWwOzt/ZY45F5pvGD0+h+6rwHxDEGwxZ6R
 EaJDniT1jO92oW5EHCWNb+4SMVbdw1gLPogAY2gxyH5gM5V3tXjDBQzonvWznffuj7
 NbrL3SOBdZgdmzXPfPz1fI7+Ed0pzYeqc+gOCv4LZ3bGC7MRMsebf+GMLqSaSn0/2Z
 8Nd2qjIk+qLCzejt7gMXaojo3JnIPGAEMFtNMnqonnuiENXlYYIgrzN+M9uqm1P21o
 iuYSoDhSCqe0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Oj4v7dBp
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix missing m_tim issue
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
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Sat, 3 Aug 2024 08:24:09 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Patch from upstream to fix missing m_tim issue.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ++++++++++++++++++
> >  1 file changed, 205 insertions(+)
> >  create mode 100644 package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
> 
> I believe this potentially fixes some autobuilder build issues. Do you
> have some references to those build failures, perhaps?

I actually do not remember the build failure.
Was it tipidee?

@J.: What was the autobuild failures you were getting w/o the patch?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
