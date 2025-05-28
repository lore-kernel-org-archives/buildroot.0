Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C3C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 16:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49FC40A31;
	Wed, 28 May 2025 16:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7LGGNLek_vU; Wed, 28 May 2025 16:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC3240A32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC3240A32;
	Wed, 28 May 2025 16:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5AC19D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6562A81305
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kL1O8HpitYD7 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 16:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BB1981272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB1981272
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BB1981272
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:46:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C2B439D3;
 Wed, 28 May 2025 16:46:19 +0000 (UTC)
Date: Wed, 28 May 2025 18:46:17 +0200
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250528184617.1f4b9130@windsurf>
In-Reply-To: <20250528-fix_license_toolchain-v1-3-34295630709b@bootlin.com>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
 <20250528-fix_license_toolchain-v1-3-34295630709b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeejjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtudemfedtieelmeeiudelgeemiedtfheimeguuggufhemvgdtfedumegvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtudemfedtieelmeeiudelgeemiedtfheimeguuggufhemvgdtfedumegvkedtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748450782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dq2AACyQqtv6PZvv3U2zRoIBVWgyZzKstulRKMbge/U=;
 b=c37+z1nQpJTHAWq2MYDQF+qL+w2c2zA3FXUBeTcu+OTILltr3lyuISy776jcuGWYRf6+XE
 FT8gilH5G3vS2Xy9jzQsiKDk03ahYkQi/HCKv/yXEn6SzdcDC7pg5DmtKszZTMR/yl5sBv
 f6x01ORMVlbSKCjg09qnjM1gOOvB/ApEBrCKqL1mt9qzxFEmroB1Q0GAFOmR2V2xz1MHSa
 qmTz9Lulx1CvV/082s0L7xHOoX43LaLZAcxNQK303aESil/RE8rXMFLkNrc3Y+zprtUhgJ
 QgtSqCvdLFUOV8W/4vc/nSkfRvgdb5aWU6GWNFSpaRL5S4aMENe2/B4a0/Apwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c37+z1nQ
Subject: Re: [Buildroot] [PATCH 3/5] toolchain-external-linaro*: Add support
 for license file description
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 May 2025 16:58:00 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:


> +sha256  c069e5dfe15e372d25b17c4124a5f8dd55b9f191d633f5954cdb766f8f23eaa9  share/info/annotate.info
> +sha256  2551fc28dc6c6b756f9612b3f89c4fb485c9694fc5966aa214d7f408bce80519  share/info/as.info
> +sha256  0c1abdf8a8f14779464095c0713012d84c7f953a07cb95e3bc96a82a9cdbf53d  share/info/bfd.info
> +sha256  e941845f6e6b949fe7108fb37e12d69618c194242ee3b4a017a9f83de9dd6413  share/info/binutils.info
> +sha256  c391849998371cfcb37f9b2be89a05741c575a4393334b7592496aa560074b1b  share/info/cpp.info
> +sha256  37275dbe06c98068171b22a0ae42ef081e2e9ad46b362f858cd20b92681ea208  share/info/cppinternals.info
> +sha256  c17fe3000a0567e1d8222b3ea84c0486a6ddce560751ca52a8114f9da698cacf  share/info/gcc.info
> +sha256  0bdd496d8869610781ce7597d416b5e0766201a400e8e07189303d385a9f57a7  share/info/gccinstall.info
> +sha256  25b3fa627982d60491253dc54babb1181ea48d428a433fc4a6526ec20831f5d4  share/info/gccint.info
> +sha256  1aa3708b21aef829201ddc1905269ae4e9878a55519c71bc1cb95e5a4acdfcff  share/info/gdb.info
> +sha256  b4d8ce068704b9ea8f3a53e2854665dc79faa368ccfc2378e02145a8600372f8  share/info/gfortran.info
> +sha256  bc690ceaef812eb24ff78db7c126c7c437e4ac28735b574f0a26156bfa1d1814  share/info/gmp.info
> +sha256  2c6c34554dc0510af68276ec25ac40aec8c60adb9d342754a4ecf91af31c3d96  share/info/gmp.info-1
> +sha256  68920853733f61b4c7bfd1136a7590da2dd6d131f2c2e87e271cd32415b477e3  share/info/gmp.info-2
> +sha256  4d9f0af46c653b9a5a67c472b08cf25723ff717c138691ac6616e583544aba84  share/info/gprof.info
> +sha256  b84087feb8b8fae12f74a66aa047b662c7b792cee730cc82fd3a614fe613b6af  share/info/ld.info
> +sha256  e55fcf49ee60c48fa5890df1c39fb49660c24c56768c7025f531e02513eb64d2  share/info/libgomp.info
> +sha256  6217bcbd1f2e626ad11ec95b660eb3ee46ed643e17eb91c191c075ca4bf753cd  share/info/libitm.info
> +sha256  231a4ff2f3dc0f01091f3ca0720dbcf1374441a5c9fc82a4903d8b07e85dd8fa  share/info/mpc.info
> +sha256  9d125638fe0cb17b98434af9ed52630fd443653d87a88d1e5be42c92abca355f  share/info/mpfr.info
> +sha256  83a110dcc363139c652eef0a6d8061e91df3d0e56e3cb46b172ea6c61638364e  share/info/stabs.info

I guess those info files are the full documentation of gdb, gcc, as,
etc. ? They will change very often, completely unrelated to the license
changes, no?

> +TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_LICENSE = multiple

I'm wondering if stating "multiple" really helps. Shouldn't we actually
list the licenses?

The concern I have is that a toolchain-external package is really just
a target package, so we can't distinguish easily what goes on the
target vs. what stays on the host and that's quite important
license-wise. This is BTW why we introduced the gcc-runtime package
when Buildroot is building the toolchain, it allows to clarify the
licensing of host packages (host-gcc, host-binutils, host-gdb) vs. the
licensing of what goes into the target (gcc-runtime).

Should we make external toolchain packages host packages, and have a
single target package like toolchain-external-runtime that takes care
of copying things over to staging/target ? (But then if the licensing
is different per toolchain that's annoying). Or should each external
toolchain package be both a target and a host package ?

Many questions for which I don't have immediate answers I must admit.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
