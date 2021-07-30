Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF835C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 08:02:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7234603E9
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 08:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7234603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dopsi.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF88414A0;
	Fri, 30 Jul 2021 08:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlEdtMeesRka; Fri, 30 Jul 2021 08:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3789414B7;
	Fri, 30 Jul 2021 08:02:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE471C116E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 08:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A5CA6063F
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 08:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dopsi.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5fe4RRgoEob for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 08:02:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 545B36059B
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 08:02:11 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4Gbfq63wSkz4wxY4
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 07:56:18 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=dopsi.ch header.i=@dopsi.ch
 header.b="ckfVd7Jw"
Date: Fri, 30 Jul 2021 07:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dopsi.ch;
 s=protonmail2; t=1627631767;
 bh=d6fJ69K9jugvrRVXSGpD9rBqTZffvxpk0AzZ5EwXjT8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ckfVd7Jw3kAjuENSspjfm8dagMqZt0SGe0Ro6n3RkiYUrFSKh3LyRUzsyJoaVRVUp
 riLJzQSzNtlRWh9V9NokgnshrAI5sWFwXCpnrCZPPTxy6cdsyEQW9VFJAJWBgEI15j
 nigOnYPeZPBfv5zOmpJ275QaHJv0WJxLeWlHwkFKCQ8IX9lRq1uYCeQvv6ux2T97wE
 Qua9XrdBSqTzEIa0H2k4EZAUHQDzQgiyIamzZyNd66VBk1/Ld2k/e+9ONaEgiIL8vc
 +RhM+SBilI16o4W2KxAjHWB8ONBj/9MoOUWacuWmyYceS4HC3RTfq5XA2M6VmNydu7
 gtZLMeO5B6x7Q==
To: buildroot@buildroot.org
From: dopsi@dopsi.ch
Message-ID: <20210730075536.825224-1-dopsi@dopsi.ch>
In-Reply-To: <20210728222728.12f04f5a@windsurf>
References: <20210430105647.1702322-1-dopsi@dopsi.ch>
 <20210728222728.12f04f5a@windsurf>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/1] configs/stm32mp157c_odyssey: new
 defconfig
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: dopsi@dopsi.ch
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi all,

This is version 2 of the patch to add support for the Seeed STM32MP157C
Odyssey board.

It includes a minimal system booting from SDMMC1.

v2 takes into account all the suggestions and requested changes by Thomas Petazzoni:

* adding myself to the DEVELOPERS file
* switching to the TF-A SPL boot
* fix patch formatting
* use the provided genimage script
* remove the uboot fragment, the configuration issue was fixed
* remove what should not be enabled in the config

Regards

Simon Doppler



_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
