Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3FBC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836AD838F7;
	Wed,  5 Feb 2025 11:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mATxhMpfGiR; Wed,  5 Feb 2025 11:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752C7838FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 752C7838FB;
	Wed,  5 Feb 2025 11:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB1E712A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F9C2838FB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toI4XbgyB-0A for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F104838ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F104838ED
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F104838ED
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AED04428A;
 Wed,  5 Feb 2025 11:08:12 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:08:11 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205120811.6ba24984@windsurf>
In-Reply-To: <20241219053053.2389046-9-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-9-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsghrihgrnhdrtggrihhnsehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738753692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ET+7VynvHIvMg1bjY7j7XFz3FQZKbcv06n0+q4ZK3Gw=;
 b=cmSZ3sDraNXiQXjXrTxEz2Xp8CE1RsFDwUDLwCjW2cp8o3Oqen+9w+a7M+z7i8j3OrrYwr
 BsjT7EzRbZ+uHZdz0lQK748Jp1DPjwrgtUumjtgCLXmQfmADS4e1Iux+JqEVEhZQgzh5Th
 B5+JCJZ89vcE+lMgRLFtzH38Oo+SR/NeRQsmmn4h4YMjMYjVDFpimdtGiflY0k5bU+zafm
 KaTtO4tL1YdbBvHM5bw1Ekxywqw2eiowCUbf4bWcCmvP/0HqE/O27BiyMYhExCvmu6HdKq
 yVO4wdft1ygzTuCFNb9MkjB3YAhYfYotyZs+pNEUpUWyN8ANFr8lc9CxJMnz1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cmSZ3sDr
Subject: Re: [Buildroot] [RFC v2 08/14] package/hexagonMVM: new package
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

Hello,

On Wed, 18 Dec 2024 21:30:47 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> MiniVM is a virtual machine used by the Linux kernel for
> the hexagon architecture.

Is it "MiniVM" or hexagonMVM ? Also, with your definition, I'm really
unclear about what hexagonMVM really is. Is it a VM that runs under
Linux? Or the VM under which Linux runs? Or?

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  package/Config.in                  |  1 +
>  package/hexagonMVM/Config.in       |  8 ++++++++
>  package/hexagonMVM/hexagonMVM.hash |  5 +++++
>  package/hexagonMVM/hexagonMVM.mk   | 27 +++++++++++++++++++++++++++
>  4 files changed, 41 insertions(+)

Package name should be lower-case. Maybe hexagon-mvm.

Please update the DEVELOPERS file in this file.

> diff --git a/package/hexagonMVM/Config.in b/package/hexagonMVM/Config.in
> new file mode 100644
> index 0000000000..b00666188b
> --- /dev/null
> +++ b/package/hexagonMVM/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HEXAGONMVM
> +	bool "Hexagon MiniVM"
> +	depends on BR2_hexagon && BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0

BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0 doesn't exist as of this commit, so
you have a patch ordering issue.

> +	help
> +	  Hexagon VM implementation.  This virtual machine can be used
> +	  to boot linux or other operating systems / programs.

Ah so its the VM under which Linux runs?

> +
> +	  https://github.com/quic/hexagonMVM
> diff --git a/package/hexagonMVM/hexagonMVM.hash b/package/hexagonMVM/hexagonMVM.hash
> new file mode 100644
> index 0000000000..3e1ae8e2b4
> --- /dev/null
> +++ b/package/hexagonMVM/hexagonMVM.hash
> @@ -0,0 +1,5 @@
> +
> +#

Minor: drop those two lines.

> +# Locally computed
> +sha256  e5e3ba941af491cab37ece5db85eb7422db9dd0d13464ea528dbf2c01c24b5f0  LICENSE
> +sha256  5345cd83b18b6b8f44d06a54bd1a518d447c311dc1c3ba7b45ffa16785e66e1b  0.2.0.tar.gz

Tarball first, license file afterwards. The tarball name is not good,
but I'll comment on that later.

> diff --git a/package/hexagonMVM/hexagonMVM.mk b/package/hexagonMVM/hexagonMVM.mk
> new file mode 100644
> index 0000000000..7b3529c14c
> --- /dev/null
> +++ b/package/hexagonMVM/hexagonMVM.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# Hexagon MiniVM
> +#
> +################################################################################
> +
> +HEXAGONMVM_VERSION = 0.2.0
> +HEXAGONMVM_SOURCE = $(HEXAGONMVM_VERSION).tar.gz

Drop this line, it will give the tarball a proper name.

> +HEXAGONMVM_SITE = $(call github,quic,hexagonMVM,v$(HEXAGONMVM_VERSION))
> +
> +HEXAGONMVM_LICENSE = BSD-3-Clause
> +HEXAGONMVM_LICENSE_FILES = LICENSE
> +
> +HEXAGONMVM_DEPENDENCIES =

If there are no dependencies, just keep it empty.

> +HEXAGONMVM_INSTALL_IMAGES = YES
> +
> +HEXAGONMVM_CFLAGS=-fno-pie -fno-pic

Spaces around = sign. Why aren't those flags in the package
makefile/build-system already?

> +define HEXAGONMVM_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" -C $(@D) minivm
> +endef
> +
> +define HEXAGONMVM_INSTALL_IMAGES_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" bindir=$(BINARIES_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
