Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57363EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F60819F3;
	Mon,  7 Aug 2023 08:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F60819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4SJBXi0188N; Mon,  7 Aug 2023 08:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4E880B2F;
	Mon,  7 Aug 2023 08:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4E880B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2328F1BF860
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A33AA6080B
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A33AA6080B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5o-qu6XSCEq for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:42:44 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C36FB60AF8
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36FB60AF8
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 746AA35206AA; Mon,  7 Aug 2023 10:42:41 +0200 (CEST)
Date: Mon, 7 Aug 2023 10:42:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZNCugJjbSzNv7YPd@waldemar-brodkorb.de>
References: <ZNCiPEKIjPhDgxLN@waldemar-brodkorb.de>
 <20230807101431.40cb9d54@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807101431.40cb9d54@windsurf>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691397761; bh=jTGTDaHw5hMicODJ6Lf2rfxNiQmLcgjWNVJfdpMBTQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMiJ4TghmYJBxkygA4wequp65z7WWFzNh0XyMSDJvzIZW3NOb2jTzOmIYnwc4zKSe
 6dh3qectwEZo9Yx3BhKBIUNZOPaRxj8mWFoz4y8pA8pf8raWO88dcfxCNyuC9VAxYN
 Tv9FVrySn31DJ+jZ7/0ySALwd26V4Thdu0cCs6VJ4flCVNU3Fl5Do/1sicC7c5ypeI
 5LQDyeuPu1CW0GUoq/GdayTB+IsB+6190EB0QqGEaxqVdi9/PgDqvwnBBUfw/bZPfP
 b6seZcEp9m9XB80JyFGOIr3NcEMEi6ZCbNiP3pfNjboA+UeeC1Gw50qFSlhvkMs4iZ
 Kcy9Yk1cEftwQ==
Subject: Re: [Buildroot] [PATCH] package/elf2flt: handle more relocations
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

> Hello,
> 
> On Mon, 7 Aug 2023 09:50:20 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Fixes following autobuild failure:
> > http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  ...e-relocations-required-to-be-handled.patch | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> > 
> > diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> > new file mode 100644
> > index 0000000000..c619a1d068
> > --- /dev/null
> > +++ b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
> > @@ -0,0 +1,39 @@
> > +From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
> > +From: Waldemar Brodkorb <wbx@openadk.org>
> > +Date: Mon, 7 Aug 2023 09:30:34 +0200
> > +Subject: [PATCH 8/8] riscv64: add more relocations required to be handled
> > +
> > +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Thanks for the patch. However, it will raise at least two warnings from
> "make check-package":
> 
> (1) Because it has 8/8, but we don't want such numbering in Buildroot patches
> 
> (2) Because it lacks an Upstream: tag
> 
> Could you address those details? Especially the Upstream: tag means we
> expect this patch to have been submitted upstream.

The problem with upstreaming the patch is, that it depends on not
yet included patches for riscv64 noMMU. How should I proceed here?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
