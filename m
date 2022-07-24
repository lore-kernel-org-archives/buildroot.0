Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83864C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE50D40BBB;
	Sun, 24 Jul 2022 12:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE50D40BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSP7x5bBEQUe; Sun, 24 Jul 2022 12:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D225B40186;
	Sun, 24 Jul 2022 12:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D225B40186
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3A41BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49E940186
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D49E940186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCC-wQHNYPku for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:13:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C6E940025
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C6E940025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:13:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32B8C200003;
 Sun, 24 Jul 2022 12:13:57 +0000 (UTC)
Date: Sun, 24 Jul 2022 14:13:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220724141356.10982eac@windsurf>
In-Reply-To: <20220415164947.13025-1-fontaine.fabrice@gmail.com>
References: <20220415164947.13025-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658664837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5QCWpB1NwtFn5fLguDKhT+6jgGp8XEWlV3NulCfnWY=;
 b=oKUzZfuuGguLyUIl73pHkEqEN7yiZ90zYUka/JZD2njqvUDAx8t8tQX5VbeK1Jn82zEDLi
 oCmrP5hcQZsDH2G2p2ChaQRpGi2XULpNZj4KfoOgXqwpSOpXRrQFcnY9NdJ0TR7kzJDcro
 RJQqWkkc0ArksnQ3B+5/dGYcfbHWe7UEeUtO9QqYsy2GWjOIbyiHHFw1KLHhZ0f4irS07j
 IFmIMGCh/Sm7Fpr/vcIbCZjeXT8YZm6cxaU21bQGqQ1e/rDNWeao4+2GytaFfNAfJlm0rJ
 Xhg2NYP6+5WfPKsNOAVCW4BH+6a6TDrKE7/4V2efFCyIxLpXcvDuALrHwngcig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oKUzZfuu
Subject: Re: [Buildroot] [PATCH] package/gnu-efi: fix build on mips64el
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

Hello Fabrice,

On Fri, 15 Apr 2022 18:49:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop -Werror to fix the following build failure on mips64el raised since
> commit 11b347c03ab0b38389ec11b48f63236a3b4d6547:
> 
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c: In function 'FileDevicePath':
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efilink.h:145:46: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   145 | #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
>       |                                              ^
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efidevp.h:404:38: note: in expansion of macro 'EFI_FIELD_OFFSET'
>   404 | #define SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)
>       |                                      ^~~~~~~~~~~~~~~~
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c:250:41: note: in expansion of macro 'SIZE_OF_FILEPATH_DEVICE_PATH'
>   250 |     FilePath = AllocateZeroPool (Size + SIZE_OF_FILEPATH_DEVICE_PATH + sizeof(EFI_DEVICE_PATH));
>       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d19e57004c36f2904c5eea988e0c38fbdb557c7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Make.defaults-drop-Werror.patch      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/gnu-efi/0002-Make.defaults-drop-Werror.patch

For some reason, this issue no longer appeared recently in the
autobuilders. There was another issue, which got fixed by the bump to
3.0.14, and gnu-efi no longer appears in the autobuilder failures.

So I've marked this patch as Superseded, we can revisit later if it
turns out to still be needed.

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
