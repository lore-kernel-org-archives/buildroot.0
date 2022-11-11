Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C66DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB64760B2A;
	Fri, 11 Nov 2022 20:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB64760B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UM9JR9vpREtx; Fri, 11 Nov 2022 20:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 322E66059E;
	Fri, 11 Nov 2022 20:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 322E66059E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95C061BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63AD381490
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63AD381490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3fXBpBbe3_k for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:44:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278FD8145D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 278FD8145D
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:44:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4703F40004;
 Fri, 11 Nov 2022 20:44:47 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:44:46 +0100
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20221111214446.3dce302b@windsurf>
In-Reply-To: <20221102211019.71376854@windsurf>
References: <20221102211019.71376854@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668199487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwMLC31cELH04ckEuxqrNfAaeQPxPUK+VLYFapQ8HiE=;
 b=kfG7rgIbJzE1ST21I+wU9HXGS1RmDmfzVPAl1OURBjzq12ptHaqiE7qBECcNayMV3n3g0Z
 uFNhV+55D8FrgDwl8wg+9gP1A2ijSgvmEcROtWZBDyEXcrBif16TLMoVWESXTMNlQ/M2DG
 cmPUKwNUwdPLa2Iyy9854wmuQkgqwoapfweZ07R1ToQdHylVxZayvRxDB91z2zVUleDCZa
 Mj5tC9FhW65JotaG5Vjg1IpKZm1V5DAMG5WYMLzpOC5edwIHVZKj6qRVERy+eMxHeqty+I
 zOOkaoVCjKRZcLdkC46kSzGFqytI1Wc/lhDUMr8smBIe73ZP6BYaG2n5yGCDAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kfG7rgIb
Subject: Re: [Buildroot] snps_arc700_axs101_defconfig fails to build
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

This defconfig is still failing, with the same error message. Could you
have a look?

Otherwise, we will remove the defconfig before the 2022.11 release.

Thanks a lot!

Thomas

On Wed, 2 Nov 2022 21:10:19 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Alexey,
> 
> According to
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3259666747,
> snps_arc700_axs101_defconfig fails to build with:
> 
> msort.c: Assembler messages:
> msort.c:200: Error: opcode 'dmb' not supported for target arc700
> make[4]: *** [../o-iterator.mk:9: /builds/buildroot.org/buildroot/output/build/glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca/build/stdlib/msort.o] Error 1
> 
> During the glibc build. Could you have a look?
> 
> Thanks a lot!
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
