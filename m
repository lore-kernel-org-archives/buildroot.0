Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B5C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 09:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B096404FF;
	Sat, 22 Oct 2022 09:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B096404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq59sQ_9FaoT; Sat, 22 Oct 2022 09:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B090403E9;
	Sat, 22 Oct 2022 09:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B090403E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 228971BF39A
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2434403E9
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2434403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QntIkcxWyE4 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 09:09:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81922400E5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81922400E5
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 09:09:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5134C0004;
 Sat, 22 Oct 2022 09:09:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1omAV7-00BdCw-G3; Sat, 22 Oct 2022 11:09:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
Date: Sat, 22 Oct 2022 11:09:05 +0200
In-Reply-To: <20221022082824.35440-1-neal.frager@amd.com> (Neal Frager's
 message of "Sat, 22 Oct 2022 02:28:24 -0600")
Message-ID: <87a65o443y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

Hi,

 > This patch adds Xilinx bootgen as a host package to buildroot.
 > bootgen is a required utility for generating a boot.bin for
 > Xilinx versal products.

 > In addition, for developers who wish to use secure boot with
 > Xilinx SoC products such as zynq and zynqmp, bootgen has a
 > more complete offering in secure boot features than the u-boot
 > mkimage utility.

 > https://github.com/Xilinx/bootgen

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

 > +################################################################################
 > +#
 > +# bootgen
 > +#
 > +################################################################################
 > +
 > +BOOTGEN_VERSION = xilinx_v2022.2
 > +BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 > +HOST_BOOTGEN_DEPENDENCIES = host-openssl
 > +BOOTGEN_LICENSE = Apache-2.0
 > +BOOTGEN_LICENSE_FILES = LICENSE
 > +
 > +BOOTGEN_EXTRA_CFLAGS = "LIBS=$(HOST_DIR)/lib/libssl.a $(HOST_DIR)/lib/libcrypto.a -ldl -lpthread"
 > +BOOTGEN_EXTRA_CFLAGS += "INCLUDE_USER=-I$(HOST_DIR)/include/openssl"

I have a package for bootgen as well at $WORK, where I instead use
host-pkgcon which is a bit nicer than these hard coded values, E.G.:

HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf

define HOST_BOOTGEN_BUILD_CMDS
        $(MAKE) $(HOST_CONFIGURE_OPTS) \
                LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
                INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
                -C $(@D)
endef

Bootgen also use modern C++ features, so we need to pass -std=c++0x to
fix building on older host machines, E.G.:

CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x"

I also had issues with linking with the embedded copy of flex if the
build host has the flex development package installed unless I
add the following patch, which unfortunately is still not merged:

https://github.com/Xilinx/bootgen/pull/20

Please also add a bootgen.hash file with the hash of the tarball and
LICENSE file.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
