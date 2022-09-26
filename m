Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2654C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526FD60F96;
	Mon, 26 Sep 2022 12:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526FD60F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CNBofmd31_X; Mon, 26 Sep 2022 12:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD9760F8C;
	Mon, 26 Sep 2022 12:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD9760F8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 451EF1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DF8060F72
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF8060F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFmhdVsRLC4U for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:17:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C575C60F6E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C575C60F6E
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:17:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A083A24000A;
 Mon, 26 Sep 2022 12:17:33 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:17:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220926141733.2f962f51@windsurf>
In-Reply-To: <20220925125109.269192-1-fontaine.fabrice@gmail.com>
References: <20220925125109.269192-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664194653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqLTPeDLChukE11ZRgdEfsd9KmjUUINFQTbj58fwr1w=;
 b=nMukemDCMwvtJcgSfXxLhw+CxrZm+PtTRqxH3DczupzmZl32BrAs0eu+85WmUksY1A4ip7
 zBD4BgcC2jW2qhlse27dAupJcm0mIyERXVQxg8yA63VkPKmKGFY+6VsMJkwg/GaGr5qGBa
 F2dDcBQiJJrt3VLA0kkkwHIvYLN0XDkCjQFClwARahcAfM+/e6zNr/AAVAb6waGo+6Du+o
 J8lxommv7LWl5r+VS0SF8Co+T2aqOekDNYQJkUVRz3GPKDtlLvG4jURsurMESQHG5yCYxT
 BUtT+vwDWcOegpd0J53nSpXJqIA4tGJB6MYeKakDaR8N3SKQC1lY0D50HCQ+yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nMukemDC
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: bump to version 4.3.0.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 14:51:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - boost regex is not needed since
>   https://github.com/EttusResearch/uhd/commit/f773cf9fb96e25d064f43cffdc893ac905d91f15
> - Drop all patches (already in version) except first one which has been
>   reverted by upstream:
>   https://github.com/EttusResearch/uhd/commit/1a00949b19eaecb84af0f27c370400dc71a9fd84
> - Add LGPL-3.0+ for fpga/usrp3:
>   https://github.com/EttusResearch/uhd/commit/bafa9d95453387814ef25e6b6256ba8db2df612f
> - N230 is not supported since
>   https://github.com/EttusResearch/uhd/commit/d94140a4129d6b2153b15860eeb2406672ebb414
> - RFNoC is not supported since
>   https://github.com/EttusResearch/uhd/commit/7d69dcdcc318ccdf87038b732acbf2bf7c087b60
> 
> https://github.com/EttusResearch/uhd/blob/v4.3.0.0/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                              |  14 +
>  ...add-boost-unit_test_framework-requir.patch |  12 +-
>  .../uhd/0002-host-fix-build-boost-173.patch   | 577 ------------------
>  .../0003-add-RISC-V-endian-detection.patch    | 113 ----
>  ...-lib-Fix-missing-includes-in-rpc-hpp.patch |  28 -
>  ...ove-boost-math-in-favor-of-std-cmath.patch | 105 ----
>  ...ost-math-iround-math-sign-with-std-l.patch |  57 --
>  ...explicit-template-type-for-std-min-T.patch |  28 -
>  package/uhd/Config.in                         |  11 -
>  package/uhd/uhd.hash                          |   5 +-
>  package/uhd/uhd.mk                            |  18 +-
>  11 files changed, 26 insertions(+), 942 deletions(-)
>  delete mode 100644 package/uhd/0002-host-fix-build-boost-173.patch
>  delete mode 100644 package/uhd/0003-add-RISC-V-endian-detection.patch
>  delete mode 100644 package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
>  delete mode 100644 package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
>  delete mode 100644 package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
>  delete mode 100644 package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
