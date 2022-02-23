Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39C5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 10:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54D1260F47;
	Wed, 23 Feb 2022 10:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmJRlZATrY1L; Wed, 23 Feb 2022 10:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC1F60AED;
	Wed, 23 Feb 2022 10:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2690D1BF3FF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 10:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E2540195
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 10:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBxJjILDWnAD for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 10:10:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D03E40147
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 10:10:20 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21NAA7Vn072588;
 Wed, 23 Feb 2022 18:10:07 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 23 Feb 2022 18:10:03 +0800
Date: Wed, 23 Feb 2022 18:09:08 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YhYHxAZuz+wY4Nl+@APC323>
References: <20220223071049.21153-1-peterlin@andestech.com>
 <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21NAA7Vn072588
Subject: Re: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> On Wed, Feb 23, 2022 at 10:19:08AM +0100, Giulio Benetti wrote:
> > Hi Peter,
> > 
> > On 23/02/22 08:10, Yu Chien Peter Lin wrote:
> > > Rename ae3xx to ae300 for nds32 architecture and add ae350 platform.
> > > 
> > > AE300 (NDS32):
> > > - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
> > > AE350 (RISC-V):
> > > - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/
> > > 
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > Signed-off-by: Alan Kao <alankao@andestech.com>
> > > ---
> > > Changes v1 -> v2:
> > >     - move linux source code and its patches to AndesTech Github repo
> > >     - rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
> > >     - change C library to uClibc
> > >     - remove OpenSSL package
> > >     - remove rootfs.cpio and rootfs.tar
> > >     - update DEVELOPERS
> > > Changes v2 -> v3:
> > >     - specifiy branch to download from AndesTech linux repo
> > >     - change boot.cmd to extlinux.conf
> > >     - add post-build.sh for extlinux.conf to retrieve Image and DTB
> > >     - fix format and update genimage_sdcard.cfg
> > >     - update readme.txt
> > >     - add packages (python3, pylibfdt and openssl) for u-boot binman
> > >     - reorder item in DEVELOPERS
> > > Changes v3 -> v4:
> > >     - rename ae3xx folder to ae300
> > >     - rename andes_ae3xx_defconfig to andes_ae300_defconfig
> > >     - update readme.txt and item in DEVELOPERS
> > 
> > Some of these change ^^^ must have been moved to the single patch, like
> > DEVELOPERS is updated in patch 3/3. I've also forgotten to point you to add
> > a --cover-letter, so keep in mind both points for next time.
> > 
> > I've built tested both defconfig successfully, so:
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > [Giulio: build tested only]
> > 
> > And the other patches of this series is all reviewed, so to me it's ready to
> > be committed, but this will happen after Buildroot 2022.02 is released,
> > since between rc1 to the release Maintainers only accept fixes. Another
> > possibility is that they will commit these patches to next branch.
> > 
> > Please remember to tag V3.
> > 
> > Thank you for your effort!
> > 
> > Best regards
> > -- 
> > Giulio Benetti
> > Benetti Engineering sas

Thanks for reviewing my patches and the guidance.
I will make a new patch for the Config.in,
The last question, is it tag V5 for the next submission?

Regards,
Yu Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
