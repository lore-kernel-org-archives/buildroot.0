Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE5ECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198D38345D;
	Wed, 10 Sep 2025 07:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxTMbfo1DGw7; Wed, 10 Sep 2025 07:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1178348C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1178348C;
	Wed, 10 Sep 2025 07:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB88234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 212FE60766
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyYyLuw4u9Za for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 298146060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298146060A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 298146060A
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:56:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1DA78C653F7;
 Wed, 10 Sep 2025 07:56:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C40D4606D4;
 Wed, 10 Sep 2025 07:56:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D702102F2925; 
 Wed, 10 Sep 2025 09:56:31 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:56:29 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Neal Frager
 <neal.frager@amd.com>, yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <20250910095629.01a0715c@booty>
In-Reply-To: <20250910095057.08ac190f@booty>
References: <20250905122057.2520997-1-neal.frager@amd.com>
 <20250910095057.08ac190f@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m/u27cOQgLqXgicMXT/GnuUb4KSrCXf2DxNHPMFbjs0=;
 b=gZ82z0EnwgGoYwBIv3xdDeSAvHJ+WVRroQh7t39LplkW2Pf5qReJDTia8gvfCkFfsRIhER
 kFxSsOmxQImhS+Lfqh6LrsX/FWcl65G+yZI8NTxN2BR8JyBhKdoH0eUPrH0zRS3RqndidC
 osCFXd4d6OehEPMvPCpY3wkOpez2kyIFTgaqvA0jAi0TYI3in1o2j5qSjs/DI9e4MTePmb
 vO6P9+QN1i9xjh7pPqUZj5Pgyhghk4fru404q8C1/13ZfClwNFJ755zUjfTFyMjDr+KUMy
 e+nEmjvzpUD8o+9et8UO+tIVQX4tN7rOTXnTlp1rY/J6Sx343tluwTaxibHuog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=gZ82z0En
Subject: Re: [Buildroot] [PATCH v1 1/1] board/arm-trusted-firmware: override
 BL31 environment variable error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Sep 2025 09:50:57 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> On Fri, 5 Sep 2025 13:20:57 +0100
> Neal Frager <neal.frager@amd.com> wrote:
> 
> > When building the arm-trusted-firmware, if the host environment has a value
> > configured in the BL31 variable such as the following:
> > 
> > export BL31=/tmp/bl31.elf
> > 
> > This will cause the build of the bl31.elf to be skipped leading to the
> > following build error:
> > 
> > make[1]: Nothing to be done for 'bl31'.
> > And then:
> > readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file
> > 
> > To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
> > arm-trusted-firmware will build regardless of the host environment.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Dang. Messed up with my mailer. Please ignore this R-by!

Apologies,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
