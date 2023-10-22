Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14102CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 16:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 812B34F5ED;
	Sun, 22 Oct 2023 16:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812B34F5ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bg_YmX3wAigA; Sun, 22 Oct 2023 16:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9461F4F5EA;
	Sun, 22 Oct 2023 16:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9461F4F5EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 061541BF385
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D363370ADC
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 16:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D363370ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id um2IfZ8GOSzI for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 16:37:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC32E70ADB
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 16:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC32E70ADB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BE122B0057C;
 Sun, 22 Oct 2023 18:36:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 18:36:59 +0200
Date: Sun, 22 Oct 2023 18:36:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231022163659.GQ2607@scaer>
References: <20231022154133.1619344-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231022154133.1619344-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697992628;
 bh=57gLw17PnsENe5xUp0kv4hmz8zhKtxfKOQGntjggd2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzDhvgy9hwhBSn8Yxbsl0gN0v8upcNacWQ9m6RJ6efTD6fArlcQjSoTx1n/FoVAM/
 EKryjvDiaxjNJXE4Xlns/AjyjJwIoq/e1b0Qm2dkrScbUtmiJXiu4Zv4qBDjzg4cbg
 nio+p+srRIFJit5juKg3ALVsjwOdpoS6/eWqj/DNeg2HecxyAAmicax+Pj+XEGEUKY
 DZoi6/RGeiW2OGdsdTWtA51iWj0o71sPoS1pAY7p+bYvgr10CdOYl/PDbtUSO1gjVx
 3r0BdejIiCSq47mGptH+w9YnJMvpZVc63Mer8hv35zPIbbC7H31Hm0qT8lo6xeCRNR
 V0rtv5Ll4K1ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CzDhvgy9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/elfutils: enable on musl
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

A little addition to the review, not directly related to your patch, see
below...

+Fabrice for commit 99ce85cdb80

On 2023-10-22 17:41 +0200, Bernd Kuhls spake thusly:
> Buildroot commit eb60820c0a9b3f938f32516f24df2eee9aac1e26 disabled
> elfutils for musl toolchains in 2015. Current code builds fine with musl
> so remove the exceptions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[--SNIP--]
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 0757851b72..28fcb52eb3 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk

As I said in my review, we had a !glibc-related condiitional block; with
this change, it now looks like that:

   52 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
   53 ELFUTILS_DEPENDENCIES += musl-fts argp-standalone
   54 ELFUTILS_LDFLAGS += -lfts
   55 endif

This means we link with fts for all of elfutils.

I was a bit surprised to see the explicit -lfts, but nothing for
argp-sa, and sure the build succeeded anyway.

However, from what I could see, libelf itself does not use fts, as it
does not use fts_open() or other fts-related symbols. So, libelf is
linked to libfts, and this is superfluous.

libdw does use it, though.

So I tried dropping the explicit -lfts from LDFLAGS, libdw is still
properly linked to fts, though (tested both with a uclibc and a musl
toolchain):

    $ readelf -a per-package/elfutils/target/usr/lib/libdw.so |grep fts
     0x00000001 (NEEDED)                     Shared library: [libfts.so.0]
    0007b94c  00003516 R_ARM_JUMP_SLOT   00000000   fts_close
    0007ba7c  00007916 R_ARM_JUMP_SLOT   00000000   fts_set
    0007baec  00009316 R_ARM_JUMP_SLOT   00000000   fts_read
    0007bb4c  0000a916 R_ARM_JUMP_SLOT   00000000   fts_open
        53: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_close
       121: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_set
       147: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_read
       169: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_open
      3629: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_close
      3812: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_set
      3868: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_read
      3929: 00000000     0 FUNC    GLOBAL DEFAULT  UND fts_open

Fabrice, in commit 99ce85cdb80, you added the explicit -lfts. Do you
remember the details (except for the autobuild failure)?

Bernd, could you check if upstream has changed something around the
handling of fts?

It would be nice if we could drop the explicit -lfts if it is no longer
needed.

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
