Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B9FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF8342083;
	Mon,  6 Nov 2023 21:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF8342083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5gmQ8wLyNe2; Mon,  6 Nov 2023 21:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3ED4207E;
	Mon,  6 Nov 2023 21:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3ED4207E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 800121BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F2CB41599
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2CB41599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jNg3w_Ojno1 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:08:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 090E9401CC
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090E9401CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DFC41C0006;
 Mon,  6 Nov 2023 21:08:39 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:08:38 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231106220838.19709e3a@windsurf>
In-Reply-To: <20231106174325.733746-1-adam.duskett@amarulasolutions.com>
References: <20231106174325.733746-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699304919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbsdCdM84l+kHxPz0sIFuMzvfqdVG4eCvyi1mdmjbls=;
 b=NDas8dRx93l3DulwZRL6WFWJcEHfuL3aDid+mk1GVbIAc3SUWfHGf1+I1bQiJ5jggwpUk6
 OaIELvkUsVMI0BSb+GfsHJpIHNlPMVO4rJEIft9qWxdv/whnUDvmTyMqTJXtf0EvL0ACYM
 dAhfpD94c2Pw8hfdbZEloMnPnsGRZbSx793J3TrWRIj73dugaWCBcJF+/tB1N2UcjWkBG8
 vEeqPkJ+4IEDiBiM3UvEgXR3ZMVCIDEucYVh9wNcW4eGfTQ8XdLdHAulI9z3FJTC3iEsV4
 gi15KogF/mJeI2UBgrI+sBUif90o/0riCaWue7w/LSJ3/0MuPOzz7CSc0RWHIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NDas8dRx
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 17.0.9+9 and 21.0.1+12
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

On Mon,  6 Nov 2023 10:43:25 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> - Move openjdk-bin.hash into separate directories, as the
>   legal/java.prefs/ASSEMBLY_EXCEPTION file has an upated URL for OpenJDK 21.
>   openjdk.java.net -> https://openjdk.org. The license type remains the same.
> 
> - Move 0001-Add-ARCv2-ISA-processors-support-to-Zero.patch into separate
>   directories as the list of architectures in src/hotspot/os/linux/os_linux.cpp
>   is no longer the same. 17 has LOONGARCH and 21 has LOONGARCH64.
> 
> Tested on Fedora39 and Debian 11 with:
> ./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run
> 
> Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/openjdk-bin/17.0.9_9/openjdk-bin.hash |   7 ++
>  .../openjdk-bin/21.0.1_12/openjdk-bin.hash    |   7 ++
>  package/openjdk-bin/openjdk-bin.hash          |  11 --
>  package/openjdk-bin/openjdk-bin.mk            |   7 +-
>  ...ARCv2-ISA-processors-support-to-Zero.patch |  18 +--
>  ...ARCv2-ISA-processors-support-to-Zero.patch | 109 ++++++++++++++++++
>  package/openjdk/openjdk.hash                  |   4 +-
>  package/openjdk/openjdk.mk                    |   8 +-
>  8 files changed, 140 insertions(+), 31 deletions(-)
>  create mode 100644 package/openjdk-bin/17.0.9_9/openjdk-bin.hash
>  create mode 100644 package/openjdk-bin/21.0.1_12/openjdk-bin.hash
>  delete mode 100644 package/openjdk-bin/openjdk-bin.hash
>  rename package/openjdk/{ => 17.0.9+9}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (86%)
>  create mode 100644 package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch

You had forgotten to update .checkpackageignore, so I did that when
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
