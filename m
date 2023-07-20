Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2142DEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A0B60709;
	Thu, 20 Jul 2023 22:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A0B60709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq7bTDFARwbb; Thu, 20 Jul 2023 22:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE18460777;
	Thu, 20 Jul 2023 22:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE18460777
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA1B1BF859
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 22:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08A6C41E32
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 22:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A6C41E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ov9LJlKoVU2Y for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 22:07:49 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70B0141D64
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 22:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B0141D64
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id ECEE9D17EE
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:05:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF4FAFF803;
 Thu, 20 Jul 2023 21:05:31 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:05:29 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230720230529.7c0142fd@windsurf>
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YH0Z1NuAsNzvqTNSqS+fAYRPrqmyaRcASywMqsIgg1E=;
 b=SAP1HFt3kmLGf0tpjWmTpXpUHYqeaKumhP2Gej6GrqvzUftcKNYRaAujwHp9hanrsETjaK
 JasUNN//dy/DQm81qrFYcAmAQb9DyPPAFTpPgUWO3NxXSSQ6MXTe6+HYlqeVqYONyE9jvj
 XKjOrEnxPevWEVLCY4EwEyYnwrSWmDAPAeWDWIynFo78j5fYSYLCDXFZpMtQbGJDbtsNMR
 qcsD1WALVkbwHIjd8PtYrE4PrjlSg4Hzyo4w666i7oWBc1QF2rmEw7Y+mKU9B+ntBPxoTx
 jqJr18lwuQQiKntXCMDs1TQQt9hd+JYrz9hCUFnIb5fyK8BKavTCiig8k98j8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SAP1HFt3
Subject: Re: [Buildroot] [PATCH v4 00/10] group llvm projects and bump to
 version 15.0.3
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

On Thu, 15 Jun 2023 15:43:04 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> Lang Daniel (10):
>   package/llvm-project: new group for llvm packages
>   package/llvm: move to llvm-project folder
>   package/lld: move to llvm-project subfolder
>   package/clang: move to llvm-project subfolder
>   package/compiler-rt: move to llvm-project subfolder
>   package/libclc: move to llvm-project subfolder
>   package/llvm-project/llvm-cmake: new package
>   package/llvm-project/llvm-libunwind: new package
>   package/llvm-project: bump to version 15.0.3
>   DEVELOPERS: add Daniel Lang for llvm-project

Thanks a lot, I have applied the entire patch series, with some fairly
small changes:

- I have squashed the patch touching the DEVELOPERS file into the first
  patch adding package/llvm-project in the first place. This ensures
  this directory isn't introduced as an "orphan" directory.

- I have taken care of updating the .checkpackageignore file throughout
  the patch series, which was not taken into account here.

- The final patch doing the big bump forgot the case of
  BR2_PACKAGE_QT5TOOLS_QDOC_TOOL which has a dependency on host-clang
  and therefore now depends on host gcc >= 7. And I see I forgot to
  also update the dependency on gcc >= 7. I'll fix that up.

  In fact, as noted in the definition of this option, there is still
  something wrong here: this qt5tools option only needs host-clang, but
  for some reason, we can only build host-clang when the target
  architecture is supported, which doesn't make much sense. It would be
  nice to look into this.

Thanks a lot for your efforts on this, and sorry for the long delay to
review and merge this.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
