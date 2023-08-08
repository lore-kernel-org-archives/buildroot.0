Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE35C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D15E82121;
	Tue,  8 Aug 2023 21:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D15E82121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YP8CZ8XyZ58e; Tue,  8 Aug 2023 21:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C268210C;
	Tue,  8 Aug 2023 21:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C268210C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8A51BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA7E58210C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7E58210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouSfd0KVss58 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:56:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A7282071
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A7282071
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97C2420005;
 Tue,  8 Aug 2023 21:56:28 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:56:27 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230808235627.3fa92931@windsurf>
In-Reply-To: <20230712125154.1361000-2-jamie.gibbons@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691531789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvx+EqjyfLqHvcRdROumlrvDsO4/ybuL3wg5Mj5F9l4=;
 b=dDdB87/+PP9PdOIXTttoN1K7hmkiPmLWk/7kkk0ZVeZuMRKgPwdVvL/IbtEEWcSbFZ0g7l
 ijTkkUr2+aHIcVv96QFIBbA4dVKGqTAZQETekgG9MZMjWAL2jJiQLXV2ILZKtuNHh1xdgW
 jUWkfOnGJsx7AChwXnfFgSaczSeOdIJhDirlvi7tMluzfM0eMfJWUy/jHN002KzOKmMrPt
 7TOLh1Zx7iV+adY+Kco/m+G0ssCM6/VB+gMLjb0JdPhslofm4fmHb6vA0/P1ud/tRZKtPi
 DgKOrXWb2dQBCHOe51a45n3GhjVOBjmbYHAmrHOy8Tt43Cvg4DxHkdIto7d3gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDdB87/+
Subject: Re: [Buildroot] [PATCH v3 1/2]
 package/microchip-hss-payload-generator: add host package
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Wed, 12 Jul 2023 13:51:53 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> The Buildroot icicle kit configuration uses the Hart Software Service's
> (HSS) payload generator tool. This tool creates a formatted payload
> image for the HSS zero-stage bootloader on PolarFire SoC, given a
> configuration file and a set of ELF binaries. The configuration
> file is used to map the ELF binaries or binary blobs to the
> individual application harts (U54s). Add the HSS payload generator as a
> host package to support this.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  DEVELOPERS                                    |  3 +++
>  package/Config.in.host                        |  1 +
>  .../Config.in.host                            | 11 ++++++++
>  .../microchip-hss-payload-generator.mk        | 25 +++++++++++++++++++
>  4 files changed, 40 insertions(+)

This was missing a hash file for the package, which provides the hash
of the tarball and the hash of the license file.

> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md

I was initially confused by this, because LICENSE.md also mentions than
the repo contains OpenSBI, which is under BSD-2-Clause. But in fact
this package only builds what's in tools/hss-payload-generator, so the
rest is irrelevant. Therefore, I have changed this to:

+# Some parts of the repository are under different licenses, but we
+# are only building/installing the code in
+# tools/hss-payload-generator/.
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT or GPL-2.0+
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = tools/hss-payload-generator/LICENSE.md

Let me know if you think this is incorrect.

I've applied to our "next" branch with those changes. Thanks!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
