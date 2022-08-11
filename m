Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D4C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A3B9610A5;
	Thu, 11 Aug 2022 11:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3B9610A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A-5ttny7bvy; Thu, 11 Aug 2022 11:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC1461082;
	Thu, 11 Aug 2022 11:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC1461082
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0C9E1BF403
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A325982B24
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A325982B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDtiqB_mG77W for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:00:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5822A80CCE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5822A80CCE
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:00:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C57AFFF806;
 Thu, 11 Aug 2022 11:00:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM5uy-002ogF-UL; Thu, 11 Aug 2022 13:00:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
References: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
 <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
Date: Thu, 11 Aug 2022 13:00:00 +0200
In-Reply-To: <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
 (Bram Vlerick's message of "Wed, 10 Aug 2022 18:32:11 +0200")
Message-ID: <87wnbfm4en.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.15
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bram" == Bram Vlerick <bram.vlerick@openpixelsystems.org> writes:

 > New version contains updated binaries which are part of the NXP
 > 5.15.5-1.0.0 Yocto release.

 > Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

License files updates are important, so they shouldn't be silently
done. I've added a note about the changes and also added SCR.txt as
suggested by Stefan and committed, thanks.

> ---
 >  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 >  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
 > index 98a0e73048..c86e4244ef 100644
 > --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
 > +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
 > @@ -1,4 +1,4 @@
 >  # Locally calculated
 > -sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
 > -sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
 > -sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
 > +sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
 > +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
 > +sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
 > diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
 > index 211a43c4ca..2d1818334a 100644
 > --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
 > +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -FIRMWARE_IMX_VERSION = 8.12
 > +FIRMWARE_IMX_VERSION = 8.15
 >  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 >  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
 > -- 

 > 2.31.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
