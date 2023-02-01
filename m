Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA752C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 07:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21AE240607;
	Wed,  1 Feb 2023 07:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21AE240607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvyJKuGWIFhe; Wed,  1 Feb 2023 07:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0BEA405DB;
	Wed,  1 Feb 2023 07:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0BEA405DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 601421BF215
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39C6360E5D
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C6360E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ve_LSiU_k5G for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 07:23:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A489260BDE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A489260BDE
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 07:23:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F90640008;
 Wed,  1 Feb 2023 07:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pN7Sr-00AY7l-3w; Wed, 01 Feb 2023 08:23:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230130121930.3472747-1-thomas@devoogdt.com>
 <20230130121930.3472747-3-thomas@devoogdt.com>
Date: Wed, 01 Feb 2023 08:23:29 +0100
In-Reply-To: <20230130121930.3472747-3-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Mon, 30 Jan 2023 13:19:30 +0100")
Message-ID: <87357p4zny.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 3/3] package/fluent-bit: needs arch
 support and C++ for wasm
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > See:
 > https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms

 > MIPS & RISCV32 are mentioned in the supported list,
 > but that seems to be wrong, so excluded those.

 > Fixes:
 > - http://autobuild.buildroot.org/results/dfb/dfb8f71d7e016cdfd3beb4b8196081898bd49ae2/build-end.log
 > - http://autobuild.buildroot.org/results/ecf/ecfe7b67af68cd7f397a50360900cd9a7afc830e/build-end.log

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > ---
 >  package/fluent-bit/Config.in     | 15 +++++++++++++++
 >  package/fluent-bit/fluent-bit.mk |  6 ++++++
 >  2 files changed, 21 insertions(+)

 > diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
 > index 11ceb55d4f..50437cab60 100644
 > --- a/package/fluent-bit/Config.in
 > +++ b/package/fluent-bit/Config.in
 > @@ -10,3 +10,18 @@ config BR2_PACKAGE_FLUENT_BIT
 
 >  comment "fluent-bit needs a glibc toolchain"
 >  	depends on !BR2_TOOLCHAIN_USES_GLIBC
 > +
 > +if BR2_PACKAGE_FLUENT_BIT
 > +
 > +config BR2_PACKAGE_FLUENT_BIT_WASM
 > +	bool "Build with WASM runtime support"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
 > +	default y if BR2_arc
 > +	default y if BR2_arm || BR2_armeb
 > +	default y if BR2_aarch64 || BR2_aarch64_be
 > +	default y if BR2_i386 || BR2_x86_64
 > +	default y if BR2_RISCV_64
 > +	default y if BR2_xtensa

I know that Yann suggested this, but it doesn't work. We cannot mix the
arch dependencies like this with an option with a prompt, because the
user can still manually enable the option on an unsupported
architecture.

You were also missing some help text and I think this "filters written
in WASM" feature is quite unlikely to be used, so I changed it to
default off with:

config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
	bool
	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
	default y if BR2_arc
	default y if BR2_arm || BR2_armeb
	default y if BR2_aarch64 || BR2_aarch64_be
	default y if BR2_i386 || BR2_x86_64
	default y if BR2_RISCV_64
	default y if BR2_xtensa

config BR2_PACKAGE_FLUENT_BIT_WASM
	bool "wasm runtime support"
	depends on BR2_INSTALL_LIBSTDCPP
	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
	help
	  Support for WASM-based plugins.

And committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
