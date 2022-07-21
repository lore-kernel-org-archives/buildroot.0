Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307CAC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 10:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822B26100E;
	Thu, 21 Jul 2022 10:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822B26100E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1qrSpmlPOY9; Thu, 21 Jul 2022 10:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98E260EBB;
	Thu, 21 Jul 2022 10:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98E260EBB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8DA1BF3CD
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 10:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8BA284012
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 10:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BA284012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8BbaFK07BUj for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 10:24:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C434983FBB
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C434983FBB
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 10:24:33 +0000 (UTC)
Received: from opfedar05.francetelecom.fr (unknown [xx.xx.xx.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4LpTFp6slbz62Km; 
 Thu, 21 Jul 2022 12:24:30 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 21 Jul 2022 12:24:28 +0200
Date: Thu, 21 Jul 2022 12:24:28 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <21739_1658399070_62D9295E_21739_128_1_20220721102428.GA2882@tl-lnx-nyma7486>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
 <20220719074042.2214649-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719074042.2214649-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1658399071;
 bh=Qrss52J2o91c7blvpRbNfdb7N7TDsQEKGdTF2Uqhmi4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=xGlX7TZiOXahv8qn4F6Dl4ZbSssR/vS1NGYPLWYZ1eT9Tf1HJgMGaFO7UjQ+o4n3z
 J+gBoizfoo22PqO9CiJTR64Pr5M6XmwNvFm0CGuSNxIak6UxgpRdnoim5Pons+GMD5
 hZzh6TQZDkf5xj7Yy5bxT9+5dEjuIJTGp2rvVpQx45iuRYh3w2mrirKMqktRA1YEyx
 UIchatorb9nk1Rjsm4SQrgtSMLgee6eFYxw3hTwBoRe5Kf0Dsc7m7FNLWQuf11Oxmd
 Ynwpd6vJtKYrHc3GgyY/73KvbFDedmu/IoEPlGz+DAUkoShwF+vYZnbjf71CKjshl5
 G4j0KFDnTRyrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=xGlX7TZi
Subject: Re: [Buildroot] [PATCH 2/4] boot/grub2: update to 2.06
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-19 09:40 +0200, Thomas Petazzoni via buildroot spake thusly:
> The update is very straightforward, as no changes in grub2.mk are
> needed beyond the version bump.
> 
> Spacing in the hash file is adjusted to the new Buildroot standard.
> 
> All patches are dropped as they have all been upstreamed between 2.04
> and 2.06. Here is the full list of patches and their corresponding
> upstream commit:
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[--SNIP--]
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index d93e383422..ce0594d1d3 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GRUB2_VERSION = 2.04
> +GRUB2_VERSION = 2.06

Tested on an actual, physical PC, x86_64 and EFI.
Tested-by: Yann E. MORIN <yann.morin@orange.com>

>  GRUB2_SITE = http://ftp.gnu.org/gnu/grub
>  GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>  GRUB2_LICENSE = GPL-3.0+
> @@ -13,32 +13,6 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
>  HOST_GRUB2_DEPENDENCIES = host-bison host-flex
>  GRUB2_INSTALL_IMAGES = YES
[--SNIP--]
> -# 0002-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
> -GRUB2_IGNORE_CVES += CVE-2020-10713
> -# 0005-calloc-Use-calloc-at-most-places.patch
> -GRUB2_IGNORE_CVES += CVE-2020-14308
> -# 0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> -GRUB2_IGNORE_CVES += CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
> -# 0019-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> -GRUB2_IGNORE_CVES += CVE-2020-15706
> -# 0028-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> -GRUB2_IGNORE_CVES += CVE-2020-15707
> -# 2021/03/02 security fixes - patches 0029-0149
> -GRUB2_IGNORE_CVES += CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 \
> -	CVE-2020-27779 CVE-2021-3418 CVE-2021-20225 CVE-2021-20233
> -# 0039-acpi-Don-t-register-the-acpi-command-when-locked-dow.patch
> -GRUB2_IGNORE_CVES += CVE-2020-14372

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

>  # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
>  # doesn't exist upstream, but is added by the Redhat/Fedora
>  # packaging. Not applicable to Buildroot.
> -- 
> 2.36.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
