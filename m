Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2ACA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 09:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A710D40B0B;
	Wed, 27 Aug 2025 09:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcYL45liqQ0g; Wed, 27 Aug 2025 09:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AD940A07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AD940A07;
	Wed, 27 Aug 2025 09:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F4E114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 09:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E177B404AF
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 09:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGprHh8crhIs for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 09:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 789D6401DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789D6401DA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 789D6401DA
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 09:58:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1585449751; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Aug 2025 09:58:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urCv1-0034yF-0a;
 Wed, 27 Aug 2025 11:58:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  stephane.viau@oss.nxp.com,
 festevam@gmail.com,  maeva.manuel@oss.nxp.com,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20250827010754.1861172-1-Mr.Bossman075@gmail.com>
Date: Wed, 27 Aug 2025 11:58:15 +0200
In-Reply-To: <20250827010754.1861172-1-Mr.Bossman075@gmail.com> (Jesse Taube's
 message of "Tue, 26 Aug 2025 21:07:54 -0400")
Message-ID: <87h5xtkrwo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XyBfQTnv2cGmAO2IoFyeNgEQmsLz0xpQPiQnsqaI+FBTyENmoCz2yb/hTCZr3j2HdiEWptuzecqf63T2xJ29/Xy+byhvZZB6+ViB4H0pSCTZtziEt+xnLZrAG4gAvD4styaSNAuz8B4ozGH4TJbeEOLU7dh2oHbXgUQPReA6dpIIEmIfelQNJeSiSp75uFOVI63XpnwSlLkt8zAcU2vMONX8Ni8bf5KxK0sJUvtGpiIPa6fWHKl4OnrErFlHlmaakJiF/sX7G2EmGUhB8XHiQQ4JKpWCE46zlw4fY1h1y6deG+qArH9bdNg8IAhk1tyCw5FJzfIJ8tgnfyX7folqwg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=EVsJhv4qkNErmY2otSy+x8E6W0k0wTqfbkYAlo5aRuI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XyBfQTnv
Subject: Re: [Buildroot] [PATCH] configs/imxrt1050-evk: Check hashes,
 use bootlin toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jesse" == Jesse Taube <mr.bossman075@gmail.com> writes:

 > This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y in the
 > defconfig, bumps kernel to 6.12.43, and adds custom hash files.
 > The exception entry in .checkpackageignore is also removed.

 > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
 > ---
 >  .checkpackageignore                                       | 1 -
 >  .../imxrt1050evk/patches/linux-headers/linux-headers.hash | 1 +
 >  board/freescale/imxrt1050evk/patches/linux/linux.hash     | 2 ++
 >  board/freescale/imxrt1050evk/patches/uboot/uboot.hash     | 2 ++
 >  configs/imxrt1050-evk_defconfig                           | 8 ++++++--
 >  5 files changed, 11 insertions(+), 3 deletions(-)
 >  create mode 100644 board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
 >  create mode 100644 board/freescale/imxrt1050evk/patches/linux/linux.hash
 >  create mode 100644 board/freescale/imxrt1050evk/patches/uboot/uboot.hash

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index 4591ff173a..b9270da630 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -156,7 +156,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 >  configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 >  configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 >  configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 > -configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
 >  configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 >  configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 >  configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 > diff --git a/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash b/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
 > new file mode 100644
 > index 0000000000..0cbef7998e
 > --- /dev/null
 > +++ b/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
 > @@ -0,0 +1 @@
 > +../linux/linux.hash


Strangely enough this was not marked as a symlink (mode should be
120000). Fixed that and committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
