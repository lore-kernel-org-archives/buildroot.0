Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F84C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F27840948;
	Thu, 10 Aug 2023 13:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F27840948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w05qYWbZ6Csy; Thu, 10 Aug 2023 13:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2CB3405C2;
	Thu, 10 Aug 2023 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2CB3405C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31C91BF4E2
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8D283F9C
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8D283F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adrYUCh6-dDu for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 13:53:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7400B83FAA
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 13:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7400B83FAA
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0311C0004;
 Thu, 10 Aug 2023 13:53:01 +0000 (UTC)
Date: Thu, 10 Aug 2023 15:53:00 +0200
To: <Jamie.Gibbons@microchip.com>
Message-ID: <20230810155300.19ac971b@windsurf>
In-Reply-To: <36d1e8110955931efe354356c9b09c29f332f8fb.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
 <20230808235919.0002f19d@windsurf>
 <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
 <20230809170230.59759159@windsurf>
 <36d1e8110955931efe354356c9b09c29f332f8fb.camel@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691675582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PL3uKfJFXpEmTINDT4hdz1uf8JmjBu3D0dGdXKOOojQ=;
 b=BQRbnPKQ7YJhyPT3erK4jPmAotT/4cbtBMDSB0G2wKK/u4quZPS5siy4COJSSE9HyXgC+B
 mfA/XkdipUAlUvme+R4EcYS9pv4ws5ACZT9NcJQnK4tPQbK/Ok/qfmF+ME+2Ipvzq9nQ8A
 XSC8C5riEVUCB01ESK8boYq6JNljLYShLnspeLjlU6QbJk4RL3O3ll+6YWMF9wReDc+L05
 p1VLK7g5AkJMeqr3AuGbn6Pe89A13l6I8ymjYgu+pQ1UDlXb/Ci/A7fQDYjKuib3bDFLOW
 Th8kqOqyB5zWmch40lC1xjXqML98WOwocL9cNtabN9KZZMamzrqmhTm0I/Y0tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BQRbnPKQ
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Cc: Conor.Dooley@microchip.com, Nicolas.Ferre@microchip.com,
 Ludovic.Desroches@microchip.com, buildroot@buildroot.org,
 Valentina.FernandezAlanis@microchip.com, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Thu, 10 Aug 2023 10:46:30 +0000
<Jamie.Gibbons@microchip.com> wrote:

> THe HSS code is located in eNVM of the Icicle kit for PolarFire SoC and
> built outside of Buildroot.

ACK.

> The HSS paylaod generator which is a host tool to create HSS formatted
> payloads is built by buildroot. This is covered in the microchip-hss-
> payload-generator package. This tool is released under dual MIT/GPLv2+
> licenses.
> https://github.com/polarfire-soc/hart-software-services/blob/master/tools/hss-payload-generator/LICENSE.md
> 
> The HSS payload generator is the only software compnent here that is
> built inside Buildroot. The HSS code and OpenSBI are both built outside
> Buildroot, so their licences are not a concern.
> 
> I hope this clears things up further.

This is all clear.

Can this HSS code + OpenSBI stored in the eNVM be updated by the user?
If it's the case, would it make sense for Buildroot to be able to build
it?

> > Does that make sense in the RISC-V world?  
> 
> After a discussion with colllegues we believe that the above two configs
> should be available when BR2_riscv_g is selected as suggested. This does
> make sense.

Cool, we agree!

> Would you like me to include this change in a patchset to fix the
> configs for the microchip_mpfs_icicle_defconfig or do you want to make
> this update yourself?

Feel free to send a patch set :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
