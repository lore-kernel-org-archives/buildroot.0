Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A46CC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 11:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A4980BF4;
	Wed, 26 Oct 2022 11:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A4980BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2-2PTAg_TGn; Wed, 26 Oct 2022 11:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A60780BCA;
	Wed, 26 Oct 2022 11:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A60780BCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D34A51BF59A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC38E80BCA
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC38E80BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTkijr_bxUid for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 11:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914A280BBE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 914A280BBE
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 11:49:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9143F6000E;
 Wed, 26 Oct 2022 11:49:18 +0000 (UTC)
Date: Wed, 26 Oct 2022 13:49:16 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221026134916.666f0299@windsurf>
In-Reply-To: <20221025221308.352026-1-fontaine.fabrice@gmail.com>
References: <20221025221308.352026-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666784959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAvPAxphgfVEkSIsSgwmgEC2qaYepprQwVAWfcY+CFM=;
 b=aWrk2P39ad3EnF7IvO1HKdOsVgWpzfnr7eFoMYWI8DrGsDZwyzx7BiYyNfOVIlISHoadGe
 QrIUWtlhDBnRMymh7M0iIEYP/AGDliA5ROCac3UdJ0xwtHiX3yxO1KA8Jxne9HefxBOC3z
 2BtbKhRqb0QZXple9LSXKoB31tN2c0xTf0xh6aaj+RAFNayk9iMXOHNRgW4qr8mo3zaRZA
 H+XorzuIkJ81kY0Lnfhx9SF+cvJLf7VV15p9w8jbjfppHCvCexvnOTxECSNiwtJEyMS5ht
 +WHMPtFp1BC483IkZh/NXVduovEYk+ktYjyG8ar5WNRz5M2IMZp+iUdOQ8z+1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aWrk2P39
Subject: Re: [Buildroot] [PATCH 1/1] package/libcodec2: fix build without C++
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 00:13:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without C++ raised since bump to version
> 1.0.5 in commit a380244766342aa7172dc7b572c99db322f74c38:
> 
> CMake Error at /home/autobuild/autobuild/instance-7/output-1/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
>   The C++ compiler
> 
>     "/usr/bin/clang++"
> 
>   is not able to compile a simple test program.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/30b519aa60d5baddb4015cf3608baa04a30be907
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcodec2/0001-update-cmake.patch | 301 ++++++++++++++++++++++
>  1 file changed, 301 insertions(+)
>  create mode 100644 package/libcodec2/0001-update-cmake.patch

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
