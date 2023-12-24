Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32760C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 10:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5D84168E;
	Sun, 24 Dec 2023 10:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5D84168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ySruFqHHfRTI; Sun, 24 Dec 2023 10:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1365D416AA;
	Sun, 24 Dec 2023 10:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1365D416AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85B291BF5DC
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C64E81EA6
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C64E81EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7_rv1kVteQz for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 10:26:06 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4D2281B23
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4D2281B23
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B454B0037C;
 Sun, 24 Dec 2023 11:25:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 11:25:59 +0100
Date: Sun, 24 Dec 2023 11:25:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYgHN34emCUQspj4@landeda>
References: <20231223203032.1598109-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223203032.1598109-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703413562;
 bh=K/Oy+nknu9/+YO07PssUTbl3aR++1RXDWyF5WLeRbr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGOl7GsbhTwNq+MDE/Z/7eVNRAnuW30sdrbkKHOt9gjALHbE/GPaX9Z5nbplnkiwo
 cd3TSJRR9JNVuEKV/HdFWbtUNGEz081yA6oPCxxQ4u4PniramqDn9UF+sy5TjC646k
 cZKsp/dSNAmTiFj1EZCAUp3sJM/O2rv1SNmpkCzj5VejIMkl0Vhyr9dE3Z/63nU/4Z
 OKhgjV2FH6NwSLBKLtADCLQ3FZJP4KrHRKvjCViloz7D74vSBlEYKZ8ZBDVZAthBNr
 C+NP4qN+XXIhC8yOGZxGXdlaDecR8/rHMLsFPE6dCGNISffjIq5X7zAvuIIQc3y17G
 MldNruY6pdhmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FGOl7Gsb
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: needs host-gawk
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-12-23 21:30 +0100, Julien Olivain spake thusly:
> grub2 build is failing, when compiled on host system not including
> gawk and host-gawk is not built by another package before. This can
> be the the case on current Buildroot Docker image, based on Debian,
> which includes mawk.
> 
> grub2 was updated in commit 5baf1ffe7e "boot/grub2: bump to version
> 2.12". This version includes the commit [1], which introduced the use
> of the asorti() awk function. This function is a specific gawk
> builtin extension. See [2].
> 
> This commit fixes this issue by adding host-gawk as a dependency.
> 
> Fixes:
> 
>     mawk: ../../grub-core/genmoddep.awk: line 110: function asorti never defined
>     make[4]: *** [Makefile:49030: moddep.lst] Error 1
>     make[4]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc/grub-core'
>     make[3]: *** [Makefile:28116: all] Error 2
>     make[3]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc/grub-core'
>     make[2]: *** [Makefile:11714: all-recursive] Error 1
>     make[2]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc'
>     make[1]: *** [Makefile:3547: all] Error 2
>     make[1]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc'
>     make: *** [package/pkg-generic.mk:283: /buildroot/output/build/grub2-2.12/.stamp_built] Error 2
> 
> [1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=87648e9c12a32bddb005b899edc44c2c9c63df82
> [2] https://www.gnu.org/software/gawk/manual/gawk.html#Sorting-Array-Values-and-Indices-with-gawk
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/grub2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index b9be826885..4430aebd59 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -9,8 +9,8 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
>  GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>  GRUB2_LICENSE = GPL-3.0+
>  GRUB2_LICENSE_FILES = COPYING
> -GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
> -HOST_GRUB2_DEPENDENCIES = host-bison host-flex
> +GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2
> +HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
>  GRUB2_INSTALL_IMAGES = YES
>  
>  # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
