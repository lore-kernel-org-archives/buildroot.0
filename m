Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD29C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 09:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC028231B;
	Sat, 25 May 2024 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSNXO09M1obI; Sat, 25 May 2024 09:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E1B822E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E1B822E2;
	Sat, 25 May 2024 09:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7361D038C
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED8A360609
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 09:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_5_4g3OFh-l for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 09:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69A5D605E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A5D605E7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69A5D605E7
 for <buildroot@buildroot.org>; Sat, 25 May 2024 09:45:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E5661C0002;
 Sat, 25 May 2024 09:45:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAnxy-001Ycy-1i;
 Sat, 25 May 2024 11:45:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240524220421.710392-1-giulio.benetti@benettiengineering.com>
Date: Sat, 25 May 2024 11:45:30 +0200
In-Reply-To: <20240524220421.710392-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 25 May 2024 00:04:21 +0200")
Message-ID: <874jami5s5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig: add
 uboot and linux hashes
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add BR2_DOWNLOAD_FORCE_CHECK_HASHES and drop defconfig entry in
 > .checkpackageignore.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  .checkpackageignore                    | 1 -
 >  boot/uboot/uboot.hash                  | 1 +
 >  configs/amarula_vyasa_rk3288_defconfig | 1 +
 >  linux/linux.hash                       | 1 +
 >  4 files changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index ebf320c3c5..9b9e4a61f9 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -122,7 +122,6 @@ configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 >  configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
 >  configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 >  configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 > -configs/amarula_vyasa_rk3288_defconfig lib_defconfig.ForceCheckHash
 >  configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 >  configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 >  configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 > diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
 > index a8021fb696..b0ffd7e69d 100644
 > --- a/boot/uboot/uboot.hash
 > +++ b/boot/uboot/uboot.hash
 > @@ -1,3 +1,4 @@
 >  # Locally computed:
 > +sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
 >  sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt

This is not right. You should add the hash to a custom
board/amarula/.../patches/uboot/uboot.hash file, E.G. see commit
459c8c95c7 (configs/orangepi_r1_defconfig: add hashes for
Linux/headers/u-boot) for an exmple.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
