Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D4C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 10:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1928741604;
	Sat, 12 Aug 2023 10:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1928741604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkQtJqgxgC0u; Sat, 12 Aug 2023 10:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F24D40963;
	Sat, 12 Aug 2023 10:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F24D40963
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0385A1BF288
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E8881DFF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E8881DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eM9DfekukeZ2 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 10:43:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81C97818AC
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 10:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C97818AC
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8C4D40008;
 Sat, 12 Aug 2023 10:43:57 +0000 (UTC)
Date: Sat, 12 Aug 2023 12:43:56 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812124356.6dd3e574@windsurf>
In-Reply-To: <ZNdBDn3B5k1Xgl4S@waldemar-brodkorb.de>
References: <ZNdBDn3B5k1Xgl4S@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691837038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc0S9IuoK1qYNE7pD7qVzmJDFpUqCLdEnTmFuSGDJig=;
 b=JsYfmVzyTOEAkLeD1YuBoAs5/kziYaFvDsZ8qW4oOqrZm8IrBHSVDUwxOjKidHGAigSxJj
 Lww90WYfZ4o14Hi6ax7GUBY69THrO3YXVnygO0M5QjSaFfutoqSUoyFI7PkseZlbqKdV5H
 9gnd2kOHIRzaVKRrkKdYlF8+BB3d+uplw46cyUfQF+IbQ4njnZWNjcKALgvqmzya/2/SzV
 O7WtDG0xdd1SiNYljdi6cmbWSMnZCLS6+ITxL7n8FpmoPs62KhlY+C1lVwP1vzJH6X/hkJ
 ExXdg/YeIx0l6p6j33e/ZlTWf9oFOi2nALA7Oeyr0O67uC2u2hpmlC81BZ/ePg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JsYfmVzy
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sat, 12 Aug 2023 10:21:34 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Header file uses ssize_t so sys/types.h must be included.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/439/439538b23776a58ff81c38754a19ee92c3590a1f
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Author was informed via email about the issue.
> ---
>  package/libedit/0002-add-sys-types_h.patch | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 package/libedit/0002-add-sys-types_h.patch

I have applied to master, but after significantly improving the commit
log. For all the "fixes" that you send, there is almost always a
critical information that is missing: since when is the problem
occurring. Indeed, we want to know if the fix needs to be backported to
one of our stable branches or not.

So here, I had to do that research myself, to realize it's the version
bump in commit cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423 that introduced
the regression. Since this commit is no yet in any release (other than
2023.08-rc1), there is no need to backport your fix to a previous
stable Buildroot branch. This is really a critical piece of information
that Peter Korsgaard will need when reviewing patches for backport to
stable branches.

So could you please always, always, always to this research and include
the relevant information in the commit log? It will make things a lot
easier when reviewing/merging the patches.

The final commit log looks like this:

commit fe42fa8017b10602ed57ee066f8a9710f0f8e7ca (HEAD -> master, official/master)
Author: Waldemar Brodkorb <wbx@openadk.org>
Date:   Sat Aug 12 10:21:34 2023 +0200

    package/libedit: fix compile error with uClibc
    
    In Buildroot commit cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423
    ("package/libedit: bump version to 20221030-3.1"), the version of
    libedit was bumped from 20210910-3.1 to 20221030-3.1. This broke the
    build with uClibc:
    
    ./sys.h:96:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
    
    Header file uses ssize_t so sys/types.h must be included.
    
    This commit adds a patch that fixes this issue.
    
    Fixes:
    
      http://autobuild.buildroot.net/results/439538b23776a58ff81c38754a19ee92c3590a1f
    
    Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
